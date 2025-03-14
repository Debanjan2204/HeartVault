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
import com.model.Customer;


/**
 * Servlet implementation class ViewAllServlet
 */
@WebServlet("/ViewAllServlet")
public class ViewAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session= request.getSession(false);
			
			List<Customer> t =AdminDAO.viewTable();
			
			session.setAttribute("DetailsTable", t);
			response.sendRedirect("ViewAllTable.jsp");
			}catch(Exception e) {
				e.printStackTrace();
			}
	}

}