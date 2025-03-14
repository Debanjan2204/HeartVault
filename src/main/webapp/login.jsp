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
	 if(session.getAttribute("admin")!=null || session.getAttribute("Cust")!=null){
		 response.sendRedirect("index.jsp");
	 }
%>
    <title>Bank Of Hearts | Login</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="stylesheet/login_style.css" />
    <link rel="shortcut icon" href="assets/Favicon.png" type="image/x-icon" />
    <link
      href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
  <%
 
  %>
    <!-- LOGIN FORM CREATION -->
    <div class="background"></div>
    <div class="container">
      <div class="overlay"></div>
      <div class="item">
        <a href="index.jsp"
          ><span class="overlay-logo"></span>
          <img
            src="assets/LOGO_SQUARE-BGRemoved.png"
            alt="BankLogo"
            class="logo"
        /></a>
        <div class="text-item">
          <h2>
            Welcome! <br /><span>
              To the Bank of<br>
              <span class="hearts">Hearts</span>
            </span>
          </h2>
          <p>Follow us on</p>
          <div class="social-icon">
            <a href="#"><i class="bx bxl-facebook"></i></a>
            <a href="#"><i class="bx bxl-twitter"></i></a>
            <a href="#"><i class="bx bxl-youtube"></i></a>
            <a href="#"><i class="bx bxl-instagram"></i></a>
            <a href="#"><i class="bx bxl-linkedin"></i></a>
          </div>
        </div>
      </div>
      <div class="login-section">
        <div class="form-box login">
          <form action="CustLoginServlet" method="post">
            <h2>Customer Sign In</h2>
            <div class="input-box">
              <span class="icon"><i class="bx bxs-user-account"></i></span>
              <input
                type="text"
                maxlength="15"
                oninput="this.value=this.value.replace(/[^0-9]/g,'')"
                required
                name="bankAcc"
              />
              <label>Account Number</label>
            </div>
            <div class="input-box">
              <span class="icon"><i class="bx bxs-lock-alt"></i></span>
              <input type="password" name="password" required />
              <label>Password</label>
            </div>
            <div class="remember-password">
              <label for=""><input type="checkbox" />Remember Me</label>
              <a href="#">Forget Password?</a>
            </div>
            <button class="btn">Login</button>
            <div class="create-account">
              <p>
                Are you a Bank Employee?
                <a href="#" class="register-link">SIGN IN</a>
                            <%  session=request.getSession(); 
           if (session.getAttribute("custLoginError") != null) { %>
   			 <h6 class=" small text-warning">INVALID CREDENTIALSsssss</h6>
		<% } 
			session.removeAttribute("custLoginError");
		%>
              </p>
            </div>
          </form>
        </div>
        <div class="form-box register">
          <form action="AdminLoginServlet" method="post">
            <h2>Employee Sign In</h2>

            <div class="input-box">
              <span class="icon"><i class="bx bxs-id-card"></i></span>
              <input
                type="text"
                name="empID"
                maxlength="7"
                oninput="this.value=this.value.replace(/[^0-9]/g,'')"
                required
              />
              <label>Employee ID</label>
            </div>
            <div class="input-box">
              <span class="icon"><i class="bx bxs-lock-alt"></i></span>

              <input type="password" name="password" required />
              <label>Password</label>
            </div>
            <div class="remember-password">
              <small class="text-info"
                >Check the requirements by clicking here</small
              >
              <span
                class="info-icon"
                data-bs-toggle="modal"
                data-bs-target="#passwordRequirementsModal"
              >
                <i class="bi bi-info-circle"></i>
              </span>
            </div>
            <button class="btn">SignIn</button>
            <div class="create-account">
             <p>Are you a Customer? <a href="#" class="login-link">Sign In</a>
             <%  session=request.getSession(); 
           if (session.getAttribute("adminLoginError") != null) { %>
   			 <h6 class=" small text-warning">INVALID CREDENTIALS</h6>
		<% } 
			session.removeAttribute("adminLoginError");
		%></p>
            </div>
          </form>
          
        </div>	
      </div>
    </div>
    <!-- SIGN UP FORM CREATION -->

    <!-- Modal for Password Requirements -->
    <div
      class="modal fade modal-dark"
      id="passwordRequirementsModal"
      tabindex="-1"
      aria-labelledby="passwordRequirementsModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="passwordRequirementsModalLabel">
              Password Requirements
            </h5>
            <button
              type="button"
              class="btn-close btn-close-white"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <!-- Password Requirements Section -->
            <div class="mb-4">
              <h6 class="fw-bold">Password Requirements</h6>
              <ul>
                <li>Must be at least 8 characters long.</li>
                <li>Should contain at least one uppercase letter.</li>
                <li>
                  Should include one special character (e.g., @, #, $, etc.).
                </li>
                <li>Must contain at least one numeric digit.</li>
              </ul>
            </div>

            <!-- Divider -->
            <hr class="text-light" />

            <!-- Employee ID Requirements Section -->
            <div>
              <h6 class="fw-bold">Employee ID Requirements</h6>
              <ul>
                <li>Must be exactly 6 characters long.</li>
                <li>Should only contain alphanumeric characters.</li>
                <li>Cannot contain spaces or special characters.</li>
                <li>Should start with an uppercase letter.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    <footer>
      <p>&copy; 2025 Bank Management System. All rights reserved.</p>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      const loginsec = document.querySelector(".login-section");
      const loginlink = document.querySelector(".login-link");
      const registerlink = document.querySelector(".register-link");

      registerlink.addEventListener("click", () => {
        loginsec.classList.add("active");
      });
      loginlink.addEventListener("click", () => {
        loginsec.classList.remove("active");
      });
      
      const urlParams = new URLSearchParams(window.location.search);

      if(urlParams.get("admin")){
    	  loginsec.classList.add("active");
      }
            
     

 
      
    </script>
  </body>
</html>


