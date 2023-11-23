<%
	String UserName = (String) session.getAttribute("username");
	String role = (String) session.getAttribute("role");
	
	if(UserName == null && role == null){
		UserName = "Visitor";
		role = "vistor";
	}
	
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import = "com.user.model.user" %>
    <%@ page import = "com.user.service.IUserService" %>
    <%@ page import = "com.user.service.UserServiceImplement" %>
    <%@ page import ="java.util.ArrayList" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>all month pass requests</title>
<link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
    <link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <link rel="stylesheet" href="CSSmonthpass/alluser.css">
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
	String userid = (String) request.getAttribute("userid");
	IUserService userservice = new UserServiceImplement();
	UserServiceImplement usserviceimp = new UserServiceImplement();
	ArrayList <user> userlist = usserviceimp.getAllRequests();
	System.out.println("allrequestjsp userllst content count:" + userlist.size());
	%>
	<% 
	if(userlist.size()!= 0){%>

	<div class="h1-container">
	<h1>Details of all the passengers</h1>
	</div>
	<section class="tablesection">
	<table>
		<thead>
			<tr>
				<th>User ID</th>
				<th>FirstName</th>
				<th>LastName</th>
				<th>Nic Number</th>
				<th>Contact No</th>
				<th>Address</th>
			</tr>
		</thead>
		<tbody>
	
	
	<%
	for(user us: userlist){
	%>
	
	
			
			<tr>
				<td><%= us.getUserID()%></td>
				<td><%= us.getFirstName()%></td>
				<td><%= us.getLastName()%></td>
				<td><%= us.getNIC()%></td>
				<td><%= us.getContactNo()%></td>
				<td><%= us.getAddress()%></td>
			</tr>
			<%
                }
            %>
		</tbody>
	</table>
	</section>
	
	<%}else{%>
	<h1>No Requests To Show.</h1>
	<%}%>

</body>
</html>