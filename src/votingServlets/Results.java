package votingServlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Results extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<String> positions = Arrays.asList("chairman", "vice-chairman", "security", "entertainment", "buruburu",
				"tatton", "science", "agriculture");
		List<Position> posList = new ArrayList<>();
		

		DBCredentials db = new DBCredentials();
		HttpSession session = request.getSession();

		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection conn = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPassword());
			Statement stmt = conn.createStatement();

			for (String posName : positions) {
				List<Contestant> contList = new ArrayList<>();
				String query = "select firstname,lastname,votes from contestants join positions on "
						+ "positions.id=contestants.pos_id where positions.position = '" + posName
						+ "' order by votes desc";
				ResultSet result = stmt.executeQuery(query);
				while (result.next()) {
					String fName = result.getString(1);
					String lName = result.getString(2);
					int votes = result.getInt(3);

					Contestant contestant = new Contestant(fName, lName, votes);
					contList.add(contestant);

				}
				Position position = new Position(posName, contList);
				posList.add(position);
			}

			session.setAttribute("posList", posList);
			response.sendRedirect("results.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
