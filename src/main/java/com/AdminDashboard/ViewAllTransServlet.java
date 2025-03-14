package com.AdminDashboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDAO;
import com.model.Transaction_table;


@WebServlet("/ViewAllTransServlet")
public class ViewAllTransServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			HttpSession session= request.getSession(false);
			
			List<Transaction_table> t =AdminDAO.viewTransTable();
			
			session.setAttribute("AllTransactionTable", t);
			response.sendRedirect("ViewAllTransaction.jsp");
			}catch(Exception e) {
				e.printStackTrace();
			}
	}

}