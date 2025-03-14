<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.AdminDAO" %>
<%@ page import="com.model.Customer" %>
<%

   // Retrieve account number from form submission
    long acc_Num =Long.parseLong(request.getParameter("accNum"));
	 session.setAttribute("custAcc",acc_Num);
    // Fetch customer details using DAO
    Customer customer = null;
    try{
    if (acc_Num!=0) {
        customer = AdminDAO.searchByAccNumber(acc_Num);
    }
    }
    catch (Exception e){
    	e.printStackTrace();
    }
    finally{
    	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    	response.setHeader("Pragma","no-cache");
    	response.setHeader("Expires","0");
    	
    	 session= request.getSession(false);
    	 if(session.getAttribute("admin")==null){
    		 response.sendRedirect("login.jsp?admin=true");
    	 }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="stylesheet/admin_dashboard_style.css">
    <style>
        body {
            background: url('assets/hero_1.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .container-1 {
            background:  rgba(20, 40, 70, 0.96);
            border-radius: 10px;
            padding: 20px;
            color: white;
        }
    </style>
</head>
<body data-bs-theme="dark">
    <nav class="navbar navbar-expand-lg py-1">
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
                        <a id="profile-dropdown" class="nav-link dropdown-toggle py-0" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <img class="profile-logo" src="assets/avfa3ii00.jpg" alt="profile">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="AdminLogoutServlet">Logout</a>
                        </div>
                    </li>
          </ul>
        </div>
      </div>
    </nav>
<div class="container-1 container my-5 p-5">
    <h4 class="text-center">Customer Details</h4>

    <% if (customer != null) { %>
    <form id="editCustomerForm" action="SaveCustomerServlet" method="post">
        <div class="row g-3">
            <div class="col-md-6">
                <label for="editAccNum" class="form-label">Account Number</label>
                <input type="text" id="editAccNum" class="form-control" value="<%= customer.getAccountNo() %>" name="acc_Num" disabled required>
            </div>
             <div class="col-md-6">
                <label for="editSSNNum" class="form-label">SSN Number</label>
                <input type="text" id="editAccNum" class="form-control" value="<%= customer.getSsnNo() %>"  disabled>
            </div>
            <div class="col-md-6">
                <label for="editFName" class="form-label">First Name</label>
                <input type="text" id="editFName" class="form-control" value="<%= customer.getfName() %>" name="firstName" required>
            </div>
            <div class="col-md-6">
                <label for="editLName" class="form-label">Last Name</label>
                <input type="text" id="editLName" class="form-control" value="<%= customer.getlName() %>" name="lastName" required>
            </div>
            <div class="col-md-6">
                <label for="editPhone" class="form-label">Phone Number</label>
                <input type="tel" id="editPhone" class="form-control" maxlength="10" value="<%= customer.getContactNo() %>"name="contact" required>
            </div>
            <div class="col-md-6">
                <label for="editEmail" class="form-label">Email</label>
                <input type="email" id="editEmail" class="form-control" value="<%= customer.getEmail() %>"name="emailId" required>
            </div>
            <div class="col-md-6">
                <label for="editAadhar" class="form-label">Aadhar Number</label>
                <input type="text" id="editAadhar" class="form-control" maxlength="12" value="<%= customer.getAadharNo() %>"name="aadhar" required>
            </div>
            <div class="col-md-6">
                <label for="editPan" class="form-label">Pan Number</label>
                <input type="text" id="editPan" class="form-control" value="<%= customer.getPanNo() %>" name="pan"required>
            </div>
            <div class="col-md-6">
                <label for="editDob" class="form-label">Date of Birth</label>
                <input type="date" id="editDob" class="form-control" value="<%= customer.getdob() %>" name="DOB"required>
            </div>
            <div class="col-md-6">
                <label for="editGender" class="form-label">Gender</label>
                <input type="text" id="editEmail" class="form-control" value="<%= customer.getGender()%>" required disabled>
            </div>
            <div class="col-md-6">
                <label for="editAccType" class="form-label">Account Type</label>
                <input type="text" id="editDob" class="form-control" value="<%= customer.getAccountType() %>" required disabled>
            </div>
            <div class="col-md-6">
                <label for="editBalance" class="form-label">Balance</label>
                <input type="text" id="editDob" class="form-control" value="<%= customer.getInitialBal() %>" required disabled>
            </div>
            <div class="col-md-12">
                <label for="editAddress" class="form-label">Address</label>
                <input id="editAddress" class="form-control" value="<%= customer.getAddress() %>" name="address" required>
            </div>
        </div>
        <div class="mt-4 text-center">
            <button type="submit" class="btn btn-success">Save Changes</button>
        </div>
    </form>
    <% } else { %>
        <h5 class="text-center text-warning">No customer found for Account Number: <%= acc_Num %></h5>
    <% }
    }%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    