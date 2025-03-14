<%@page import="com.DAO.CustomerDAO"%>
<%@page import="com.DAO.AdminDAO"%>
<%@ page import="java.util.List, java.util.Collections, java.util.Comparator" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.model.Transaction_table" %> <!-- Change this to your actual package -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");

 session= request.getSession(false);
 List<Transaction_table> Table=null;
 

 if(session.getAttribute("admin")==null){
	 response.sendRedirect("login.jsp?admin=true");
 }
 
    // Retrieve customer list from DAO
    
	    Table = AdminDAO.viewTransTable();
    if (Table == null) Table = Collections.emptyList();



    // Pagination
    int Page= 1;
    int rowsPerPage = 5;
    if (request.getParameter("page") != null) {
        Page = Integer.parseInt(request.getParameter("page"));
    }
    int totalRows = Table.size();
    int totalPages = (int) Math.ceil((double) totalRows / rowsPerPage);
    int start = (Page - 1) * rowsPerPage;
    int end = Math.min(start + rowsPerPage, totalRows);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="wAccth=device-wAccth, initial-scale=1.0">
    <title>Bank Account Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="stylesheet/ViewAllTable_styles.css">
    <style>
        body { background: url('assets/hero_1.jpg') no-repeat center center fixed; background-size: cover; }
        .table-dark-custom { background-color: rgba(20, 40, 70, 0.95); color: white; }
        .table-dark-custom th, .table-dark-custom td { background-color: rgba(20, 40, 70, 0.95); !important; color: white; border-color: #444; }
        .pagination { display: flex; justify-content: center; margin-top: 10px; }
        .page-item { cursor: pointer; padding: 5px 15px; background-color: rgba(2, 27, 63, 0.95); color: white; margin: 2px; border-radius: 5px; }
        .page-item.active { background-color: #007bff; }
    </style>
</head>
<body data-bs-theme="dark">
<nav class="navbar navbar-expand-lg sticky-top py-1">
      <div class="container">
        <a class="navbar-brand" href="index.jsp"
          ><img class="logo" src="assets/LOGO.png" alt="LOGO"
        /></a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link navbar-item px-lg-4" href="admin_dashboard.jsp"> &#8592 Back</a>
           
            </li>
            <li class="mx-3"><!--SPACER ELEMENT--></li>
            <li class="nav-item dropdown">
              <a
                id="profile-dropdown"
                class="nav-link dropdown-toggle py-0"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <img
                  class="profile-logo"
                  src="assets/avfa3ii00.jpg"
                  alt="profile"
                />
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="AdminLogoutServlet">Logout</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>


<div class="overlay"></div>
<div class="container_1 mt-5">
    <h2 class="text-center">Bank Account Management</h2>


    <!-- Table -->
    <table class="table table-dark-custom text-center mt-3">
        <thead>
            <tr>
                <th>#</th>
                <th>Trans_id</th>
                <th>Acc_Number</th>
                <th>Transaction_amount</th>
                <th>Trans_date</th>
                <th>Benef_Acc_No</th>
            </tr>
        </thead>
        <tbody>
            <% for (int i = start; i < end; i++) { Transaction_table t = Table.get(i); %>
                <tr>
                    <td><%= i+1 %></td>
                    <td><%= t.getTrans_Id() %></td>
                    <td><%= t.getAccountNo() %></td>
                    <td><%= t.getAmount() %></td>
                    <td><%= t.getTrans_date() %></td>
                    <td><%= t.getBenef_AccNum() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="pagination">
        <% for (int i = 1; i <= totalPages; i++) { %>
            <a href="?page=<%= i %>" 
               class="page-item <%= (i == Page) ? "active" : "" %>" style="text-decoration:none"><%= i %></a>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
