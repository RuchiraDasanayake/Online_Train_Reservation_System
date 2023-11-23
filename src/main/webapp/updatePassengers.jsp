<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="booking.model.Passenger"%>
<%@ page import="booking.service.PassengerService"%>
<%@ page import="booking.service.PassengerServiceImp"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update</title>
<link rel="stylesheet" href="CSS/style2.css" type="text/css">
<link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
</head>
<body>
    <nav class="navbar">
        <ul>
            <li><h2><a href="home.jsp">Home</a></h2></li>
			<li><h2><a href="booking.jsp">Booking</a></h2></li>
			<li><h2><a href="SearchTrain.jsp">Schedule</a></h2></li>
			<li><h2><a href="index.jsp">Monthly Pass</a></h2></li>
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
    
	<%
		String pId=(String)request.getAttribute("pId");
		PassengerService passengerService=new PassengerServiceImp();
		ArrayList<Passenger> passengerList=passengerService.getPassengerById(pId);
	%>
	<%
		for(Passenger passenger:passengerList){
	%>
	<div class="formc">
		<h2 style="text-align: center">Update details of the passenger</h2>
		<form action="<%=request.getContextPath()%>/UpdatePassengerServlet"
			method="post">
			User ID <input type="text" name="pId" value="<%=passenger.getpId()%>"disabled>
			<input type="hidden" name="pId" value="<%=passenger.getpId()%>"> 
			Name <input type="text" name="Name" value="<%=passenger.getName()%>" required>
			NIC <input type="text" name="NIC" value="<%=passenger.getNIC()%>">
			Contact Number <input type="text" name="Contact" value="<%=passenger.getConNum()%>"pattern="\d{10}" required> 
			Address <input type="text" name="Address" value="<%=passenger.getAddress()%>">
			Email <input type="text" name="Email" value="<%=passenger.getEmail()%>">
			 <input type="submit" value="Update">
		</form>
	</div>
	<%
		}
	%>
</body>
</html>