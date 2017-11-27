<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="c2.aspx.cs" Inherits="OrangeBoard.c2" %>



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
                        <li><a class="smoothscroll" href="c1.aspx">Lessons</a></li>
                       <li> <asp:LinkButton ID="LinkButton1" OnClick="linkbuttonclick" runat="server">LinkButton</asp:LinkButton></li>
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
			

            	<section id="resume">
				<div class="row work">
 <div class="three columns header-col">
                  <h1><span>Courses</span></h1>
                  <div class="container">
                     <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Courses
                        <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                           <li><a href="#"> CIS Software Engineering</a></li>
                           <li><a href="#">DataBase</a></li>
                        </ul>
                     </div>
                  </div>
               </div>

                     <div class="nine columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <h3>Software Engineering</h3>
                        <div class="well well-lg">
                           <p>
                              <i><b>
                              Location</b> :-Life Science Building,Syracuse University<br />
                              </i>
                              <i>
                              <b>Day of the week</b>:-Monday and Wednesday <br />
                              <b>Timings</b>:-10.00 A.M-12.00 A.M 
                              </i>
                           </p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="three columns header-col">
                  <h3>Send Message</h3>
               </div>
               <div class="nine columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        
                         <asp:TextBox ID="c2txtarea"  cols="20" rows="2" runat="server"></asp:TextBox>
                        <asp:Button ID="notifybtnc2" runat="server" Text="Notify" OnClick="notifybtnc2_Click" />
                     </div>
                  </div>
               </div>
               
               <div class="three columns header-col">
                  <h3>View Discussions</h3>
               </div>
               <div class="nine columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:Button ID="discc2btn" runat="server" Text="Discussions" />
                     </div>
                  </div>
               </div>
               <hr />

              <hr />
                <h3>Upload and Download Content of this course</h3>
              
            
              <div class="container">
                  <div class="row">
					<div class="col-md-6">
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                        </div>
        <asp:Button ID="c2btn" runat="server" OnClick="c2uploadbtn" Text="Upload" />
                      </div>
                  <div class="col-md-12">
                      
                         <i> View and Download course files here.</i>
                       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" OnRowCommand="GridView2_RowCommand" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:TemplateField HeaderText="File">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Size" HeaderText="Size" />
                <asp:BoundField DataField="Type" HeaderText="Filetype" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
                  </div>


				</div>



              </div>
            </div>
          </div>
                    </div>

			</section>















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
			<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
			<script type="text/javascript" src="js/materialize.min.js"></script>
		</form>
	</body>
</html>
