package votingServlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class Register extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String position = request.getParameter("position");
		String pos = position.substring(1);
		System.out.println(pos);
		System.out.println(fName + " " + lName + " " + position);
		
		DBCredentials db = new DBCredentials();

	
		Part part = request.getPart("image");
		InputStream is = part.getInputStream();

		Connection conn = null;
		try {
			// Blob blob = new SerialBlob(bytes);
			conn = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPassword());
			Statement stmt = conn.createStatement();
			String query = "select id from positions where position = '" + pos + "'";
			ResultSet result = stmt.executeQuery(query);
			int id = 0;
			while (result.next()) {
				id = result.getInt(1);
				System.out.println("id = " + id);
			}
		//	String query2 = "insert into contestants(pos_id,image,firstname,lastname,votes) values(" + id + ",'"
		//			+ fileName + "','" + fName + "','" + lName + "," + 0 + ");";
			PreparedStatement ps = conn.prepareStatement(
					"insert into contestants(pos_id,image,firstname,lastname,votes) values(?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setBinaryStream(2, is);
			ps.setString(3,fName);
			ps.setString(4, lName);
			ps.setInt(5, 0);
			ps.executeUpdate();
		//	stmt.executeUpdate(query2);
			HttpSession session = request.getSession();
			session.removeAttribute("student");
			response.sendRedirect("registration.jsp");
		} catch (SerialException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
