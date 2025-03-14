package com.CustomerDashboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.DAO.AdminDAO;
import com.DAO.CustomerDAO;
import com.PasswordUtil.PasswordUtils;
import com.model.Customer;


@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		HttpSession session=request.getSession(false);
		Customer c=CustomerDAO.searchByAccNumber(Long.parseLong(session.getAttribute("Cust").toString()));
		String OldPassword=request.getParameter("oldPassword");
		String NewPassword=request.getParameter("newPassword");
		String ConfirmPassword=request.getParameter("confirmPassword");
		
		if(PasswordUtils.verifyPassword(c.getPassword(), OldPassword) && NewPassword.equals(ConfirmPassword)) {
			c.setPassword(PasswordUtils.hashPassword(ConfirmPassword));
			AdminDAO.saveDetails(c);
			session.setAttribute("passSuccess", "true");
			response.sendRedirect("customer_dashboard.jsp");
		}
		else {
			session.setAttribute("passError","true");
			response.sendRedirect("customer_dashboard.jsp");

		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	}

}
