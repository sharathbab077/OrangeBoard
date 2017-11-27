<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="OrangeBoard.homepage" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <!--- Basic Page Needs
			================================================== -->
        <meta charset="utf-8">
        <title>Flash Card App</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Mobile Specific Metas
			================================================== -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
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
                        <li><a class="smoothscroll" href="#project">Lessons</a></li>
                    </ul>
                    <!-- end #nav -->
                </nav>
                <!-- end #nav-wrap -->
                <div class="row banner">
                    <div class="banner-text">
                        <h1>
							ORANGE BOARD
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
                <div class="row-education">

                    <div class="nine columns header-col">
                        <div class="container">
                            <div class="row">

                            </div>
                            <div class="row">

                            </div>
                        </div>

                    </div>
                    <div class="row education">

                        <div class="three columns header-col">

                        </div>

                        <div class="nine columns main-col">

                            <div class="row item">

                                <div class="twelve columns">

                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <asp:Label ID="lbl" runat="server" Text="SUID:"></asp:Label>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtboxsuid" runat="server" required="required" Width="295px"></asp:TextBox>   
                                        </div>

                                        <div class="col-md-6">
                                            <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
                                        </div>
                                        <div class="col-md-6">
                                             <asp:TextBox ID="txtPassword" runat="server" CausesValidation="True" required="required" TextMode="Password" Width="295px"></asp:TextBox>
                      
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Login" OnClick="Button1_Click" />
                                            <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="Register" OnClick="Button2_Click" />
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>

            </section>

            <!-- project Section
   ================================================== -->
            <section id="project">

                <div class="row">

                    <div class="twelve columns collapsed">

                        <!--  <h1>Check out some of the cool projects i made</h1>-->

                        <!-- project-wrapper -->
                        <div id="project-wrapper" class="bgrid-quarters s-bgrid-thirds cf">

                            <div class="columns project-item">
                                <div class="item-wrap">

                                    <a href="#modal-01" title="">
                                        <img class="img-responsive" alt="" src="images/otto.png">
                                        <div class="overlay">
                                            <div class="project-item-meta">
                                                <h5>Complexity Checker</h5>
                                                <p>Artificial Intelligence</p>
                                            </div>
                                        </div>
                                        <div class="link-icon"><i class="icon-plus"></i></div>
                                    </a>

                                </div>
                            </div>
                            <!-- item end -->

                            <div class="columns project-item">
                                <div class="item-wrap">

                                    <a href="#modal-02" title="">
                                        
                                        <img class="img-responsive" alt="" src="images/otto.png">
                                        <div class="overlay">
                                            <div class="project-item-meta">
                                                <h5>Complexity Checker</h5>
                                                <p>Coding Assignment</p>
                                            </div>
                                        </div>
                                        <div class="link-icon"><i class="icon-plus"></i></div>
                                    </a>

                                </div>
                            </div>
                            <!-- item end -->
                            <!--done  Key Value Database -->
                            <div class="columns project-item">
                                <div class="item-wrap">

                                    <a href="#modal-03" title="">
                                        <img class="img-responsive" alt="" src="images/otto.png">
                                        <div class="overlay">
                                            <div class="project-item-meta">
                                                <h5>SMS Notifications</h5>
                                                <p>Career Services</p>
                                            </div>
                                        </div>
                                        <div class="link-icon"><i class="icon-plus"></i></div>
                                    </a>

                                </div>
                            </div>
                            <!-- item end -->

                            <div class="columns project-item">
                                <div class="item-wrap">

                                    <a href="#modal-03" title="">
                                        <img class="img-responsive" alt="" src="images/otto.png">
                                        <div class="overlay">
                                            <div class="project-item-meta">
                                                <h5>Chat Bot</h5>

                                            </div>
                                        </div>
                                        <div class="link-icon"><i class="icon-plus"></i></div>
                                    </a>

                                </div>
                            </div>

                            <div class="container">

                            </div>
                        </div>
                        <!-- project-wrapper end -->

                    </div>
                    <!-- twelve columns end -->

                    <!-- Modal Popup
              --------------------------------------------------------------- -->

                    <div id="modal-01" class="popup-modal mfp-hide">

                        <div class="description-box">
                            <h4>OrangeBoard</h4>
                            <p>
                                <span>&bull; All in one place for ur student needs.</span>
                                <br>
                                <span>&bull; .</span>
                                <br>
                                <span>&bull; </span>
                                <br>
                            </p>

                        </div>

                        <div class="link-box">
                            <a href="" target="_blank">Link</a>
                            <a class="popup-modal-dismiss">Close</a>
                        </div>

                    </div>
                    <!-- modal-01 End -->
                    <!-- Supermarket teller -->
                    <div id="modal-02" class="popup-modal mfp-hide">

                        <div class="description-box">
                            <h4>Complexity Checker</h4>

                            <p>
                                <span>&bull; Complexity checking</span>
                                <br>
                                <span>&bull; .</span>
                                <br>
                                <span>&bull; </span>
                                <br>
                            </p>

                        </div>

                        <div class="link-box">
                            <a href="#" target="_blank">Details</a>
                            <a class="popup-modal-dismiss">Close</a>
                        </div>

                    </div>
                    <!-- modal-02 End -->

                    <div id="modal-03" class="popup-modal mfp-hide">

                        <div class="description-box">
                            <h4>SMS Notifications</h4>
                            <p>
                                <span>&bull; We send SMS to students.</span>
                                <br>
                                <span>&bull; </span>
                                <br>

                            </p>

                        </div>

                        <div class="link-box">
                            <a href="#" target="_blank">Details</a>
                            <a class="popup-modal-dismiss">Close</a>
                        </div>

                    </div>
                    <!-- modal-03 End -->

                    <div id="modal-04" class="popup-modal mfp-hide">

                        <div class="description-box">
                            <h4>Chat Bot</h4>
                            <p>
                                <span>&bull;</span>
                                <br>
                                <span>&bull;</span>
                                <br>
                                <span>&bull;</span>
                                <br>

                            </p>
                            <span class="categories"><i class="fa fa-tag"></i>C++</span>
                        </div>

                        <div class="link-box">
                            <a href="#" target="_blank">Details</a>
                            <a class="popup-modal-dismiss">Close</a>
                        </div>

                    </div>
                    <!-- modal-04 End -->

                </div>
                <!-- row End -->

            </section>

            <section id="About">

            </section>

            <footer>
                <div class="row">
                    <div class="col-md-3">
                        <h5 style="color:white">OrangeBoard</h5>
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