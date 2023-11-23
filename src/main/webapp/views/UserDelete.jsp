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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* styles.css */
body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-image: url('https://images.pexels.com/photos/2790395/pexels-photo-2790395.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
            background-size: cover;
            margin:0;
        }

form {
    max-width: 400px;
    margin-left:450px;
    margin-top:150px;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 10px;
}

input[type="text"] {
    width: 90%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
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
    font-size: 18px;
    margin: 30px;
}

.button:hover {
    background-color: #0056b3;
}
h2 {
            background-color: #0074cc;
            color: #fff;
            padding: 10px;
            font-weight: bold;
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
<h2>Delete The Account</h2>
<form action="<%= request.getContextPath() %>/deleteUser" method="post">
    <label for="username">Username:</label>
    <input type="text" name="username" id="username" required>
    <label for="password">password:</label>
    <input type="text" name="password" id="password" required>
    <a href="<%= request.getContextPath() %>/read" class="button">Go Back</a>
    <input type="submit" class="button" value="Delete User">
    </form>
</body>
</html>