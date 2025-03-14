package com.CustomerDashboard;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CustomerDAO;
import com.model.Customer;

@WebServlet("/TransferMoneyServlet")
public class TransferMoneyServlet extends HttpServlet {

	/**
	 *  
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
		try {
			
			HttpSession session= request.getSession(false);
//			Customer c=(Customer) session.getAttribute("searchCust");
			long acc=Long.parseLong(request.getParameter("acc"));
			Customer c=CustomerDAO.searchByAccNumber(acc);
			int amount=Integer.parseInt(request.getParameter("amount"));
			long benef_Acc=Long.parseLong(request.getParameter("benefAcc"));
			
			if(c.getAccountNo()==benef_Acc) {
				session.setAttribute("sameAccError", "true");
				response.sendRedirect("customer_dashboard.jsp");
			}else if(c.getAccountNo()!=benef_Acc && c.getInitialBal()-(float)amount>=500.0) {
//				session.setAttribute("balanceError", null);
				 Customer cust=CustomerDAO.transfer(c, amount, benef_Acc);
				 if(cust!=null) {
//					 session.setAttribute("searchCust", cust);
					 session.setAttribute("transferError", null);
					 session.setAttribute("transferSuccess","true");
					 response.sendRedirect("customer_dashboard.jsp");
				 }
				 else {
					 session.setAttribute("transferError", "TRANSFER ERROR");
					 session.setAttribute("transferSuccess",null);
					 response.sendRedirect("customer_dashboard.jsp");
				 }
			}
			else {
				 session.setAttribute("balanceError", "LOW BALANCE");
				 response.sendRedirect("customer_dashboard.jsp");
			 }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}