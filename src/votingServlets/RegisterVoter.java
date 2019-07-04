package votingServlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterVoter extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		session.removeAttribute("success");
		session.removeAttribute("error");
		String success = "";
		String error = null;

		Enumeration params = request.getParameterNames();

		String regNo = request.getParameter("regNo");
		String faculty = request.getParameter("faculty");
		System.out.println(faculty);
		String reg = "/{1}\\d{5}/{1}\\d{2}";
		String str2Check = "";
		if (faculty.equals("agriculture")) {
			str2Check = "A12A13A11A12A15AP11AP12AP13AP15A01";
		}
		if (faculty.equals("science")) {
			str2Check = "S12S14S13S11S12S15SP11SP12SP13SP15";
		}
		if (regNo.length() == 12) {
			String sub = regNo.substring(0, 3);
			System.out.println("sub = "+sub);
			System.out.println(str2Check);
			System.out.println(str2Check.contains(sub));
			if (str2Check.contains(sub)) {
				String val = regNo.substring(10, 12);
				int ver = Integer.valueOf(val);
				Date now = new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(now);
				int cyear = cal.get(Calendar.YEAR);
				int detY = ver + 2000;

				if (!(getMatch(reg, regNo) && cyear >= detY)) {
					error = "Invalid registration numberttt..";
				}

			}else{
				error = "Invalid registration number..";
			}

		}
		if (regNo.length() == 13) {
			String sub1 = regNo.substring(0, 4);
			if (str2Check.contains(sub1)) {
				String val = regNo.substring(11, 13);
				int ver = Integer.valueOf(val);
				Date now = new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(now);
				int cyear = cal.get(Calendar.YEAR);
				int detY = ver + 2000;
				// System.out.println("true1");
				if (!(getMatch(reg, regNo) && cyear >= detY)) {
					error = "Invalid registration number..";
				}
			}
			else{
				error = "Invalid registration number..";
			}

		}
		if (regNo.length() == 14) {
			String sub2 = regNo.substring(0, 5);
			if (str2Check.contains(sub2)) {
				String val = regNo.substring(12, 14);
				int ver = Integer.valueOf(val);
				Date now = new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(now);
				int cyear = cal.get(Calendar.YEAR);
				int detY = ver + 2000;

				if (!(getMatch(reg, regNo) && cyear >= detY)) {
					error = "Invalid registration number..";
					
				}
			}
			else{
				error = "Invalid registration number..";
			}

		}
		
		if(error != null){
			session.setAttribute("error", error);
			response.sendRedirect("signup.jsp");
		}else{

		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String residence = request.getParameter("residence");

		DBCredentials db = new DBCredentials();

		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection conn = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPassword());
			Statement stmt = conn.createStatement();
			String query = "insert into verification(firstname,lastname,regno,passwd,residence,faculty,status) values ('"
					+ fName + "','" + lName + "','" + regNo + "','" + regNo + "','" + residence + "','" + faculty + "',"
					+ false + ")";
			stmt.executeUpdate(query);
			success = "Register successful";
			session.setAttribute("success", success);
			response.sendRedirect("signup.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
	}

	public static boolean getMatch(String r, String s) {
		boolean det = false;
		Pattern p = Pattern.compile(r);
		java.util.regex.Matcher match = p.matcher(s);

		while (match.find()) {
			if (match.group().length() != 0) {
				System.out.println(match.group().trim());
				det = true;
			}
		}
		return det;
	}
}
