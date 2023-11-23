
<%
String logged = (String)session.getAttribute("loggedIn");
if(logged != "logged"){
	response.sendRedirect("login.jsp");
}%>
<%
String UserName = (String) session.getAttribute("username");
String role = (String) session.getAttribute("role");

if(UserName == null && role == null){
	UserName = "Visitor";
	role = "vistor";
}

%>

<%@page import="com.user.model.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@page import="java.util.ArrayList"%>
	<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
	<%@page import="com.user.service.UserServiceImplement"%>
	<%@page import="com.user.service.IUserService"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
<link rel="stylesheet" href="CSSmonthpass/form.css">
<script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
<meta charset="ISO-8859-1">
<title>update request details</title>
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
    
    
    
    
    
    

<%
	String userid = (String) request.getAttribute("userid");//update data according to userid sent by getuserservlet
	IUserService userservice = new UserServiceImplement();
	ArrayList <user> userlist = userservice.getUserById(userid);
	%>
	<%
	for(user us: userlist){
		
	%>
	
	

	<form id ="updatedetailsform" action="<%= request.getContextPath() %>/updateUserServlet" method="post" >
        <h1>Update Your Registration Form</h1>
        <input type="hidden" name="userid" value="<%=us.getUserID() %>">
        <!-- First Name -->
        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="first_name" value="<%=us.getFirstName() %>"  ><br>

        <!-- Last Name -->
        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="last_name" value="<%= us.getLastName() %>" ><br>
		
		<!-- NIC Number -->
        <label for="nic_number">NIC Number:</label>
        <input type="text" id="nic_number" name="nic_number" value=" <%= us.getNIC() %> " ><br>
        
        <!-- contact Number -->
         <label for="contactNo">Contact No:</label>
         <input type="text" id="contactNo" name="contactNo" value=" <%= us.getContactNo() %> " ><br>
		
		
        <!-- Address -->
        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="3"> <%= us.getAddress() %> </textarea><br>

        <!-- Starting Station -->
        <label for="starting_station">Starting Station:</label>
        <input type="text" id="starting_station" name="starting_station" value="<%= us.getStPoint()%>"><br>

        <!-- Destination -->
        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination" value=" <%= us.getDestPoint() %> "><br>

        

        <!-- Submit Button -->
		 </form>
		
        <%} %>
        <section>
        <button form="updatedetailsform" type="submit">
		<lord-icon
	     src="https://cdn.lordicon.com/ghhwiltn.json"
	    trigger="loop"
	    stroke="bold"
	    colors="primary:#121331,secondary:#ffffff"
	    style="width:50px;height:50px; padding: 0px 10px 0px 0px;">
		</lord-icon>
		  Update Changes</button><!-- update data and redirect to update user servlet -->
		  
		  </section>
       

</body>
</html>