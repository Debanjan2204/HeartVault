package com.CustomerDashboard;

import java.io.IOException;

import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CustomerDAO;
import com.model.Transaction_table;

@WebServlet("/displayTransactionServlet")
public class displayTransactionServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		try {
		HttpSession session= request.getSession(false);
		long AccNum=(int) session.getAttribute("customer");
		
		List<Transaction_table> t =CustomerDAO.searchTransTable(AccNum);
		
		session.setAttribute("TransactionTable", t);
		response.sendRedirect("ViewTransaction.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
