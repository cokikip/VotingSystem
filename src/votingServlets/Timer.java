package votingServlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Timer extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		String date = req.getParameter("timer");
		
		TimeSetter timeSetter = new TimeSetter();
		timeSetter.setDate(date);		 
		res.sendRedirect("timeSetter.jsp");
		
	}
}
