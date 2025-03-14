package com.login;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.AdminDAO;

@WebServlet("/AdminLoginServlet")

public class AdminLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	        int empID = Integer.parseInt(request.getParameter("empID"));
	        String password = request.getParameter("password");
	        String adminName=null;
	        try {
	        adminName=AdminDAO.logIn(empID, password);
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        HttpSession session = request.getSession();
	        if (adminName!=null) {
	            session.setAttribute("admin", empID);
	            session.setAttribute("adminName", adminName);
	            response.sendRedirect("admin_dashboard.jsp");
	        } else {
	            session.setAttribute("adminLoginError", "Invalid credentials!");
	            response.sendRedirect("login.jsp?admin=true");	        }
	    }
}
