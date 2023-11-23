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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="registration.controller.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Read User Data</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playpen+Sans:wght@200;300;500;600;800&display=swap');
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-image: url('https://images.pexels.com/photos/552779/pexels-photo-552779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
            background-size: cover;
            margin:0;
        }
        h2 {
            background-color: #0074cc;
            color: #fff;
            padding: 10px;
            font-weight: bold;
        }
        img {
            max-width: 200px;
            border: 4px solid #0074cc;
            border-radius: 50%;
            margin: 20px 0;
        }
        p {
            color: #fff;
            font-size: 20px;
            margin: 10px;
            font-family: 'Playpen Sans', sans-serif;
            font-weight: 600;
            font-weight: bold;
            text-align: left;
            margin-left:280px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0074cc;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding-right:30px;
            margin:100px;
            margin-top:30px;
        }
        form {
            width: 60%;
            height: 550px;
            margin: 0 auto;
            background-color: #7393B3;
            background-size: cover;
            padding: 0px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .button:hover {
            background-color: #0056a7;
        }
    </style>
      <link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
</head>
<body>
<nav class="navbar">
        <ul>
            <li><h2><a href="./home.jsp">Home</a></h2></li>
			<li><h2><a href="./booking.jsp">Booking</a></h2></li>
			<%
				if(role.equals("admin")){
			%>
			<li><h2><a href="./addSchedule.jsp">Add Schedule</a></h2></li>
			<%
				}
			%>
			<li><h2><a href="./SearchTrain.jsp">Schedule</a></h2></li>
			<li><h2><a href="./index.jsp">Monthly Pass</a></h2></li>
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
            <li style="float:right"><h2><a style="background-color: rgb(75, 75, 73);" href="./LogoutServlet">Logout</a></h2></li>
        </ul>
    </nav>
    
    
    <h2>Profile Page</h2><br><br>
    <%
        ResultSet resultSet = (ResultSet) request.getAttribute("userResultSet");
        if (resultSet != null) {
            while (resultSet.next()) {
    %>
    <form>
        <img src='https://as2.ftcdn.net/v2/jpg/03/31/69/91/1000_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg' alt="Default Profile Picture">
        <p>Username: <%= resultSet.getString("username") %></p>
        <p>NIC: <%= resultSet.getString("NIC") %></p>
        <p>Mobile: <%= resultSet.getString("mobile") %></p>
        <p>Address: <%= resultSet.getString("address") %></p><br><br>
    </form>
    <%
            }
        } else {
    %>
    <p>No user data found.</p>
    <%
        }
    %>

    <a href="<%= request.getContextPath() %>/updateUsername" class="button">Update</a>
    <a href="<%= request.getContextPath() %>/deleteUser" class="button">Delete</a>
</body>
</html>
