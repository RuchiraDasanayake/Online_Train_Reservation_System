<%
	String UserName = (String) session.getAttribute("username");
	String role = (String) session.getAttribute("role");
	
	if(UserName == null && role == null){
		UserName = "Visitor";
		role = "vistor";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
    <title>Railway Booking</title>
    <link rel="stylesheet" href="CSS/style.css" type="text/css">
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
    <h1 style = "color: rgb(255, 255, 255);">Welcome <%= UserName %> !</h1>
    <div class="header">
        <h1>Welcome to QuickRail</h1>
        <p>
            "Discover train schedules, book tickets, check fares, and access travel information effortlessly.
            Experience a user-friendly interface designed to streamline your railway experience and make your travel arrangements hassle-free."
        </p>
    </div>
    <div class="container">
        <div class="container1">
                <p>
                    "Embark on an exciting journey through Sri Lanka on our iconic trains.
                    Every moment celebrates scenic beauty and precision. Experience pristine alpine landscapes with towering peaks,
                    serene lakes, and lush valleys outside your window. Your ticket booking adventure begins here, ensuring a seamless trip through picturesque landscapes."
                </p>
                <a href="booking.jsp" class="button">Make a seat reservation</a>          
        </div>
        <div class="container2">
                <p>
                    "Unlock a world of convenience with our monthly pass. Enjoy the perks of reduced travel
                     costs, putting extra money back in your pocket. Say goodbye to the hassle of purchasing tickets
                     every day and embrace a smoother, budget-friendly commute. It's time to experience the benefits
                     of stress-free, cost-effective, and unlimited travel."
                </p>
                <a href="index.jsp" class="button">Apply for monthly pass</a>
        </div>
        <div class="video">
            <iframe src="https://www.youtube.com/embed/bADR5QowGXc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        </div>
    </div>
    <div class="contact-section">
        <h2>Contact Us</h2>
        <p>
            Feel free to get in touch with us if you have any questions or need assistance with your travel plans.
        </p>
        <div class="contact-details">
            <div class="contact-item">
                <h3>Telephone</h3>
                <p>+94767184975</p>
            </div>
            <div class="contact-item">
                <h3>Email</h3>
                <p><a href="mailto:quickrail@gmail.com.com">contact@example.com</a></p>
            </div>
            <div class="contact-item">
                <h3>Facebook</h3>
                <p><a href="https://www.facebook.com/quickrail" target="_blank">QuickRail</a></p>
            </div>
            <div class="contact-item">
                <h3>Website</h3>
                <p><a href="https://www.quickrail.com" target="_blank">www.quickrail.com</a></p>
            </div>
        </div>
    </div>
</body>
</html>
