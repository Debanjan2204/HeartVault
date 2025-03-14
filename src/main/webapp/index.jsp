<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
	 session=request.getSession(false);
%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeartVault</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="stylesheet/index_style.css">
    <link rel="icon" type="image/x-icon" href="assets/Favicon.png">
    
</head>
<body data-bs-theme="dark">
    <nav class="navbar navbar-expand-lg sticky-top py-1">
        <div class="container">
            <a class="navbar-brand" href="index.html"><img class="logo" src="assets/LOGO.png" alt="LOGO"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                <%if(session.getAttribute("admin")!=null){ %>
                <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4"  href="admin_dashboard.jsp">Admin Dashboard</a>
                    </li>
                    <%} %>
                    <%if(session.getAttribute("Cust")!=null){ %>
                <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4"  href="customer_dashboard.jsp">Customer Dashboard</a>
                    </li>
                    <%} %>
                    <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4"  href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4"  href="#about">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4"  href="#services">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link navbar-item px-lg-4" href="#blog">Blog</a>
                    </li>
                    <li class="mx-3"> <!--SPACER ELEMENT--></li>   
                         <%if(session.getAttribute("Cust")!=null){ %>
                         <li class="nav-item dropdown">
                        <a id="profile-dropdown" class="nav-link dropdown-toggle py-0" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <img class="profile-logo" src="assets/avfa3ii00.jpg" style="height: 40px; border-radius:100%"  alt="profile">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="CustLogoutServlet">Logout</a>
                        </div>
                        </li>
                                        
                        <%}
                        if(session.getAttribute("admin")!=null){ %>
                        <li class="nav-item dropdown">
                        <a id="profile-dropdown" class="nav-link dropdown-toggle py-0" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <img class="profile-logo" src="assets/avfa3ii00.jpg" style="height: 40px; border-radius:100%"  alt="profile">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="AdminLogoutServlet">Logout</a>
                        </div>
                        </li>
                        <%}
                        if(session.getAttribute("admin")==null && session.getAttribute("Cust")==null){ %>
                        <li class="nav-item">
                        <a class="btn btn-info mx-2 px-3" href="login.jsp">Login</a>
                        </li>
                        <%}%>
                 
                </ul>
            </div>
        </div>
    </nav>

    <section class="hero-section">
        <h1>Welcome to Heart-Vault</h1>
        <p>Secure, Reliable, and Easy Banking</p>
        <a href="#services" class="btn btn-lg btn-success">Explore Services</a>
    </section>

    <section id="about" class="container py-5">
        <div class="row">
            <div class="col-lg-6">
                <img src="assets/about us.jpg" alt="About Us" class="img-fluid rounded">
            </div>
            <div class="col-lg-6">
                <h2>About Us</h2><br>
                <p>We are committed to providing top-notch banking solutions to cater to your financial needs. With a legacy of trust and innovation, our services ensure your money is in safe hands.</p>

                    <p>Our mission is to empower individuals, businesses, and communities with financial tools that drive success and security. From seamless digital banking to personalized customer support, we strive to make your banking experience convenient and rewarding.</p>
                    
                   <p> Join us as we continue to shape the future of banking with integrity, reliability, and a focus on your financial well-being.</p>
            </div>
        </div>
    </section>

    <section id="services" class="services-section">
        <div class="container">
            <h2 class="text-center mb-5">Our Services</h2>
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="card">
                        <img src="assets/online banking.jpg" class="card-img-top" alt="Service 1">
                        <div class="card-body">
                            <h5 class="card-title">Online Banking</h5>
                            <p class="card-text">Manage your accounts and transactions from anywhere in the world.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card">
                        <img src="assets/loans.jpg" class="card-img-top" alt="Service 2">
                        <div class="card-body">
                            <h5 class="card-title">Loans</h5>
                            <p class="card-text">Personalized loan options to meet your financial needs.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card">
                        <img src="assets/wealth-management.jpg" class="card-img-top" alt="Service 3">
                        <div class="card-body">
                            <h5 class="card-title">Wealth Management</h5>
                            <p class="card-text">Expert guidance from us to grow and manage your wealth.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="blog" class="container ">
        <h2 class="text-center mb-5">Our Blog</h2>
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card">
                    <img src="assets/saving money.jpg" class="card-img-top" alt="Blog Post 1">
                    <div class="card-body">
                        <h5 class="card-title">5 Tips for Saving Money</h5>
                        <p class="card-text">Discover simple and effective ways to save more money in your daily life.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card">
                    <img src="assets/benefit-of-banking.jpg" class="card-img-top" alt="Blog Post 2">
                    <div class="card-body">
                        <h5 class="card-title">Benefits of Online Banking</h5>
                        <p class="card-text">Learn how online banking can make managing your finances easier and more secure.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card">
                    <img src="assets/understanding loans.jpeg" class="card-img-top" alt="Blog Post 3">
                    <div class="card-body">
                        <h5 class="card-title">Understanding Loans</h5>
                        <p class="card-text">A beginner's guide to understanding the different types of loans available.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="faq" class="container py-5">
        <h2 class="text-center mb-5">Frequently Asked Questions</h2>
        <div class="accordion" id="faqAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header" id="faqHeadingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapseOne" aria-expanded="true" aria-controls="faqCollapseOne">
                        What is online banking?
                    </button>
                </h2>
                <div id="faqCollapseOne" class="accordion-collapse collapse show" aria-labelledby="faqHeadingOne" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Online banking allows you to manage your accounts, pay bills, and transfer money using the internet.
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="faqHeadingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapseTwo" aria-expanded="false" aria-controls="faqCollapseTwo">
                        How secure is my account information?
                    </button>
                </h2>
                <div id="faqCollapseTwo" class="accordion-collapse collapse" aria-labelledby="faqHeadingTwo" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        Our bank uses advanced encryption and multi-factor authentication to keep your account information secure.
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="faqHeadingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapseThree" aria-expanded="false" aria-controls="faqCollapseThree">
                        How can I apply for a loan?
                    </button>
                </h2>
                <div id="faqCollapseThree" class="accordion-collapse collapse" aria-labelledby="faqHeadingThree" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        You can apply for a loan by visiting our Loans page and filling out the application form. Our team will guide you through the process.
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 Bank Management System. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>