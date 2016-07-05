<%@ page import="domain.Student" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
	Student user = (Student)request.getSession().getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Unicorn Admin</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/fullcalendar.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/unicorn.main.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/uniform.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/css/select2.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/css/unicorn.grey.css" class="skin-color"/>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap-table.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <style>
        .dl-horizontal dt {
            width: 60px;
        }

        .dl-horizontal dd {
            margin-left: 80px;
            color: red;
        }
    </style>
    
    <script>
	    function Logout(){
	        //访问LogoutServlet注销当前登录的用户
	        window.location.href="${pageContext.request.contextPath}/servlet/LoginOutSerlvet";
	    }
    </script>
</head>
<body>

	<% if(session.getAttribute("user") == null){
		response.sendRedirect(path + "/servlet/login");
		return;
	}%>

<div id="header">
    <h1><a href="./dashboard.html">Admin</a></h1>
</div>

<!--<div id="search">-->
<!--<input type="text" placeholder="Search here..." /><button type="submit" class="tip-right" title="Search"><i class="icon-search icon-white"></i></button>-->
<!--</div>-->
<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav btn-group">
        <li class="btn btn-inverse"><a title="" href="#"><i class="icon icon-user"></i> <span
                class="text">Profile</span></a></li>
        <!--<li class="btn btn-inverse dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>-->
        <!--<ul class="dropdown-menu">-->
        <!--<li><a class="sAdd" title="" href="#">new message</a></li>-->
        <!--<li><a class="sInbox" title="" href="#">inbox</a></li>-->
        <!--<li><a class="sOutbox" title="" href="#">outbox</a></li>-->
        <!--<li><a class="sTrash" title="" href="#">trash</a></li>-->
        <!--</ul>-->
        <!--</li>-->
        <!--<li class="btn btn-inverse"><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>-->
        <li class="btn btn-inverse"><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span
                class="text">Logout</span></a></li>
    </ul>
</div>

<div id="sidebar">
    <a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
        <li class="active"><a href="index.html"><i class="icon icon-home"></i> <span>Dashboard</span></a></li>
        <!--<li class="submenu">-->
        <!--<a href="#"><i class="icon icon-th-list"></i> <span>Form elements</span> <span class="label">3</span></a>-->
        <!--<ul>-->
        <!--<li><a href="form-common.html">Common elements</a></li>-->
        <!--<li><a href="form-validation.html">Validation</a></li>-->
        <!--<li><a href="form-wizard.html">Wizard</a></li>-->
        <!--</ul>-->
        <!--</li>-->
        <!--<li><a href="buttons.html"><i class="icon icon-tint"></i> <span>Buttons &amp; icons</span></a></li>-->
        <!--<li><a href="interface.html"><i class="icon icon-pencil"></i> <span>Interface elements</span></a></li>-->
        <li><a href="#"><i class="icon icon-th"></i> <span>预留</span></a></li>
        <!--<li><a href="grid.html"><i class="icon icon-th-list"></i> <span>Grid Layout</span></a></li>-->
        <!--<li class="submenu">-->
        <!--<a href="#"><i class="icon icon-file"></i> <span>Sample pages</span> <span class="label">4</span></a>-->
        <!--<ul>-->
        <!--<li><a href="invoice.html">Invoice</a></li>-->
        <!--<li><a href="chat.html">Support chat</a></li>-->
        <!--<li><a href="calendar.html">Calendar</a></li>-->
        <!--<li><a href="gallery.html">Gallery</a></li>-->
        <!--</ul>-->
        <!--</li>-->
        <!--<li>-->
        <!--<a href="charts.html"><i class="icon icon-signal"></i> <span>Charts &amp; graphs</span></a>-->
        <!--</li>-->
        <!--<li>-->
        <!--<a href="widgets.html"><i class="icon icon-inbox"></i> <span>Widgets</span></a>-->
        <!--</li>-->
    </ul>

</div>

<div id="style-switcher">
    <i class="icon-arrow-left icon-white"></i>
    <span>Style:</span>
    <a href="#grey" style="background-color: #555555;border-color: #aaaaaa;"></a>
    <a href="#blue" style="background-color: #2D2F57;"></a>
    <a href="#red" style="background-color: #673232;"></a>
</div>

<div id="content">
    <div id="content-header">
        <h1>Dashboard</h1>
        <!--<div class="btn-group">-->
        <!--<a class="btn btn-large tip-bottom" title="Manage Files"><i class="icon-file"></i></a>-->
        <!--<a class="btn btn-large tip-bottom" title="Manage Users"><i class="icon-user"></i></a>-->
        <!--<a class="btn btn-large tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a>-->
        <!--<a class="btn btn-large tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a>-->
        <!--</div>-->
    </div>
    <div id="breadcrumb">
        <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
        <a href="#" class="current">Dashboard</a>
    </div>
    <div class="container-fluid">

        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title">
								<span class="icon">
									<i class="icon-th-list"></i>
								</span>
                        <h5>缴费须知</h5>
                    </div>
                    <div class="widget-content">
                        <p>同学，你好!</p>
                        <p>根据“四川外国语大学成都学院各学习中心学费缴纳及结算办法”的规定：</p>　　
                        <p>1) 2014年春季(含)及以后入学的学生全部实行网上缴费，具体的缴费标准及网上缴费流程详见附件内容。(包括201403批次，201409批次，201503批次及以后各批次)</p>
                        <p>2) 2013年秋季(含)及之前批次入学的学生，学生学费由校本部学习中心代为收取，收取后全额上缴至北京航空航天大学财务处，具体的缴费标准及缴费方式详见附件内容。(包括201109批次，201203批次，201209批次，201303批次，201309批次)</p>
                        <p>请各批次已录取的学生及时核对本人学费的缴纳情况，如有疑问，请拨打联系电话：82313925-6122咨询。</p>　　
                    </div>
                </div>
            </div>
        </div>

        <div class="row-fluid">



            <div class="span3">
                <div class="widget-box">
                    <div class="widget-title">
								<span class="icon">
									<i class="icon-th-list"></i>
								</span>
                        <h5>学生信息</h5>
                    </div>
                    <div class="widget-content">
                        <dl class="dl-horizontal">
                            <dt>学号</dt>
                            <dd><%= user.getStuNum() %></dd>
                            <dt>姓名</dt>
                            <dd><%= user.getName() %></dd>
                            <dt>身份证号</dt>
                            <dd><%= user.getIDCard() %></dd>
                            <dt>班级</dt>
                            <dd><%= user.getsClass() %></dd>
                            <dt>专业</dt>
                            <dd><%= user.getDirection() %></dd>
                            <dt>院系</dt>
                            <dd><%= user.getDepartment() %></dd>
                          
                        </dl>
                    </div>
                </div>
            </div>

            <div class="span9">
                <div class="widget-box">
                    <div class="widget-title">
		                <span class="icon"> <i class="icon-th"></i>	</span>
                        <h5>费用信息</h5>
                    </div>
                    <div class="widget-content">
                        <table id="table" data-toggle="table" data-click-to-select="true" data-classes="table table-hover table-condensed" data-search="false"
                               data-show-refresh="false" data-pagination="false" data-show-columns="false" data-url="<%= path %>/servlet/userJson?Idcard=<%= user.getIDCard() %>"> <!-- data-url="data.json" data-page-list="[5, 10, 20, 50, 100, 200]"-->
                            <thead>
                            <tr>
                                <th data-field="ID_Card" data-align="center">身份证</th>
                                <th data-field="serialNumber" data-align="center">流水号</th>
                                <th data-field="PaymentStatus" data-align="center">缴费状态</th>
                                <th data-field="paymentSemester" data-align="center">学期</th>
                                <th data-field="paymentDate" data-align="center">缴费日期</th>
                                <th data-field="totalPayable" data-align="center">应交总额</th>
                                <th data-field="totalPaid" data-align="center">实交总额</th>
                                <th data-field="Payers" data-align="center">缴费人</th>
                                <th data-field="department" data-align="center">院系</th>
                                <th data-field="direction" data-align="center">学费</th>
                                <th data-field="lodging" data-align="center">住宿费</th>
                                <th data-field="bookFees" data-align="center">书本费</th>
                            </tr>
                            </thead>
                        </table>
                        <button class="btn btn-success">缴费</button>
                    </div>
                </div>
            </div>
        </div>


        <!--<div class="row-fluid">-->
        <!--<div class="span12 center" style="text-align: center;">					-->
        <!--<ul class="stat-boxes">-->
        <!--<li>-->
        <!--<div class="left peity_bar_good"><span>2,4,9,7,12,10,12</span>+20%</div>-->
        <!--<div class="right">-->
        <!--<strong>36094</strong>-->
        <!--Visits-->
        <!--</div>-->
        <!--</li>-->
        <!--<li>-->
        <!--<div class="left peity_bar_neutral"><span>20,15,18,14,10,9,9,9</span>0%</div>-->
        <!--<div class="right">-->
        <!--<strong>1433</strong>-->
        <!--Users-->
        <!--</div>-->
        <!--</li>-->
        <!--<li>-->
        <!--<div class="left peity_bar_bad"><span>3,5,9,7,12,20,10</span>-50%</div>-->
        <!--<div class="right">-->
        <!--<strong>8650</strong>-->
        <!--Orders-->
        <!--</div>-->
        <!--</li>-->
        <!--<li>-->
        <!--<div class="left peity_line_good"><span>12,6,9,23,14,10,17</span>+70%</div>-->
        <!--<div class="right">-->
        <!--<strong>8650</strong>-->
        <!--Orders-->
        <!--</div>-->
        <!--</li>-->
        <!--</ul>-->
        <!--</div>	-->
        <!--</div>-->
        <!--<div class="row-fluid">-->
        <!--<div class="span12">-->
        <!--<div class="alert alert-info">-->
        <!--Welcome in the <strong>Unicorn Admin Theme</strong>. Don't forget to check all the pages!-->
        <!--<a href="#" data-dismiss="alert" class="close">×</a>-->
        <!--</div>-->
        <!--<div class="widget-box">-->
        <!--<div class="widget-title"><span class="icon"><i class="icon-signal"></i></span><h5>Site Statistics</h5><div class="buttons"><a href="#" class="btn btn-mini"><i class="icon-refresh"></i> Update stats</a></div></div>-->
        <!--<div class="widget-content">-->
        <!--<div class="row-fluid">-->
        <!--<div class="span4">-->
        <!--<ul class="site-stats">-->
        <!--<li><i class="icon-user"></i> <strong>1433</strong> <small>Total Users</small></li>-->
        <!--<li><i class="icon-arrow-right"></i> <strong>16</strong> <small>New Users (last week)</small></li>-->
        <!--<li class="divider"></li>-->
        <!--<li><i class="icon-shopping-cart"></i> <strong>259</strong> <small>Total Shop Items</small></li>-->
        <!--<li><i class="icon-tag"></i> <strong>8650</strong> <small>Total Orders</small></li>-->
        <!--<li><i class="icon-repeat"></i> <strong>29</strong> <small>Pending Orders</small></li>-->
        <!--</ul>-->
        <!--</div>-->
        <!--<div class="span8">-->
        <!--<div class="chart"></div>-->
        <!--</div>	-->
        <!--</div>							-->
        <!--</div>-->
        <!--</div>					-->
        <!--</div>-->
        <!--</div>-->
        <!--<div class="row-fluid">-->
        <!--<div class="span6">-->
        <!--<div class="widget-box">-->
        <!--<div class="widget-title"><span class="icon"><i class="icon-file"></i></span><h5>Recent Posts</h5><span title="54 total posts" class="label label-info tip-left">54</span></div>-->
        <!--<div class="widget-content nopadding">-->
        <!--<ul class="recent-posts">-->
        <!--<li>-->
        <!--<div class="user-thumb">-->
        <!--<img width="40" height="40" alt="User" src="img/demo/av2.jpg" />-->
        <!--</div>-->
        <!--<div class="article-post">-->
        <!--<span class="user-info"> By: neytiri on 2 Aug 2012, 09:27 AM, IP: 186.56.45.7 </span>-->
        <!--<p>-->
        <!--<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>-->
        <!--</p>-->
        <!--<a href="#" class="btn btn-primary btn-mini">Edit</a> <a href="#" class="btn btn-success btn-mini">Publish</a> <a href="#" class="btn btn-danger btn-mini">Delete</a>-->
        <!--</div>-->
        <!--</li>-->
        <!--<li>-->
        <!--<div class="user-thumb">-->
        <!--<img width="40" height="40" alt="User" src="img/demo/av3.jpg" />-->
        <!--</div>-->
        <!--<div class="article-post">-->
        <!--<span class="user-info"> By: john on on 24 Jun 2012, 04:12 PM, IP: 192.168.24.3 </span>-->
        <!--<p>-->
        <!--<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>-->
        <!--</p>-->
        <!--<a href="#" class="btn btn-primary btn-mini">Edit</a> <a href="#" class="btn btn-success btn-mini">Publish</a> <a href="#" class="btn btn-danger btn-mini">Delete</a>-->
        <!--</div>-->
        <!--</li>-->
        <!--<li>-->
        <!--<div class="user-thumb">-->
        <!--<img width="40" height="40" alt="User" src="img/demo/av1.jpg" />-->
        <!--</div>-->
        <!--<div class="article-post">-->
        <!--<span class="user-info"> By: michelle on 22 Jun 2012, 02:44 PM, IP: 172.10.56.3 </span>-->
        <!--<p>-->
        <!--<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>-->
        <!--</p>-->
        <!--<a href="#" class="btn btn-primary btn-mini">Edit</a> <a href="#" class="btn btn-success btn-mini">Publish</a> <a href="#" class="btn btn-danger btn-mini">Delete</a>-->
        <!--</div>-->
        <!--</li>-->
        <!--<li class="viewall">-->
        <!--<a title="View all posts" class="tip-top" href="#"> + View all + </a>-->
        <!--</li>-->
        <!--</ul>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--<div class="span6">-->
        <!--<div class="widget-box">-->
        <!--<div class="widget-title"><span class="icon"><i class="icon-comment"></i></span><h5>Recent Comments</h5><span title="88 total comments" class="label label-info tip-left">88</span></div>-->
        <!--<div class="widget-content nopadding">-->
        <!--<ul class="recent-comments">-->
        <!--<li>-->
        <!--<div class="user-thumb">-->
        <!--<img width="40" height="40" alt="User" src="img/demo/av1.jpg" />-->
        <!--</div>-->
        <!--<div class="comments">-->
        <!--<span class="user-info"> User: michelle on IP: 172.10.56.3 </span>-->
        <!--<p>-->
        <!--<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>-->
        <!--</p>-->
        <!--<a href="#" class="btn btn-primary btn-mini">Edit</a> <a href="#" class="btn btn-success btn-mini">Approve</a> <a href="#" class="btn btn-warning btn-mini">Mark as spam</a> <a href="#" class="btn btn-danger btn-mini">Delete</a>-->
        <!--</div>-->
        <!--</li>-->
        <!--<li>-->
        <!--<div class="user-thumb">-->
        <!--<img width="40" height="40" alt="User" src="img/demo/av3.jpg" />-->
        <!--</div>-->
        <!--<div class="comments">-->
        <!--<span class="user-info"> User: john on IP: 192.168.24.3 </span>-->
        <!--<p>-->
        <!--<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>-->
        <!--</p>-->
        <!--<a href="#" class="btn btn-primary btn-mini">Edit</a> <a href="#" class="btn btn-success btn-mini">Approve</a> <a href="#" class="btn btn-warning btn-mini">Mark as spam</a> <a href="#" class="btn btn-danger btn-mini">Delete</a>-->
        <!--</div>-->
        <!--</li>-->
        <!--<li>-->
        <!--<div class="user-thumb">-->
        <!--<img width="40" height="40" alt="User" src="img/demo/av2.jpg" />-->
        <!--</div>-->
        <!--<div class="comments">-->
        <!--<span class="user-info"> User: neytiri on IP: 186.56.45.7 </span>-->
        <!--<p>-->
        <!--<a href="#">Vivamus sed auctor nibh congue, ligula vitae tempus pharetra...</a>-->
        <!--</p>-->
        <!--<a href="#" class="btn btn-primary btn-mini">Edit</a> <a href="#" class="btn btn-success btn-mini">Approve</a> <a href="#" class="btn btn-warning btn-mini">Mark as spam</a> <a href="#" class="btn btn-danger btn-mini">Delete</a>-->
        <!--</div>-->
        <!--</li>-->
        <!--<li class="viewall">-->
        <!--<a title="View all comments" class="tip-top" href="#"> + View all + </a>-->
        <!--</li>-->
        <!--</ul>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--<div class="row-fluid">-->
        <!--<div class="span12">-->
        <!--<div class="widget-box widget-calendar">-->
        <!--<div class="widget-title"><span class="icon"><i class="icon-calendar"></i></span><h5>Calendar</h5></div>-->
        <!--<div class="widget-content nopadding">-->
        <!--<div class="calendar"></div>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <div class="row-fluid">
            <div id="footer" class="span12">
                2016 &copy; <a href="#">四川外国语大学成都学院</a>
            </div>
        </div>
    </div>
</div>


<!-- <script src="<%=basePath%>assets/js/excanvas.min.js"></script> -->
<script src="<%=basePath%>assets/js/jquery.min.js"></script>
<script src="<%=basePath%>assets/js/jquery.ui.custom.js"></script>
<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
<!--<script src="<%=basePath%>assets/js/jquery.flot.min.js"></script>-->
<!--<script src="<%=basePath%>assets/js/jquery.flot.resize.min.js"></script>-->
<!-- <script src="<%=basePath%>assets/js/jquery.peity.min.js"></script> -->
<!-- <script src="<%=basePath%>assets/js/fullcalendar.min.js"></script> -->
<script src="<%=basePath%>assets/js/unicorn.js"></script>
<!--<script src="<%=basePath%>assets/js/unicorn.dashboard.js"></script>-->
<!-- <script src="<%=basePath%>assets/js/select2.min.js"></script> -->
<!-- <script src="<%=basePath%>assets/js/jquery.dataTables.min.js"></script> -->
<!--<script src="<%=basePath%>assets/js/unicorn.tables.js"></script>-->

<!-- Latest compiled and minified JavaScript -->
<script src="<%=basePath%>assets/js/bootstrap-table.min.js"></script>
<!-- Latest compiled and minified Locales -->
<script src="<%=basePath%>assets/js/bootstrap-table-zh-CN.js"></script>

<!-- <script>

$(function(){
	var $table = $('#table');
		
	$.ajax({
	    type: "POST",
	    url: "<%= path %>/servlet/userJson",
	    data: {Idcard:'<%= user.getIDCard() %>'},
	    dataType: "json",
	    success: function(data){
					// $table.bootstrapTable({data: data});
	 	   			console.log(JSON.stringify(data));
	 	   			console.log(JSON.stringify(j));
	             }
	});
});

</script>
 --></body>
</html>
