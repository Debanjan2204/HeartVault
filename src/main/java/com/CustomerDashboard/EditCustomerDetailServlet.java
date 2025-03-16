package com.CustomerDashboard;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.DAO.CustomerDAO;
import com.PasswordUtil.PasswordUtils;
import com.model.Customer;


@WebServlet("/EditCustomerDetailServlet")
public class EditCustomerDetailServlet extends HttpServlet{
 
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		try {
		HttpSession session= request.getSession(false);
		Customer c=CustomerDAO.searchByAccNumber(Long.parseLong(session.getAttribute("Cust").toString()));
		c.setfName(request.getParameter("fname"));
		c.setlName(request.getParameter("lname"));
		c.setContactNo(Long.parseLong(request.getParameter("contact")));
		c.setEmail(request.getParameter("email"));
		c.setdob(LocalDate.parse(request.getParameter("dob")));
		c.setAddress(request.getParameter("address"));
		
//		String hashedPassword = PasswordUtils.hashPassword(request.getParameter("password"));
//		c.setPassword(hashedPassword);
		
		String rows=CustomerDAO.saveDetails(c);
		if(rows!=null) {
//		session.setAttribute("searchCust" , c);
		session.setAttribute("saveSuccess" , "true");
		response.sendRedirect("customer_dashboard.jsp");
		}else{
			session.setAttribute("saveError" , "true");
			response.sendRedirect("customer_dashboard.jsp");
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}