package com.logout;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CustLogoutServlet
 */
@WebServlet("/CustLogoutServlet")
public class CustLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the session if it exists
        HttpSession session = request.getSession(false);
        session.removeAttribute("Cust");
        session.invalidate();
        // Redirect to login page
        response.sendRedirect("login.jsp");
    }

}
