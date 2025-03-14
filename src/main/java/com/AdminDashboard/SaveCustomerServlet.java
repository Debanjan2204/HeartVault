package com.AdminDashboard;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDAO;
import com.model.Customer;

@WebServlet("/SaveCustomerServlet")
public class SaveCustomerServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			HttpSession session=request.getSession(false);
			long acc_num=Long.parseLong(session.getAttribute("custAcc").toString());
			Customer customer=AdminDAO.searchByAccNumber(acc_num);
			//Customer customer= (Customer)session.getAttribute("CustData");
			customer.setfName(request.getParameter("firstName"));
			customer.setlName(request.getParameter("lastName"));
			customer.setContactNo(Long.parseLong(request.getParameter("contact")));
			customer.setEmail(request.getParameter("emailId"));
			customer.setdob(LocalDate.parse(request.getParameter("DOB")));
			customer.setAadharNo(request.getParameter("aadhar"));
			customer.setPanNo(request.getParameter("pan"));
			customer.setAddress(request.getParameter("address"));
			
			String rows=AdminDAO.saveDetails(customer);
			if(rows!=null) {
			session.setAttribute("SaveCustDataSuccess" ,"true");
			response.sendRedirect("admin_dashboard.jsp");
			}else{
				session.setAttribute("SaveCustDataError" ,"true");
				response.sendRedirect("admin_dashboard.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}
}

