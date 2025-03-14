<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
	
	 session= request.getSession(false);
	 if(session.getAttribute("admin")==null){
		 response.sendRedirect("login.jsp?admin=true");
	 }
%>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HeartVault | Admin Dashboard</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="stylesheet/admin_dashboard_style.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <style type="text/css">
  	body{background: url('assets/hero_1.jpg') no-repeat center center fixed;
      background-size: cover;}
  </style>
</head>
<body data-bs-theme="dark">
    <nav class="navbar navbar-expand-lg sticky-top py-1">
        <div class="container">
            <a class="navbar-brand" href="index.jsp"><img class="logo" src="assets/LOGO.png" alt="LOGO"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <h4 class="text-white mx-5">Welcome <%= session.getAttribute("adminName") %></h4>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                  
                    <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4" href="ViewAllTable.jsp">VIEW ACCOUNTS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4" href="ViewAllTrans.jsp">VIEW TRANSACTION LIST</a>
                    </li>
                    <li class="mx-3"> <!--SPACER ELEMENT--></li>
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

    <div class="overlay"></div>
    <div class="container_1">
      <div class="mb-4">
        <h2 class="text-center">Admin Dashboard</h2>
      </div>
      <div class="d-flex justify-content-around flex-wrap">
        <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#createAccountModal">Create New Account</button>
        <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#searchCustomerModal">Search / Edit Customer Details</button>
        <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteAccountModal">Delete Customer Details</button>
      </div>
    </div>

  <!-- Create Bank Account Modal -->
  <div class="modal fade" id="createAccountModal" tabindex="-1" aria-labelledby="createAccountModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="createAccountModalLabel">Create New Bank Account</h5>
          <button type="button" class="btn-close" id="closeAccModal" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="createAccountForm" action="CreateCustomerServlet" method="post">
            <div class="row g-3">
                <div class="col-md-6">
                  <label for="Fname" class="form-label">First Name</label>
                  <input type="text" id="Fname" name="fname"class="form-control" required>
                </div>
                <div class="col-md-6">
                  <label for="Lname" class="form-label">Last Name</label>
                  <input type="text" id="Lname" name="lname" class="form-control" required>
                </div>
                <div class="col-md-6">
                  <label for="ssn" class="form-label">SSN ID</label>
                  <input type="text" id="ssn" name="ssn" class="form-control" oninput="if(this.value.length > 12) this.value = this.value.substring(0, 12);" maxlength="12" pattern="[0-9]{12}" placeholder="e.g AB123456789C" required>
                </div>
                <div class="col-md-6">
                  <label for="accountType" class="form-label">Account Type</label>
                  <select id="Gender" class="form-select" name="gender" required>
                    <option value="M">Male</option>
                    <option value="F">Female</option>
                  </select>
                </div>
                
                <div class="col-md-6">
                  <label for="number" class="form-label">Phone Number</label>
                  <input type="tel" id="number" class="form-control" maxlength="10" name="contact" oninput="this.value=this.value.replace(/[^0-9]/g,'')" required>
                </div>
                <div class="col-md-6">
                  <label for="accountType" class="form-label">Account Type</label>
                  <select id="accountType" class="form-select" name="accountType" required>
                    <option value="Savings">Savings</option>
                    <option value="Current">Current</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <label for="email" class="form-label">Email</label>
                  <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="col-md-6">
                  <label for="dob" class="form-label">Date of Birth</label>
                  <input type="date" id="dob" class="form-control" name="dob" required>
                </div>
                <div class="col-md-6">
                  <label for="aadhar" class="form-label">Aadhaar Number</label>
                  <input type="text"  id="aadhar" class="form-control" name="aadhar" maxlength="12" required placeholder=" eg. 1234-5678-9012"  oninvalid="this.setCustomValidity('Please enter a valid 12-digit Aadhaar number')" oninput="this.setCustomValidity('')">
                </div>
                <div class="col-md-6">
                  <label for="pan" class="form-label">PAN Number</label>
                  <input type="text" id="pan" class="form-control"  name="pan" maxlength="10" pattern="[A-Z]{5}[0-9]{4}[A-Z]" placeholder="e.g ABCDE1234F" oninput="this.value = this.value.toUpperCase();" required>
                </div>
                <div class="col-md-6">
                  <label for="accbalance" class="form-label"> Initial Account Balance</label>
                  <input type="number" id="AccBalance" name="balance" class="form-control" required placeholder="Enter Account Balance" min="500" oninvalid="this.setCustomValidity('Minimum balance must be at least Rs. 500')" oninput="this.setCustomValidity('')" ><small class="text-warning">Min. Acc Balance should be Rs.500</small>
                </div>
              </div>
                <div class="col-12">
                  <label for="address" class="form-label">Address</label>
                  <input type=text id="address" class="form-control" name="address"  required>
                </div>

              <button type="submit" class="btn btn-success mt-3">Create Account</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Success/Error Message Modal -->
<div class="modal fade" id="successMessageModal" tabindex="-1" aria-labelledby="successMessageModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="successMessageModalLabel">Success</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p id="successMessageContent" class=""></p>
        </div>
      </div>
    </div>
  </div>

  <!-- Search Customer Details Modal -->
  <div class="modal fade" id="searchCustomerModal" tabindex="-1" aria-labelledby="searchCustomerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="searchCustomerModalLabel">Search/Edit Customer Details</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="searchCustomerForm" action="SearchCustomer.jsp" method="post">
            <div class="mb-3">
              <label for="searchSSN" class="form-label">Enter Account Number</label>
              <input type="text" id="searchSSN" class="form-control" name="accNum" maxlength="15" oninput="this.value=this.value.replace(/[^0-9]/g,'')" required>
            </div>
            <button type="submit" class="btn btn-primary mt-3">Search</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Delete Customer Details Modal -->
<div class="modal fade" id="deleteAccountModal" tabindex="-1" aria-labelledby="deleteAccountModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteAccountModalLabel">Delete Customer Account</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="deleteAccountForm" action="DeleteCustomerServlet" method="post">
          <div class="mb-3">
            <label for="deleteAccNum" class="form-label">Enter Account Number</label>
            <input type="password" id="deleteAccNum" class="form-control" name="AccNum" required title="Account number must be 10-18 digits">

            <label for="RedeleteAccNum" class="form-label mt-2">Re-Enter Account Number</label>
            <input type="text" id="RedeleteAccNum" class="form-control" required oninput="this.setCustomValidity(this.value !== deleteAccNum.value ? 'Account numbers do not match!' : '')" title="Re-enter the same account number">
          </div>
          <button type="submit" class="btn btn-danger mt-3">Delete Account</button>
        </form>
      </div>
    </div>
  </div>
</div>



<footer class="fixed-bottom">
  <p>&copy; 2025 Bank Management System. All rights reserved.</p>
</footer>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    const today = new Date();
    today.setDate(today.getDate()-10);
    const DOB = today.toISOString().split('T')[0];
    document.getElementById('dob').setAttribute('max', DOB);

      
  
	  <% if(session.getAttribute("accCreation")=="Success")
	  {%>
	  const successMessage = `
	      <strong>Account Created Successfully!</strong><br>
	      Default Password: ChangePwd@DOB .
	    `;
	    document.getElementById('successMessageContent').innerHTML = successMessage;
	    document.getElementById('successMessageContent').classList.add("text-success");
	    document.getElementById('successMessageContent').classList.remove("text-warning");
	    document.getElementById('closeAccModal').click();
	    
	    // Show the success modal
	    const successModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
	    successModal.show();
	  <%
	  session.setAttribute("accCreation", null);
	  }
	  %>
	  <% if(session.getAttribute("accCreation")=="accnum exist"){%>
	  const successMessage = `
	      <strong> UNIQUE CONSTRAINT ENCOUNTERED!!</strong><br>
	    `;
	    document.getElementById('successMessageContent').innerHTML = successMessage;
	    document.getElementById('successMessageContent').classList.add("text-warning");
	    document.getElementById('successMessageContent').classList.remove("text-success");
	    document.getElementById('closeAccModal').click();
	    
	    // Show the success modal
	    const successModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
	    successModal.show();
	  <%
	  session.setAttribute("accCreation", null);
	  }
	
	  %>
	  <% if(session.getAttribute("accCreation")=="othererror"){%>
	  const successMessage = `
	      <strong>ERROR! BANK ACCOUNT NOT ADDED.</strong><br>
	    `;
	    document.getElementById('successMessageContent').innerHTML = successMessage;
	    document.getElementById('successMessageContent').classList.add("text-warning");
	    document.getElementById('successMessageContent').classList.remove("text-success");
	    document.getElementById('closeAccModal').click();
	    
	    // Show the success modal
	    const successModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
	    successModal.show();
	  <%
	  session.setAttribute("accCreation", null);
	  }
	
	  %>

  
  
  
      <% if(session.getAttribute("SaveCustDataSuccess")=="true")
      {%>
      const successMessage = `
          <strong>Account successfully Updated!</strong><br>
        `;
        document.getElementById('successMessageContent').innerHTML = successMessage;
        document.getElementById('successMessageContent').classList.add("text-success");
        document.getElementById('successMessageContent').classList.remove("text-warning");
        document.getElementById('closeAccModal').click();
        
        // Show the success modal
        const successModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
        successModal.show();
      <%
      session.setAttribute("SaveCustDataSuccess", null);
      }
      %>
      <% if(session.getAttribute("SaveCustDataError")=="true"){%>
      const successMessage = `
          <strong> ERROR IN ACCOUNT UPDATION !</strong><br>
        `;
        document.getElementById('successMessageContent').innerHTML = successMessage;
        document.getElementById('successMessageContent').classList.add("text-warning");
        document.getElementById('successMessageContent').classList.remove("text-success");
        document.getElementById('closeAccModal').click();
        
        // Show the success modal
        const successModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
        successModal.show();
      <%
      session.setAttribute("SaveCustDataError", null);
      }

      %>
  
      
      
      
      
      
      <% if(session.getAttribute("deleteCustSuccess")=="true")
      {%>
      const successMessage = `
          <strong>Account successfully Deleted!</strong><br>
        `;
        document.getElementById('successMessageContent').innerHTML = successMessage;
        document.getElementById('successMessageContent').classList.add("text-success");
        document.getElementById('successMessageContent').classList.remove("text-warning");
        document.getElementById('closeAccModal').click();
        
        // Show the success modal
        const successModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
        successModal.show();
      <%
      session.setAttribute("deleteCustSuccess", null);
      }
      %>
      <% if(session.getAttribute("deleteCustFailure")=="true"){%>
      const successMessage = `
          <strong> ERROR IN ACCOUNT DELETION !</strong><br>
        `;
        document.getElementById('successMessageContent').innerHTML = successMessage;
        document.getElementById('successMessageContent').classList.add("text-danger");
        document.getElementById('successMessageContent').classList.remove("text-success");
        document.getElementById('closeAccModal').click();
        
        // Show the success modal
        const successModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
        successModal.show();
      <%
      session.setAttribute("deleteCustFailure", null);
      }

      %>
      
  </script>
  
</body>
</html>
