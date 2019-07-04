package votingServlets;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Verification extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		DBCredentials db = new DBCredentials();

		String regNo = req.getParameter("regNo");
		String pass = req.getParameter("password");

		String message = "";
		String urlPath = "";
		HttpSession session = req.getSession(); // SESSION
		session.setMaxInactiveInterval(600); // invalidate session if idle for 10
												// minutes
		String user = "";

		if ((regNo.equals("admin")) && (pass.equals("superuser"))) { // check if
																	// user is
																	// an admin
			user = "admin";
			Cookie userName = new Cookie("user",user);  //create cookie
			res.addCookie(userName);
			res.sendRedirect("registration.jsp");
		} else { // check if user is a student

			boolean value = false; // true if user is a student and false
									// otherwise

			try {
				DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				Connection conn = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPassword());
				Statement stmt = conn.createStatement();
				String query = "select regno,passwd from verification";
				ResultSet result = stmt.executeQuery(query); // find the user
																// from the
																// database

				while (result.next()) {
					String regno = result.getString(1);
					String passwd = result.getString(2);
					System.out.println(regno + " " + passwd);
					if ((regNo.equals(regno)) && (pass.equals(passwd))) {
						value = true;
						break; // stop if the user exists in the database
					}
				}

				if (value == true) {
					List<String> positions = new ArrayList<>(); // list to hold
																// the
					// viable position
					// names
					positions.add("chairman");
					positions.add("vice-chairman");
					positions.add("security");
					positions.add("entertainment");

					String query2 = "select firstname,lastname,residence,faculty,status from verification where regno='"
							+ regNo + "'";
					ResultSet result2 = stmt.executeQuery(query2); // get the
																	// user's
																	// residence
																	// and
																	// faculty
																	// from db
					Student student; // declare student object
					String residence = "";
					String faculty = "";
					String fname = "";
					String lname = "";
					boolean status = false;
					while (result2.next()) {
						fname = result2.getString(1);
						lname = result2.getString(2);
						residence = result2.getString(3);
						faculty = result2.getString(4);
						status = result2.getBoolean(5);

						if (status == true) {
							break;
						}
						if (!(residence.equals("non-resident"))) {
							positions.add(residence);
						}
						positions.add(faculty); // add student's faculty to the
												// list of viable position

					}

					if (status == true) {
						user = "student";
						Cookie userName = new Cookie("user",user);  //create cookie
						res.addCookie(userName);
						student = new Student(regNo, fname, lname, residence, faculty, status); // initialize
						// student
						// object
						session.setAttribute("student", student);
						res.sendRedirect("countdown.jsp");
					} else {
						List<Position> pos = new ArrayList<>(); // list to hold
																// all
																// the position
																// objects

						for (String position : positions) {
							List<Contestant> cont = new ArrayList<>(); // list
																		// to
																		// hold
																		// the
																		// contestants
																		// objects
							String query3 = "select image,firstname,lastname from contestants join positions on "
									+ "positions.id=contestants.pos_id where positions.position = '" + position + "'";
							ResultSet result3 = stmt.executeQuery(query3); // get
																			// contestant
																			// details
																			// from
																			// db
							while (result3.next()) {
								Blob image = result3.getBlob(1);

								byte[] bytes = image.getBytes(1, (int) image.length());
								
								String base64image = Base64.getEncoder().encodeToString(bytes);
								
								String fName = result3.getString(2);
								String lName = result3.getString(3);
								Contestant contestant = new Contestant(base64image, fName, lName); // new
																									// Contestant
																									// object
								cont.add(contestant); // add the contestant to
														// the
														// list of contestants
							}
							Position p = new Position(position, cont); // new
																		// Position
																		// object
																		// containing
																		// position
																		// name
																		// and
																		// contestant
																		// object
							System.out.println(p);
							pos.add(p); // add the position object to the list
										// of
										// positions
							System.out.println(p);
						}

						user = "student";
						Cookie userName = new Cookie("user",user);  //create cookie
						res.addCookie(userName);
						session.setAttribute("positions", pos);
						student = new Student(regNo, fname, lname, residence, faculty, status); // initialize
						// student
						// object
						session.setAttribute("student", student);
						res.sendRedirect("vote.jsp");
					}
				} else {
					message = "Wrong Credentials";
					urlPath = "/login.jsp";

					req.setAttribute("message", message);

					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlPath);
					dispatcher.forward(req, res);
				}
				/*
				 * message = "Wrong Credentials"; urlPath = "/login.jsp";
				 * 
				 * req.setAttribute("message", message);
				 * 
				 * RequestDispatcher dispatcher =
				 * getServletContext().getRequestDispatcher(urlPath);
				 * dispatcher.forward(req,res);
				 */
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
}
