<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestExceptionReports.aspx.cs" Inherits="ProjectEWSD.GuestExceptionReports" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>CMR |Guest Exception Report</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.5 -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="GuestHomePage.aspx" class="navbar-brand"><font color="orange"><b>CMR</b></font><br /><font color="#00FF00">Course Monitoring Reports</font></a>
					</div>
					<div class="navbar-header pull-right">
						<a href="Login.aspx" class="navbar-brand">
							<h4>Login</h4>
						</a>
                         <a href="GuestHomePage.aspx" class="navbar-brand">
							<h4>Back home</h4>
						</a>
					</div>


				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		<div class="content-wrapper">
			<div class="container">
				<!-- Content Header (Page header) -->
				<section class="content-header">
                    <h1>Exception Reports</h1>
				</section>

				<!-- Main content -->
				<section class="content">
                    
               <table align="center">
                            
                                <asp:DataList  runat="server" CssClass="table table-bordered table-striped callout callout-info" ID="dlM">
                                    <ItemTemplate>
                                        <div class="timeline-item">
                                            <i class="fa fa-envelope bg-blue pull-left"><asp:Label  Text='<%# Eval("Title") %>' runat="server" ID="Label1" /> 
                                                <tr>
                                                    <td>
                                                        <span class="time pull-right">
                                                            <i class="fa fa-calendar">
                                                            </i>
                                                            <asp:Label CssClass="time" ID="labeldate1" runat="server" Text='<%# Eval("DateRP") %>'></asp:Label>
                                                        </span>

                                                    
                                                
                                                
                                                    <div class="timeline-body" style="width: 937px">
                                                        <asp:Label CssClass="timeline-body pull-left" ID="labelcontent1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                                                          <asp:Label Visible="false" Text='<%# Eval("IDWrite") %>' runat="server" ID="lbEmailFrom" />
                                                    </div>
                                                    <br />
                                            
                                            </td>
                                    </ItemTemplate>
                                </asp:DataList>
                           
                        </table>

                  
				</section>
				<!-- /.content -->
			</div>
		</div>
		<!-- /.container -->
	</div>
	<!-- /.content-wrapper -->

	<!-- ./wrapper -->
	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 2.3.0
		</div>
		<strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
	</footer>
	<!-- jQuery 2.1.4 -->
	<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
</body>

</html>

