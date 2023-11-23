<%
	String UserName = (String) session.getAttribute("username");
	String role = (String) session.getAttribute("role");
	
	System.out.println("role:"+ role);
	
	if(UserName == null && role == null){
		UserName = "Visitor";
		role = "vistor";
		System.out.println("if part executed");
		System.out.println("role:"+ role);
	}
	
%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
<link rel="stylesheet" href="CSS/style2.css" type="text/css">
<link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
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
			
			<%
				if(role.equals("admin")){
			%>
			<li><h2><a href="showAllRequests.jsp">all Requests</a></h2></li>
			<%
				}else{
			%>
			<li><h2><a href="index.jsp">Monthly Pass</a></h2></li>
			<%
				}
			%>
		
			<%
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
    
	<div class="formc">
            <form action="<%=request.getContextPath()%>/AddPassengerServlet" method="post">
            	<h1 style="text-align:center;">Passenger Details Form</h1>
                <h2>Enter the details of the passengers: </h2>
                <h3>You are required to enter the following details of all the passengers.<br>
                    (Name and the address fields are mandatory)</h3>
                <label for="fname">Full name: </label>
                <input type="text" id="fname" name="Name" placeholder="Your full name with initials...." required>
                <label for="address">Address: </label>
                <input type="text" id="add" name="Address" placeholder="Current address of residence...." required>
                <label for="mail">E-mail: </label>
                <input type="email"  id="Email" name="Email" placeholder="example@email.com"><br>
                <label for="phone">Contact number: </label>
                <input type="text" id="phone" name="Contact" pattern="\d{10}" placeholder="Enter 10 digits in this format: XXXXXXXXXX">
                <label for="nic">NIC: </label>
                <input type="text" id="nic" name="NIC" placeholder="Your national identity card number....">              
                <input type="submit" value="Add passenger">
            </form>
            <div class="button-container">
  				<a href="allPassengers.jsp" class="button">Display all the passengers</a>
			</div>
        </div>
    </body>
</html>