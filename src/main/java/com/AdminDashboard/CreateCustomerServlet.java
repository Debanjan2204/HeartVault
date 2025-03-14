package com.AdminDashboard;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDAO;
import com.model.Customer;

@WebServlet("/CreateCustomerServlet")
public class CreateCustomerServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
	HttpSession session=request.getSession(false);
		
	long id = Long.parseLong(request.getParameter("ssn"));
	
	long acc_no = Long.parseLong(AdminDAO.findNxtAccNum());
	

	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");

	char gender = request.getParameter("gender").charAt(0);
	String date=request.getParameter("dob");
	LocalDate DOB = LocalDate.parse(date);
	long contact = Long.parseLong(request.getParameter("contact"));

	String address = request.getParameter("address");

	String aadhar = request.getParameter("aadhar");

	String pan = request.getParameter("pan");

	String email = request.getParameter("email");

//	String pass = request.getParameter("password");
	String pass= "ChangePwd@"+date.split("-")[2]+date.split("-")[1]+date.split("-")[0];

	String accType = request.getParameter("accountType");
	
	float balance = Float.parseFloat(request.getParameter("balance"));
	
	Customer c=new Customer(id,fname,lname,email,address,contact,DOB,gender,accType,aadhar,pan,acc_no,balance,pass);
	String msg= AdminDAO.createCustomer(c);
	
	if(msg.equals("Success")) {
		session.setAttribute("accCreation", "Success");
		response.sendRedirect("admin_dashboard.jsp");
    }
    else {		
		if(msg.equals("Acc number already exsists")) {
			session.setAttribute("accCreation", "accnum exist");
		}else {
			session.setAttribute("accCreation", "othererror");
		}
		response.sendRedirect("admin_dashboard.jsp");
    }
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	}
}
