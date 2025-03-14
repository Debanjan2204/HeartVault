package com.AdminDashboard;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Customer;
import com.DAO.AdminDAO;

@WebServlet("/SearchCustomerServlet")
public class SearchCustomerServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			PrintWriter out= response.getWriter();
			out.print("fihgfs");
			long bankAcc = Long.parseLong(request.getParameter("bankAcc"));
	        System.out.println(bankAcc);
	        Customer c= AdminDAO.searchByAccNumber(bankAcc);
	        HttpSession session= request.getSession();
	        
	        if(c!= null) {
	        	session.setAttribute("CustData", c);
	        	response.sendRedirect("SearchCustomer.jsp");
	        }
	        else {
	        	session.setAttribute("CustData", null);
	        	session.setAttribute("CustDataFound", "false");
	        	response.sendRedirect("admin_dashboard.jsp");
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}