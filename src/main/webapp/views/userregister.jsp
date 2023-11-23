<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        body {
            @import url('https://fonts.googleapis.com/css2?family=Playpen+Sans:wght@200;300;500;600;800&display=swap');
            font-family: Arial, sans-serif;
            text-align: center;
            background-image: url('https://images.pexels.com/photos/2790395/pexels-photo-2790395.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
            background-size: cover;
            margin:0;
        }
        h1 {
            text-align: center;
            color: #000;
            font-family: 'Playpen Sans', sans-serif;
            font-weight: 600;
            margin-top:140px;
            
        }
        form {
            width: 700px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top:70px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            width:450px;
            background-color: #0074cc;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056a7;
        }
        
    </style>
      <link rel="stylesheet" href="../CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
</head>
<body>
<nav class="navbar">
        <ul>
            <li><h2><a href="./home.jsp">Home</a></h2></li>
			<li><h2><a href="./booking.jsp">Booking</a></h2></li>
			<li><h2><a href="./SearchTrain.jsp">Schedule</a></h2></li>
			<li><h2><a href="./index.jsp">Monthly Pass</a></h2></li>
			<li style="float:right;"><h2><a style="padding: 3px 0px; width: 80px;background-color: rgb(0, 117, 250);" href="userregister.jsp">
                
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
            <li style="float:right"><h2><a style="background-color: rgb(75, 75, 73);" href="./login.jsp">Login</a></h2></li>
        </ul>
    </nav>
<div align="center">
    <h1>User Registration</h1>
    <form action="<%= request.getContextPath() %>/register" method="post">
        <table>
            <tr>
                <td>NIC</td>
                <td><input type="text" name="NIC" /></td>
            </tr>
            <tr>
                <td>Username</td>
                <td><input type="text" name="username" /></td>
            </tr>
            <tr>
                <td>Mobile</td>
                <td><input type="text" name="mobile" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" /></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" /></td>
            </tr>
        </table>
        <input type="submit" value="Register" />
    </form>
    
    
</div>
</body>
</html>
