package com.login;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.CustomerDAO;

@WebServlet("/CustLoginServlet")

public class CustLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	        long bankAcc = Long.parseLong(request.getParameter("bankAcc"));
	        String password = request.getParameter("password");
	        String Name=null;
	        try {
	        Name=CustomerDAO.logIn(bankAcc, password);
	        }catch(Exception e) {
	        	e.printStackTrace();
	        }
	        HttpSession session = request.getSession();
	        if (Name!=null) {
	            session.setAttribute("Cust", bankAcc);
	            response.sendRedirect("customer_dashboard.jsp");
	        } else {
	            session.setAttribute("custLoginError", "Invalid credentials!");
	            response.sendRedirect("login.jsp");	        }
	    }
}
