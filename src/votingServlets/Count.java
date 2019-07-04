package votingServlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.logging.FileHandler;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Count extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student"); // get
		// student
		// attribute
		// from
		// the
		// session
		String status = student.getStatus();
		if(status=="voted"){
			
			response.sendRedirect("countdown.jsp");
		}else{

		String regNo = student.getRegNo();
		String fName = student.getFirstName();
		String lName = student.getLastName();
		System.out.println("counting");
		DBCredentials db = new DBCredentials();
	    Logger logger = Logger.getLogger(Count.class.getName());
		Handler fileHandler = new FileHandler("C:/Users/shaddy/Desktop/java EE/Log Files/"+fName+" "+lName+".log");  
		logger.addHandler(fileHandler);
		SimpleFormatter formatter = new SimpleFormatter();
		fileHandler.setFormatter(formatter);
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection conn = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPassword());
			Statement stmt = conn.createStatement();
			
			
			

			Enumeration params = request.getParameterNames(); // get position
																// names
																// selected by
																// voter
			while (params.hasMoreElements()) {
				String paramName = (String) params.nextElement(); // get
																	// contestant
																	// voted for
				String paramValue = request.getParameter(paramName);
				String[] names = paramValue.split("_"); // store the first and
														// last name of the
														// contestant in an
														// array
				String query = "update contestants set votes=votes+1 where firstname ='" + names[0] + "'and lastname='"
						+ names[1] + "'";
				stmt.execute(query);
				
				logger.log(Level.INFO, student.getRegNo()+" voted for "+ names[0]+" "+names[1]);
			}
			
			
			System.out.println(student);
			
			String query2 = "update verification set status=true where regno='" + regNo + "'";

			student.setStatus(true);
			stmt.execute(query2);

			response.sendRedirect("countdown.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	}
}
