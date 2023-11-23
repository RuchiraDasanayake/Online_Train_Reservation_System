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
<%@ page import = "train.model.Train"%>
<%@ page import = "train.service.ITrainService"%>
<%@ page import = "train.service.TrainServiceImpl"%>
<%@ page import = "java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />
<link rel="stylesheet" href="CSS/updateTrain.css"> 
<link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
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
	<%
		//read data from database
		String TrainId = (String) request.getAttribute("TrainId");
		
		ITrainService itrainservice = new TrainServiceImpl();
		ArrayList<Train> trainlist = itrainservice.getTrainById(TrainId);
		

		for(Train train: trainlist){
	%>
	<div>
      <div class="text">
         Update Train Details
      </div>
      <form action="<%= request.getContextPath()%>/updateTrainServlet" method="post">
      <input type="hidden" name="TrainId" value = "<%= train.getTrainId() %>"><br><br>
         <div class="form-row">
            <div class="input-data">
               <input type="text" name="TrainNAme" value = "<%= train.getTrainName() %>" required>
               <div class="underline"></div>
               <label for="name">TrainNAme</label>
            </div>
            <div class="input-data">
               <input type="text" name="FromWhere" value = "<%= train.getFromWhere() %>" required>
               <div class="underline"></div>
               <label for="name">FromWhere:</label>
            </div>
            <div class="input-data">
               <input type="text" name="ToWhere" value = "<%= train.getToWhere() %>" required>
               <div class="underline"></div>
               <label for="name">ToWhere:</label>
            </div>
         </div>
         <div class="form-row">
            <div class="input-data">
               <input type="text" name="Dispatcher" value = "<%= train.getDispatcher() %>" required>
               <div class="underline"></div>
               <label for="name">Dispature:</label>
            </div>
            <div class="input-data">
               <input type="text" name="Arrival" value = "<%= train.getArrival() %>" required>
               <div class="underline"></div>
               <label for="name">Arrival:</label>
            </div>
            <div class="input-data">
               <input type="date" name="date" value = "<%= train.getDate() %>" required><br><br>
               <div class="underline"></div>
               <label for="name">Date:</label>
            </div>
         </div>
         <div class="form-row">
         <div class="input-data textarea">
            <div class="form-row submit-btn">
               <div class="input-data">
                  <div class="inner"></div>
                  <input type="submit" value="Update">
               </div>
            </div>
      </form>
      </div>
						
	<%		
		}
	%>
	</div>
</body>
</html>