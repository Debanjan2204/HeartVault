<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="com.DAO.CustomerDAO" %>
<%@page import="com.model.Customer" %>
<%@page import="java.time.format.DateTimeFormatter" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
	
	 session= request.getSession(false);
	 Customer c=null;
	 Object sess=session.getAttribute("Cust");
	 if(sess==null){
		 response.sendRedirect("login.jsp");
	 }
%>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HeartVault | Customer Dashboard</title>
  <link rel="stylesheet" href="stylesheet/customer_dashboard_style.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body data-bs-theme="dark">
    <nav class="navbar navbar-expand-lg sticky-top py-1">
        <div class="container">
            <a class="navbar-brand" href="index.jsp"><img class="logo" src="assets/LOGO.png" alt="LOGO"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4" href="#" data-bs-toggle="modal" data-bs-target="#transferMoneyModal">Transfer Money</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4" href="ViewTransaction.jsp">Transaction History</a>
                    </li>
                    <li class="mx-3"></li>
                    <li class="nav-item dropdown">
                        <a id="profile-dropdown" class="nav-link dropdown-toggle py-0" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <img class="profile-logo" src="assets/avfa3ii00.jpg" alt="profile">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="nav-link navbar-item px-lg-4" data-bs-toggle="modal" data-bs-target="#editCustomerModal" href="#">Edit Details</a>
                            <div class="dropdown-divider"></div>
                            <a class="nav-link navbar-item px-lg-4 text-small" data-bs-toggle="modal" data-bs-target="#changePasswordModal" href="#">Change Password</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="CustLogoutServlet">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<%	 if(sess!=null){
	c=CustomerDAO.searchByAccNumber(Long.parseLong(sess.toString())); 
	}
else{
	c=new Customer();
}
	%>

    <div class="overlay"></div>
    <div class="container_1">
        <div class="mb-4 text-center">
            <!-- Displaying Customer Name and Account Number dynamically -->
            <h2 id="welcomeMessage">WELCOME <%= c.getfName() %><br><!-- ()--></h2>
             <h4>Balance: Rs.<%=c.getInitialBal() %></h4>
          </div>
        
        <div class="card customer-details-card mb-4" style="background-color: #293349">
            <div class="card-header">
                <h3 class="card-title">Basic Details</h3>
            </div>
            <div class="card-body text-center">
                <p><strong>Phone Number:</strong> <%= c.getContactNo() %></p>
                <p><strong>Email:</strong> <%= c.getEmail()%></p>
                <p><strong>Date of Birth: </strong><% DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy");%><%=  c.getdob().format(formatter)%></p>
                <p><strong>Aadhar Number:</strong><%= c.getAadharNo() %></p>
                <p><strong>PAN Number:</strong> <%= c.getPanNo()%></p>
                <p><strong>SSN ID:</strong><%=c.getSsnNo() %></p>
                <p><strong>Address:</strong> <%=c.getAddress() %></p>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editCustomerModal" tabindex="-1" aria-labelledby="editCustomerModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCustomerModalLabel">Edit Your Details</h5>
                    <button type="button" id="editModalClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editCustomerForm" action="EditCustomerDetailServlet" method="post">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="editName" class="form-label">First Name</label>
                                <input type="text" id="editfName" class="form-control" value="<%=c.getfName() %>" name="fname" maxlength="15" pattern="^[A-Za-z\s]+$" title="Only letters and spaces are allowed" oninput="this.value = this.value.replace(/[0-9]/g, ''); this.setCustomValidity(''); if (!this.checkValidity()) this.setCustomValidity('Please enter only letters');" required>
                            </div>
                            <div class="col-md-6">
                                <label for="editName" class="form-label">Last Name</label>
                                <input type="text" id="editlName" class="form-control" value="<%=c.getlName() %>" name="lname" maxlength="15" pattern="^[A-Za-z\s]+$" title="Only letters and spaces are allowed" oninput="this.value = this.value.replace(/[0-9]/g, ''); this.setCustomValidity(''); if (!this.checkValidity()) this.setCustomValidity('Please enter only letters');" required>
                            </div>
                            <div class="col-md-6">
                                <label for="editPhone" class="form-label">Phone Number</label>
                                <input type="text" id="editPhone" class="form-control" value="<%= c.getContactNo() %>" maxlength="10" oninput="this.value=this.value.replace(/[^0-9]/g,'')" name="contact" required>
                            </div>
                            <div class="col-md-6">
                                <label for="editEmail" class="form-label">Email</label>
                                <input type="email" id="editEmail" class="form-control" value="<%= c.getEmail()%>" name="email" required>
                            </div>
                            <div class="col-md-6">
                                <label for="editDob" class="form-label">Date of Birth</label>
                                <input type="date" id="editDob" class="form-control" value="<%= c.getdob()%>" name="dob" required>
                            </div>
                            <div class="col-md-6">
                                <label for="editAccountNumber" class="form-label">Account Number</label>
                                <input type="text" id="editAccountNumber" class="form-control" value="<%= c.getAccountNo() %>" disabled>
                            </div>
                            <div class="col-md-6">
                                <label for="editAadhar" class="form-label">Aadhar Number</label>
                                <input type="text" id="editAadhar" class="form-control" value="9<%= c.getAadharNo()%>" disabled>
                            </div>
                            <div class="col-md-6">
                                <label for="editPan" class="form-label">PAN Number</label>
                                <input type="text" id="editPan" class="form-control" value="<%= c.getPanNo() %>" disabled>
                            </div>
                            <div class="col-md-6">
                                <label for="editSSN" class="form-label">SSN ID</label>
                                <input type="text" id="editSSN" class="form-control" value="<%= c.getSsnNo()%>" disabled>
                            </div>
                            <div class="col-md-6">
                                <label for="editAddress" class="form-label">Address</label>
                                <input type="text" id="editAddress" class="form-control" value="<%= c.getAddress()%>" name="address" required>
                            </div>
                        </div>
                       
                        <div class="mt-4">
                            <button type="submit" class="btn btn-success">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- Transfer Money Modal -->
    <div class="modal fade" id="transferMoneyModal" tabindex="-1" aria-labelledby="transferMoneyModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="transferMoneyModalLabel">Transfer Money</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="transferMoneyForm" action="TransferMoneyServlet" method="post">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="transferAccountNumber" class="form-label">Account Number</label>
                                <input type="text" id="transferAccountNumber" class="form-control" value="<%=c.getAccountNo() %>" name="acc" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="transferSSN" class="form-label">SSN ID</label>
                                <input type="text" id="transferSSN" class="form-control" value="<%=c.getSsnNo() %>" readonly>
                            </div>
                            <div class="col-md-6">
                                <label for="transferAmount" class="form-label">Amount to Transfer</label>
                                <input type="number" id="transferAmount" max="100000" class="form-control" name="amount"  required>
                            </div>
                            <div class="col-md-6">
                                <label for="beneficiaryAccount" class="form-label">Beneficiary Account Number</label>
                                <input type="text" id="beneficiaryAccount" class="form-control" maxlength="15" oninput="this.value=this.value.replace(/[^0-9]/g,'')" name="benefAcc" required>
                            </div>
                        </div>
                        <div class="mt-4">
                            <button type="submit" class="btn btn-success">Transfer</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

<!-- Change Password Modal -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changePasswordModalLabel">Change Password</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="changePasswordForm" action="ChangePasswordServlet" method="post">
                    <div class="mb-3">
                        <label for="oldPassword" class="form-label">Old Password</label>
                        <input type="password" id="oldPassword" class="form-control" name="oldPassword" required>
                    </div>
                    <div class="mb-3">
                        <label for="newPassword" class="form-label">New Password</label>
                        <input type="password" id="newPassword" class="form-control" name="newPassword" required>
                    </div>
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirm New Password</label>
                        <input type="password" id="confirmPassword" class="form-control" name="confirmPassword" required>
                    </div>
                    <div class="mt-4 text-center">
                        <button type="submit" class="btn btn-primary">Change Password</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

	<!-- Success/Error Message Modal -->
	<div class="modal fade" id="MessageModal" tabindex="-1" aria-labelledby="successMessageModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="MessageModalLabel"></h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body">
	          <p id="MessageContent" class=""></p>
	        </div>
	      </div>
	    </div>
	  </div>
  
  
    <footer class="sticky-bottom">
        <p>&copy; 2025 Bank Management System. All rights reserved.</p>
    </footer>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  
  <%
  if(session.getAttribute("saveSuccess")=="true")
  {%>
  const successMessage = `
      <strong>Account successfully Saved!</strong><br>
    `;
    document.getElementById('MessageContent').innerHTML = successMessage;
    document.getElementById('MessageContent').classList.add("text-success");
    document.getElementById('MessageContent').classList.remove("text-warning");
    
    document.getElementById('MessageModalLabel').innerHTML ="SUCCESS";
    document.getElementById('MessageModalLabel').classList.add("text-success");
    document.getElementById('MessageModalLabel').classList.remove("text-warning");
    
    // Show the success modal
    const successModal = new bootstrap.Modal(document.getElementById('MessageModal'));
    successModal.show();
  <%
  session.removeAttribute("saveSuccess");
  }%>
<%
  if(session.getAttribute("saveError")=="true"){%>
  const successMessage = `
      <strong> ERROR IN ACCOUNT EDITING !</strong><br>
    `;
    document.getElementById('MessageContent').innerHTML = successMessage;
    document.getElementById('MessageContent').classList.add("text-warning");
    document.getElementById('MessageContent').classList.remove("text-success");
    
    document.getElementById('MessageModalLabel').innerHTML ="ERROR";
    document.getElementById('MessageModalLabel').classList.add("text-warning");
    document.getElementById('MessageModalLabel').classList.remove("text-success");
    
    // Show the success modal
    const successModal = new bootstrap.Modal(document.getElementById('MessageModal'));
    successModal.show();
  <%
  session.removeAttribute("saveError");
  }

  %>
  
  
  
  <%
  if(session.getAttribute("transferSuccess")!=null)
  {%>
  const successMessage = `
      <strong>Amount successfully Transfered!</strong><br>
    `;
    document.getElementById('MessageContent').innerHTML = successMessage;
    document.getElementById('MessageContent').classList.add("text-success");
    document.getElementById('MessageContent').classList.remove("text-warning");
    
    document.getElementById('MessageModalLabel').innerHTML ="SUCCESS";
    document.getElementById('MessageModalLabel').classList.add("text-success");
    document.getElementById('MessageModalLabel').classList.remove("text-warning");
    
    // Show the success modal
    const successModal = new bootstrap.Modal(document.getElementById('MessageModal'));
    successModal.show();
  <%
  session.removeAttribute("transferSuccess");
  }%>
  
  <%
  if(session.getAttribute("transferError")!=null)
  {%>
  const successMessage = `
      <strong>Error IN Transfereing Amount!</strong><br> Check Beneficiary account.
    `;
    document.getElementById('MessageContent').innerHTML = successMessage;
    document.getElementById('MessageContent').classList.add("text-warning");
    document.getElementById('MessageContent').classList.remove("text-success");
    
    document.getElementById('MessageModalLabel').innerHTML ="ERROR";
    document.getElementById('MessageModalLabel').classList.add("text-warning");
    document.getElementById('MessageModalLabel').classList.remove("text-success");
    
    // Show the success modal
    const successModal = new bootstrap.Modal(document.getElementById('MessageModal'));
    successModal.show();
  <%
  session.removeAttribute("transferError");
  }%>
  
  <%
  if(session.getAttribute("balanceError")!=null)
  {%>
  const successMessage = `
      <strong>LOW BALANCE !!!</strong><br> Cannot transfer the amount. Minimum Balance should be Rs.500
    `;
    document.getElementById('MessageContent').innerHTML = successMessage;
    document.getElementById('MessageContent').classList.add("text-warning");
    document.getElementById('MessageContent').classList.remove("text-success");
    
    document.getElementById('MessageModalLabel').innerHTML ="ERROR";
    document.getElementById('MessageModalLabel').classList.add("text-warning");
    document.getElementById('MessageModalLabel').classList.remove("text-success");
    
    // Show the success modal
    const successModal = new bootstrap.Modal(document.getElementById('MessageModal'));
    successModal.show();
  <%
  session.removeAttribute("balanceError");
  }%>
  
  <%
  if(session.getAttribute("sameAccError")!=null)
  {%>
  const successMessage = `
      <strong>Error IN Transfer !!!</strong><br> Beneficiary cannot be same as Sender.
    `;
    document.getElementById('MessageContent').innerHTML = successMessage;
    document.getElementById('MessageContent').classList.add("text-warning");
    document.getElementById('MessageContent').classList.remove("text-success");
    
    document.getElementById('MessageModalLabel').innerHTML ="ERROR!!";
    document.getElementById('MessageModalLabel').classList.add("text-warning");
    document.getElementById('MessageModalLabel').classList.remove("text-success");
    
    // Show the success modal
    const successModal = new bootstrap.Modal(document.getElementById('MessageModal'));
    successModal.show();
  <%
  session.removeAttribute("sameAccError");
  }%>
  
  
  
  <%
  if(session.getAttribute("passSuccess")=="true")
  {%>
  const successMessage = `
      <strong>Password Changed successfully !</strong><br>
    `;
    document.getElementById('MessageContent').innerHTML = successMessage;
    document.getElementById('MessageContent').classList.add("text-success");
    document.getElementById('MessageContent').classList.remove("text-warning");
    
    document.getElementById('MessageModalLabel').innerHTML ="SUCCESS";
    document.getElementById('MessageModalLabel').classList.add("text-success");
    document.getElementById('MessageModalLabel').classList.remove("text-warning");
    
    // Show the success modal
    const successModal = new bootstrap.Modal(document.getElementById('MessageModal'));
    successModal.show();
  <%
  session.removeAttribute("passSuccess");
  }%>
<%
  if(session.getAttribute("passError")=="true"){%>
  const successMessage = `
      <strong> ERROR IN PASSWORD CHANGING !</strong><br>
    `;
    document.getElementById('MessageContent').innerHTML = successMessage;
    document.getElementById('MessageContent').classList.add("text-warning");
    document.getElementById('MessageContent').classList.remove("text-success");
    
    document.getElementById('MessageModalLabel').innerHTML ="ERROR";
    document.getElementById('MessageModalLabel').classList.add("text-warning");
    document.getElementById('MessageModalLabel').classList.remove("text-success");
    
    // Show the success modal
    const successModal = new bootstrap.Modal(document.getElementById('MessageModal'));
    successModal.show();
  <%
  session.removeAttribute("passError");
  }

  %>
  
  </script>
</body>
</html>