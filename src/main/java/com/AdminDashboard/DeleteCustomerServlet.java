package com.AdminDashboard;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDAO;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
	        HttpSession session= request.getSession(false);
			PrintWriter out= response.getWriter();
			long bankAcc = Long.parseLong(request.getParameter("AccNum").trim());
	        System.out.println(bankAcc);	
			String rows=AdminDAO.deleteCustomer(bankAcc);
			if(rows!=null) {
				session.setAttribute("deleteCustSuccess","true");
			response.sendRedirect("admin_dashboard.jsp");
			}else{
			session.setAttribute("deleteCustFailure","true");
			response.sendRedirect("admin_dashboard.jsp");
			}
	
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	

}