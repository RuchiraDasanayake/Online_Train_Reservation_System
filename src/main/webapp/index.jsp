
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="CSSmonthpass/form.css">
<script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
<meta charset="ISO-8859-1">
<title>Request Form</title>
  <link rel="stylesheet" href="CSS/mainStyle.css" type="text/css">
    <script src="https://cdn.lordicon.com/lordicon-1.1.0.js"></script>
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
    
    
    
    
<!-- if already data exist below if will execute -->
<script>
function showdetailsbtn() {
    
        document.getElementById("detailsbtn").style.display = "block";

}
</script>
<% String dataexisterror = (String) request.getAttribute("dataexist"); %>

 <% if (dataexisterror != null) { %>
        <script>
        
            alert("<%= dataexisterror %>");    
            
        </script>

  <% } %>

<!-- end of if below is form to enter data if data not already exist -->
	<% 
	String 	exuserid = (String) request.getAttribute("exisuserid");
	System.out.println(exuserid);%>


 <form id="getuserdetails" action="<%= request.getContextPath() %>/AddUserServlet" method="post">
        <h1>Registration Form</h1>
        
        <!-- First Name -->
        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="first_name" autocomplete="off" placeholder="first name here" required><br>

        <!-- Last Name -->
        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="last_name"  autocomplete="off" placeholder="last name here" required><br>
        
        <!-- NIC Number -->
        <label for="nic_number">NIC Number:</label>
        <input type="text" id="nic_number" name="nic_number"  autocomplete="off" pattern="^\d{12}$|^\d{9}[Vv]$" title="enter only new NIC number format or Old NIC format " placeholder="Enter 12 digits or 9 digits + 'V'" required><br>
        
        <!-- contact Number -->
         <label for="contactNo">Contact No:</label>
         <input type="text" id="contactNo" name="contactNo" autocomplete="off" pattern="\d{10}" title="Please enter 10 digit Number" placeholder="0711234567" required><br>

        <!-- Address -->
        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="3" autocomplete="off" placeholder="address here" required></textarea><br>

        <!-- Starting Station -->
        <label for="starting_station">Starting Station:</label>
        <input type="text" id="starting_station" name="starting_station" autocomplete="off" placeholder="starting train station" required><br>

        <!-- Destination -->
        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination" autocomplete="off" placeholder="destination train station" required><br>

        

        <!-- Reason -->
        <br>
        <h3>NOTE: This tain pass request will be submitted to out database and will be processed within 7 working days. you will be notified 
        throug your contact no.</h3>

      
    </form>
    <section>
    <!-- submit data to adduserservlet -->
    <button form="getuserdetails" type="submit">
    
    
		<lord-icon
		    src="https://cdn.lordicon.com/tulzsetq.json"
		    trigger="loop"
		    colors="primary:#ffffff,secondary:#000000"
		    stroke="bold"
		    style="width:50px;height:50px; padding: 0px 10px 0px 0px;">
		</lord-icon>
		
		
		  Submit</button>
    	
  		  
    	<form id ="topage2" action="<%= request.getContextPath() %>/lastdetails" method="post" hidden>
    	<input type="text"  name="existinguserid" value="<%=exuserid%>"  hidden><br>
    	 	</form>
    	 	<% if(exuserid!=null){%><!-- below button will available only if the user have useid which already in monthpassrequest table  -->
    	 	<!-- show user specific details -->
    	 <button id="detailsbtn" form="topage2" type="submit"  >
    	 
    	 <lord-icon
		    src="https://cdn.lordicon.com/wzwygmng.json"
		    trigger="loop"
		    delay="2500"
		    stroke="bold"
		    state="hover-unfold"
		    colors="primary:#ffffff,secondary:#000000"
		    style="width:50px;height:50px">
		</lord-icon>    	 
    	 
    	  Your Form</button> <!-- redirect data to lastdetails servlet page -->
		  <%}%>
		  </section>


</body>
</html>