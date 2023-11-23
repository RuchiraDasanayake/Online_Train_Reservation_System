<!--
IT22334138
De Vaas Gunawardana A.C.T.D
MLB_WD_G129_OOP_Online Train Reservation System
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	//get current user identity
	String UserName = (String) session.getAttribute("username");
	String role = (String) session.getAttribute("role");
	
	if(UserName == null && role == null){
		UserName = "Visitor";
		role = "user";
	}
	
%>
<%@ page import = "train.model.Train"%>
<%@ page import = "train.service.ITrainService"%>
<%@ page import = "train.service.TrainServiceImpl"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />
<link rel="stylesheet" href="CSS/schedule.css">
<link rel="stylesheet" href="CSS/mainStyle.css">
<script>
        $(document).ready(function () {
            $('select').selectize({
                sortField: 'text'
            });
        });
</script>
</head>
<body>
<nav class="navbar">
        <ul>
            <li><h2><a href="home.jsp">Home</a></h2></li>
			<li><h2><a href="booking.jsp">Booking</a></h2></li>
			<%
				//validate user is admin or not
				if(role.equals("admin")){
			%>
			<li><h2><a href="addSchedule.jsp">Add Schedule</a></h2></li>
			<%
				}
			%>
			<li><h2><a href="SearchTrain.jsp">Schedule</a></h2></li>
			<li><h2><a href="index.jsp">Monthly Pass</a></h2></li>
            <%
          //validate user logged in or not
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
	<div class="container">
		<form action="<%= request.getContextPath()%>/SearchTrainServlet" method="post">
				<label>From Where : </label><br>
				<select name="fromwhere" required>
				    <option value="">Select a Station...</option>
				    <option value="ampara">Ampara</option>
				    <option value="anuradhapura">Anuradhapura</option>
				    <option value="badulla">Badulla</option>
				    <option value="batticaloa">Batticaloa</option>
				    <option value="colombo">Colombo</option>
				    <option value="galle">Galle</option>
				    <option value="gampaha">Gampaha</option>
				    <option value="hambantota">Hambantota</option>
				    <option value="jaffna">Jaffna</option>
				    <option value="kalutara">Kalutara</option>
				    <option value="kandy">Kandy</option>
				    <option value="kegalle">Kegalle</option>
				    <option value="kilinochchi">Kilinochchi</option>
				    <option value="kurunegala">Kurunegala</option>
				    <option value="mannar">Mannar</option>
				    <option value="matale">Matale</option>
				    <option value="matara">Matara</option>
				    <option value="monaragala">Monaragala</option>
				    <option value="mullaitivu">Mullaitivu</option>
				    <option value="nuwara Eliya">Nuwara Eliya</option>
				    <option value="polonnaruwa">Polonnaruwa</option>
				    <option value="puttalam">Puttalam</option>
				    <option value="ratnapura">Ratnapura</option>
				    <option value="trincomalee">Trincomalee</option>
				    <option value="vavuniya">Vavuniya</option>
			   </select>
			   <label>To Where : </label><br>
			   <select name="towhere" required>
				    <option value="">Select a Station...</option>
				    <option value="ampara">Ampara</option>
				    <option value="anuradhapura">Anuradhapura</option>
				    <option value="badulla">Badulla</option>
				    <option value="batticaloa">Batticaloa</option>
				    <option value="colombo">Colombo</option>
				    <option value="galle">Galle</option>
				    <option value="gampaha">Gampaha</option>
				    <option value="hambantota">Hambantota</option>
				    <option value="jaffna">Jaffna</option>
				    <option value="kalutara">Kalutara</option>
				    <option value="kandy">Kandy</option>
				    <option value="kegalle">Kegalle</option>
				    <option value="kilinochchi">Kilinochchi</option>
				    <option value="kurunegala">Kurunegala</option>
				    <option value="mannar">Mannar</option>
				    <option value="matale">Matale</option>
				    <option value="matara">Matara</option>
				    <option value="monaragala">Monaragala</option>
				    <option value="mullaitivu">Mullaitivu</option>
				    <option value="nuwara Eliya">Nuwara Eliya</option>
				    <option value="polonnaruwa">Polonnaruwa</option>
				    <option value="puttalam">Puttalam</option>
				    <option value="ratnapura">Ratnapura</option>
				    <option value="trincomalee">Trincomalee</option>
				    <option value="vavuniya">Vavuniya</option>
			   </select>
			   <label for="name">Date:</label>
        		<input type="date" name="date" required><br>
				<input type = "submit" value = "Search">
		</form>
	</div>
	
	<section id= "scheduleslist">
			<%
				//read data from database
				String fromwhere = (String) request.getAttribute("fromwhere");
				String towhere = (String) request.getAttribute("towhere");
				String date = (String) request.getAttribute("date");
				
				ITrainService itrainservice = new TrainServiceImpl();
				ArrayList<Train> trainlist = itrainservice.getTrain(fromwhere, towhere, date);
			
				for(Train train: trainlist){
			%>
				<table id ="schtable">
					
						
						<tr>
						
							<th>Train Name</th>	
							<td><%= train.getTrainName() %></td>
							</tr>
						<tr>
						
							<th>From Where</th>		
							<td><%= train.getFromWhere() %></td>
							</tr>
						<tr>	
						
							<th>To Where</th>	
							<td><%= train.getToWhere() %></td>
							</tr>
						<tr>
						
							<th>Dispature</th>	
							<td><%= train.getDispatcher() %></td>
							</tr>
						<tr>
						
							<th>Arrival</th>	
							<td><%= train.getArrival() %></td>
							</tr>
						<tr>
						
							<th>Date</th>	
							<td><%= train.getDate() %></td>
							</tr>
						<tr>
						
					<%

					//validate user is admin or not
					if(role.equals("admin")){
					%>
					<div id="formbtn">
						<td  colspan = "2">
							<form class="merged" action="<%= request.getContextPath()%>/GetTrainServlet" method="post">
								<input type = "hidden" name = "TrainId" value = "<%= train.getTrainId() %>">
								<input type = "submit" value = "Edit">
							</form>
						
							<form class="merged" action="<%= request.getContextPath()%>/DeleteTrainServlet" method="post">
								<input type = "hidden" name = "TrainId" value = "<%= train.getTrainId() %>">
								<input type = "submit" value = "Delete">
							</form>
						</td>
					
					<%
					}else{
					%>
						<td  colspan = "2">
							<form class="merged" action="<%= request.getContextPath()%>/DisplayTrainServlet" method="post">
								<input type = "hidden" name = "TrainId" value = "<%= train.getTrainId() %>">
								<input type = "submit" value = "Select">
							</form>
						</td>
					<%
					}
					%>
							
							</tr>
							</div>
						
	</table>
					
			<%		
				}
			%>
</section>	
		
</body>
</html>