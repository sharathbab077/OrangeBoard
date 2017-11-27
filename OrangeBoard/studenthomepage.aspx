﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studenthomepage.aspx.cs" Inherits="OrangeBoard.studenthomepage" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<!--- Basic Page Needs
			================================================== -->
		<meta charset="utf-8">
		<title>Orange Board</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- Mobile Specific Metas
			================================================== -->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
			crossorigin="anonymous">
		<!-- CSS
			================================================== -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!--Import materialize.css-->
		<link rel="stylesheet" href="css/default.css">
		<link rel="stylesheet" href="css/layout.css">
		<link rel="stylesheet" href="css/media-queries.css">
		<link rel="stylesheet" href="css/magnific-popup.css">
		<!-- Script
			================================================== -->
		<script src="js/modernizr.js"></script>
		
		<!-- Favicons
			================================================== -->
		<link rel="shortcut icon" href="favicon.png">
        <link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<form id="form2" runat="server">
			<header id="home">
				<nav id="nav-wrap">
					<a class="mobile-btn" href="#nav-wrap" title="Show navigation">Show navigation</a>
					<a class="mobile-btn" href="#" title="Hide navigation">Hide navigation</a>
					<ul id="nav" class="nav">
						<li class="current"><a class="smoothscroll" href="#home">Home</a></li>
						<li><a class="smoothscroll" href="#info">About</a></li>
                  
						<li><a class="smoothscroll" href="#project">Lessons</a></li>
					    <li><a class="smoothscroll" href="#project">Lessons</a></li>
                        <li><a class="smoothscroll" href="#project">Lessons</a></li>

                         <li id="hide" runat="server">  <a class="smoothscroll" href="StudentCareerInfo.aspx">Please Click here to fill career services form:</a></li>    
                      
                    </ul>
					<!-- end #nav -->
				</nav>
				<!-- end #nav-wrap -->
				<div class="row banner">
					<div class="banner-text">
						<h1>
							Orange Board
							<span class="wrapper"></span>
						</h1>
						<hr />
					</div>
				</div>
				<p class="scrolldown">
					<a class="smoothscroll" href="#about"><i class="icon-down-circle"></i></a>
				</p>
				<hr/>
			</header>
			<!-- Header End -->
			<!-- Info Section
				================================================== -->
			<section id="resume">

                
			<div class=" row work">
                <div class="three columns header-col">
                    <h3>Courses</h3>

                </div>

                <div class="nine columns main-col">
                    <div class="row item">
                        <div class="twelve columns">

                             <asp:Button ID="Button1" runat="server" Text="Software Engineering" /> 
                            <br />
                            
                    <asp:Button ID="Button3" runat="server" Text="Mobile Development" /> <br />
                            <asp:Button ID="Button2" runat="server" Text="OOD" />

                        </div>

                    </div>
                    <!--item end -->

                </div>



			</div>
			
				</section>
            
			<!-- Resume Section End-->
			<!-- project Section
				================================================== -->
		
			<section id="About">
			</section>
			
			<!-- footer
				================================================== -->
			<footer>
				<div class="row">
					<div class="col-md-3" >
						<h5 style="color:white" >OrangeBoard</h5>
					</div>
					<div class="col-md-3">
						<h5 style="color:white">Hello</h5>
					</div>
					<div class="col-md-3">
						<h5 style="color:white">SYRACUSE UNIVERSITY</h5>
					</div>
				</div>
				<div class="row">
					<div class="twelve columns">
						<ul class="social-links">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						</ul>
					</div>
					<div id="go-top"><a class="smoothscroll" title="Back to Top" href="#home"><i class="icon-up-open"></i></a></div>
				</div>
			</footer>
			<!-- Footer End-->
			<script type="text/javascript">
                
			</script>
			<!-- Java Script
				================================================== -->
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
			<script>
                window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')
			</script>
			<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.js"></script>
			<script src="js/jquery.flexslider.js"></script>
			<script src="js/waypoints.js"></script>
			<script src="js/jquery.fittext.js"></script>
			<script src="js/magnific-popup.js"></script>
			<script src="js/init.js"></script>
			<script src="js/doughnut.js"></script>
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script  src="js/index.js"></script>
			<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
			<script type="text/javascript" src="js/materialize.min.js"></script>
		</form>
	</body>
</html>
