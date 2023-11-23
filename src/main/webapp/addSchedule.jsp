<!--
IT22334138
De Vaas Gunawardana A.C.T.D
MLB_WD_G129_OOP_Online Train Reservation System
-->
<%
//validate user logged in or not
String logged = (String)session.getAttribute("loggedIn");
if(logged != "logged"){
	response.sendRedirect("login.jsp");
}
%>
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
<%@ page import="train.model.Login" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/AddSchedule.css"> 
<link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
<script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
</head>
<body>
		

    <nav class="navbar">
        <ul>
            <li><h2><a href="home.jsp">Home</a></h2></li>
			<li><h2><a href="booking.jsp">Booking</a></h2></li>
			<%
				//validate user admin or not
				if(role.equals("admin")){
			%>
			<li><h2><a href="addSchedule.jsp">Add Schedule</a></h2></li>
			<%
				}
			%>
			<li><h2><a href="SearchTrain.jsp">Schedule</a></h2></li>
			<li><h2><a href="index.jsp">Monthly Pass</a></h2></li>
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
        </ul>
    </nav>
    <div class="container">
    <div>
      <div class="text">
         Add Train Details
      </div>
      <form class = "form" action="<%= request.getContextPath()%>/AddTrainServlet" method="post">
         <div class="form-row">
            <div class="input-data">
               <input type="text" name="TrainNAme" required>
               <div class="underline"></div>
               <label for="name">TrainNAme</label>
            </div>
            <div class="input-data">
               <input type="text" name="FromWhere" required>
               <div class="underline"></div>
               <label for="name">FromWhere:</label>
            </div>
            <div class="input-data">
               <input type="text" name="ToWhere" required>
               <div class="underline"></div>
               <label for="name">ToWhere:</label>
            </div>
         </div>
         <div class="form-row">
            <div class="input-data">
               <input type="text" name="Dispatcher" required>
               <div class="underline"></div>
               <label for="name">Dispatcher:</label>
            </div>
            <div class="input-data">
               <input type="text" name="Arrival" required>
               <div class="underline"></div>
               <label for="name">Arrival:</label>
            </div>
            <div class="input-data">
               <input type="date" name="date" required>
               <div class="underline"></div>
               <label for="name">Date:</label>
            </div>
         </div>
         <div class="form-row">
         <div class="input-data textarea">
            <div class="form-row submit-btn">
               <div class="input-data">
                  <div class="inner"></div>
                  <input type="submit" value="Add">
               </div>
            </div>
      </form>
      </div>
	</div>
</body>
</html>