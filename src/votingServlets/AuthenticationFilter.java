package votingServlets;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public  class AuthenticationFilter implements Filter{

	
 public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException{
	 
	 HttpServletRequest request = (HttpServletRequest) req;
     HttpServletResponse response = (HttpServletResponse) res;
     
     HttpSession session = request.getSession(false);
     
     
    String uri = request.getRequestURI();
    //System.out.println(uri);
     
     if(session == null && !(uri.equals("/VotingSystem/")) && !(uri.equals("/VotingSystem/login.jsp"))){
    	 response.sendRedirect("login.jsp");
     }else{
    	 chain.doFilter(request,response);
     }
     
 }

@Override
public void destroy() {
	// TODO Auto-generated method stub
	
}

@Override
public void init(FilterConfig arg0) throws ServletException {
	// TODO Auto-generated method stub
	
}
	
}
