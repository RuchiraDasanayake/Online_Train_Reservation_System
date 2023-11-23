<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="booking.model.Passenger"%>
<%@ page import="booking.service.PassengerService"%>
<%@ page import="booking.service.PassengerServiceImp"%>
<%@ page import="train.model.Train"%>
<%@ page import="train.service.ITrainService"%>
<%@ page import="train.service.TrainServiceImpl"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Passengers</title>
<link rel="stylesheet" href="CSS/style3.css" type="text/css">
<link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
    <script>
	function showSuccessMessage() {
    	alert('Payment Successful!');
    	location.href = 'home.html';
	}
	</script>
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
    
	<div class="h1-container">
	<h1>Details of all the passengers</h1>
	</div>
	<table>
		<thead>
			<tr>
				<th>Passenger ID</th>
				<th>Name</th>
				<th>NIC</th>
				<th>Contact Number</th>
				<th>Address</th>
				<th>Email</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<%
                double pricePerPassenger = 1000.0; // Price for 1 passenger
                double totalPayment = 0.0; // Total payment for all passengers
                PassengerService passengerService = new PassengerServiceImp();
                ArrayList<Passenger> passengerList = passengerService.getPassengers();
                int passengerCount = passengerList.size();

                for (Passenger passenger : passengerList) {
                    totalPayment += pricePerPassenger; // Add price for each passenger to total payment
            %>
			<tr>
				<td><%= passenger.getpId() %></td>
				<td><%= passenger.getName() %></td>
				<td><%= passenger.getNIC() %></td>
				<td><%= passenger.getConNum() %></td>
				<td><%= passenger.getAddress() %></td>
				<td><%= passenger.getEmail() %></td>
				<td>
					<form action="<%= request.getContextPath() %>/GetPassengerServlet"
						method="post">
						<input type="hidden" name="pId" value="<%= passenger.getpId() %>">
						<input type="submit" value="Edit" class="edit-button">
						<div class="animation-container">
							<lord-icon src="https://cdn.lordicon.com/ogkflacg.json"
								trigger="hover" style="width: 25px; height: 25px;"></lord-icon>
						</div>
					</form>
				</td>
				<td>
					<form
						action="<%= request.getContextPath() %>/DeletePassengerServlet"
						method="post">
						<input type="hidden" name="pId" value="<%= passenger.getpId() %>">
						<input type="submit" value="Delete" class="delete-button">
						<div class="animation-container">
							<lord-icon src="https://cdn.lordicon.com/skkahier.json"
								trigger="hover" style="width: 25px; height: 25px;"></lord-icon>
						</div>
					</form>
				</td>
			</tr>
			<%
                }
            %>
		</tbody>
	</table>
	<div class="button-container">
		<input type="button" onClick="location.href='booking.jsp'"
			class="add-passenger-button" value='Add another passenger'><br>
		<br>
	</div>
	<br>
	
	<div class="payment-container">
		<h3>Payment Details</h3>
		<p>
			Ticket price per 1 person = Rs. 1000.00<br> <br> Number of
			people =
			<%= passengerCount %><br> <br> Total amount to be paid =
			Rs. 1000.00 x
			<%= passengerCount %>
			= Rs.<%= totalPayment %>
		<p>
			<input type="button" onClick="showSuccessMessage()"
				class="proceed-payment-button" value='Proceed to payment'><br>
			<br>
	</div>
	<footer>
		<a href="https://lordicon.com/"></a>
	</footer>
</body>
</html>
