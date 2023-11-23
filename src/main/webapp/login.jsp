<!--
IT22334138
De Vaas Gunawardana A.C.T.D
MLB_WD_G129_OOP_Online Train Reservation System
-->
<%
	//get current user identity
	String UserName = (String) session.getAttribute("username");
	String role = (String) session.getAttribute("role");
	
	if(UserName == null && role == null){
		UserName = "Visitor";
		role = "vistor";
	}
	
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/login.css"> 
<title>Login Page</title>
<link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
<script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <nav class="navbar">
        <ul>
            <li><h2><a href="home.jsp">Home</a></h2></li>
			<li><h2><a href="booking.jsp">Booking</a></h2></li>
			<%
				if(role.equals("admin")){
			%>
			<li><h2><a href="addSchedule.jsp">Add Schedule</a></h2></li>
			<%
				}
			%>
			<li><h2><a href="SearchTrain.jsp">Schedule</a></h2></li>
			<li><h2><a href="index.jsp">Monthly Pass</a></h2></li>
			<%
			//validate user logged in or not
			String logged = (String)session.getAttribute("loggedIn");
			if(logged != "logged"){
			%>
				<li style="float:right;"><h2><a style="padding: 3px 0px; width: 80px;background-color: rgb(0, 117, 250);" href="views/userregister.jsp">
                
                <lord-icon
                src="https://cdn.lordicon.com/bgebyztw.json"
                trigger="loop"
                delay="2500"
                stroke="bold"
                state="hover-looking-around"
                colors="primary:#ffffff,secondary:#ffffff"
                style="width:50px;height:50px">


            </lord-icon>
            
            </a></h2></li>
				<li style="float:right"><h2><a style="background-color: rgb(75, 75, 73);" href="login.jsp">Login</a></h2></li>
			<%
			}else{
			%>
				<li style="float:right;"><h2><a style="padding: 3px 0px; width: 80px;background-color: rgb(0, 117, 250);" href="<%= request.getContextPath()%>/read">
                
                <lord-icon
                src="https://cdn.lordicon.com/bgebyztw.json"
                trigger="loop"
                delay="2500"
                stroke="bold"
                state="hover-looking-around"
                colors="primary:#ffffff,secondary:#ffffff"
                style="width:50px;height:50px">


            </lord-icon>
            
            </a></h2></li>
				<li style="float:right"><h2><a style="background-color: rgb(75, 75, 73);" href="LogoutServlet">Logout</a></h2></li>
			<%
			}
			%>
        </ul>
    </nav>
    <div class="background">
    </div>
    <form action="<%= request.getContextPath()%>/ValidateLoginServlet" method="post">
        <h3>Login Here</h3>

        <label for="username">Username</label>
        <input type="text" name="username" required>
            
        <label for="password">Password</label>
        <input type="password" name="password" required><br>
            
        <input class = "button" type="submit" value="Login">
    </form>
</body>
</html>
