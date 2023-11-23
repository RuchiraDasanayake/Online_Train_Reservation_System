
<%
String logged = (String)session.getAttribute("loggedIn");
if(logged != "logged"){
	response.sendRedirect("login.jsp");
}
%>
<%
	String UserName = (String) session.getAttribute("username");
	String role = (String) session.getAttribute("role");
	
	if(UserName == null && role == null){
		UserName = "Visitor";
		role = "vistor";
	}
	
%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "com.user.model.user" %>
    <%@ page import = "com.user.service.IUserService" %>
    <%@ page import = "com.user.service.UserServiceImplement" %>
    <%@ page import ="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
<link rel="stylesheet" href="CSSmonthpass/monthpassCss.css">
<script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script><!-- external gif tool-->
<meta charset="ISO-8859-1">
<title>Month Pass Request Data</title>
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
			<li><h2><a href="showAllRequests.jsp.jsp">all Requests</a></h2></li>
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
    
    
    
    
    
    <!-- get data form adduserservlet page -->
    
	<%
	String userid = (String) request.getAttribute("userid");
	IUserService userservice = new UserServiceImplement();
	ArrayList <user> userlist = userservice.getUserById(userid);
	%>
	<%
	for(user us: userlist){
	%>
	
	

<form action="" method="post" id="reqform" >
        <h1> Your Registration Request Form</h1>
        
        <!-- First Name -->
        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="first_name" value="<%=us.getFirstName() %>"  readonly ><br>

        <!-- Last Name -->
        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="last_name" value="<%= us.getLastName() %>"  readonly><br>
		
		<!-- NIC Number -->
        <label for="nic_number">NIC Number:</label>
        <input type="text" id="nic_number" name="nic_number" value=" <%= us.getNIC() %> "  readonly><br>
        
        <!-- contact Number -->
         <label for="contactNo">Contact No:</label>
         <input type="text" id="contactNo" name="contactNo" value=" <%= us.getContactNo() %> " readonly><br>
		
		
        <!-- Address -->
        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="3" placeholder ="<%= us.getAddress() %>" readonly></textarea><br>

        <!-- Starting Station -->
        <label for="starting_station">Starting Station:</label>
        <input type="text" id="starting_station" name="starting_station" value="<%= us.getStPoint()%>"  readonly><br>

        <!-- Destination -->
        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination" value=" <%= us.getDestPoint() %> " readonly><br>

   
        <!-- Submit Button -->
       </form>
       <section>
        <form id="updateform" action="<%= request.getContextPath() %>/GetUserServlet" method="post">
					<input type = "hidden" name ="uid" value ="<%=us.getUserID() %>">
					<!-- <input type = "submit" value ="Edit" id="updatebtn"> -->					
		</form>
		
		<button form="updateform" type="submit">
		<lord-icon
			    src="https://cdn.lordicon.com/wuvorxbv.json"
			    trigger="loop"
			    state="hover-line"
			     stroke="bold"
			    colors="primary:#ffffff,secondary:#000000"
			    style="width:50px; height:50px; padding: 0px 10px 0px 0px;">
		</lord-icon> 
		  Edit</button><!-- redirect data to getuserservlet page -->
		
		<form id="deleteform" action="<%= request.getContextPath()%>/DeleteUserServlet" method ="post" >
					<input type = "hidden" name ="stdid" value ="<%=us.getUserID() %>">
		</form>
		
		
		<button form="deleteform" type="submit">
		<lord-icon
			    src="https://cdn.lordicon.com/drxwpfop.json"
			    trigger="loop"
			    delay="500"
			    state="morph-trash-in"
			     stroke="bold"
			    colors="primary:#ffffff,secondary:#000000"
			    style="width:50px;height:50px; padding: 0px 10px 0px 0px;">
			   
		</lord-icon> 
		  Delete</button><!-- to delete data redirect data to deleteuserservlet page -->
		  
		  
		</section>
        
        <%} %>
        
    
    
    
</body>
</html>