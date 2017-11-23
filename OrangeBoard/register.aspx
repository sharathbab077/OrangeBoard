<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="OrangeBoard.register" %>

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
        <style>
        body {
    background-image: url("blue1.png");
    -moz-background-size : cover;
    
}
#form
{
    background-color:White;
}
#form div
{
    margin-top:10px;
}

#form input, textarea, button
{
    border:2px solid #9ECEDB;
    padding:3px 5px;
}

#form label
{
    font-weight:bold;
    font-size:12px;
    color:#184552;
}
.required
{
    color:#dd6666;
}
#form button
{
    background-color: #9ECEDB;
    color: #184552;
    cursor:pointer;
}

#form button:hover
{
    background-color: blue;
}
#form div
{
    margin-top:10px;
}

#form input, textarea, button
{
    border:2px solid #9ECEDB;
    padding:3px 5px;
}

#form label
{
    font-weight:bold;
    font-size:12px;
    color:#184552;
}
#form
{
     width:500px;
      margin:auto;
    font-family: sans-serif;
    box-shadow: 5px 5px 5px #888888;
    padding:20px;
    border:4px solid #27748A;
}
legend
{
     display:inline;
       font-size: 40px;
}
fieldset
{
   display:inline;
    border:3px solid #283be2;
}
#form h2
{
    color:#27748A;
    font-size:35px;
    margin:0;
}
.field_set{
    padding: 3em;
  border-color: #0066FF;
  border-style: solid;

}
#button{
     text-align:center;
}
#button1{
     text-align:center;
}
.Button1{
    padding: 10px 30px 10px 30px;
    background: #66C1E4;
    border: none;
    color: #FFF;
    box-shadow: 1px 1px 1px #4C6E91;
    -webkit-box-shadow: 1px 1px 1px #4C6E91;
    -moz-box-shadow: 1px 1px 1px #4C6E91;
    text-shadow: 1px 1px 1px #5079A3;
    text-align:center;
    
}
.Button1:hover{
    background: #3EB1DD;
}   
.resizedTextbox {width: 100px; }
#form p
{
    font-size:15px;
    color:#222222;
}
    @media only screen and ( max-width : 600px) 
    {
        #form {
            width: 350px;
            margin: auto;
            font-family: sans-serif;
            box-shadow: 5px 5px 5px #888888;
            padding: 20px;
            border: 4px solid #27748A;
        }
        #button {
         width: 350px;
    }
    }

        .auto-style1 {
            font-size: 30px;
            color: #0066FF;
        }

    </style>
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
            <center>
			<section id="resume" >
                <fieldset class="field_set">
			<legend class="auto-style1" style:"border: 2px groove (internal value);"  >Personal Information</legend> 
     <div>
    <label for='studId'>StudentId<span class='required'>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></label>
    &nbsp;
    
    <asp:TextBox ID="studId" runat="server"   placeholder='your StudentId here' required= "required" autofocus="autofocus" Width="295px"/>

</div>
                    <div>
    <label for='name'>phone Number<span class='required'>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></label>
    &nbsp;
    
    <asp:TextBox ID="phoneNo" runat="server"   placeholder='your name here' required= "required" autofocus="autofocus" Width="295px"/>

</div>
<div>
    <label for='name'>Name<span class='required'>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></label>
    &nbsp;
    
    <asp:TextBox ID="name" runat="server"   placeholder='your name here' required= "required" autofocus="autofocus" Width="295px"/>

</div>

<div>
    <label for='email'>Email<span class='required'>*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </span></label>
    <asp:TextBox runat="server" ID="email"  name="email"  placeholder="you@yourdomain.com"  required="required" Width="295px" />
</div>

       <div>
            &nbsp;<asp:Label ID="lblPassword" runat="server" Text="Password :" style="font-size: small; font-weight: 700">OTP <span class='required'>*</span></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
<asp:TextBox ID="txtPassword" runat="server"  TextMode="Password"  CausesValidation="True" Width="295px" required="required"></asp:TextBox> 
  
           
    </div>
      </fieldset>
    <br>
<br>    <fieldset class="field_set">
        <legend class="auto-style1">Other Information</legend>
<div>
   <asp:Label ID="addresslbl" runat="server">Address
   </asp:Label> <br />   
    <asp:TextBox ID="address" runat="server"  style="height:100px"  placeholder="flat no.,building name,street,city,District" Width="295px"  />
</div>
<div>
    <asp:Label ID="zip" runat="server">Zip code<br />
    </asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
    <br /> 
    <asp:TextBox runat="server" ID="zipcode" name='zip' placeholder='your zipcode here' Width="295px" />
    <br />
    
</div>
        </fieldset> 
    <div id="button">
        <br>
<asp:Button ID="Button1" CssClass="Button1" runat="server"  Text="Register" Width="117px" OnClick="Button1_Click"    />
   
</div>
			</section>
                </center>
			<!-- Resume Section End-->
			<!-- project Section
				================================================== -->
		
			
			

           
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
			<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
			<script type="text/javascript" src="js/materialize.min.js"></script>
		 

        </form>
	</body>
</html>
