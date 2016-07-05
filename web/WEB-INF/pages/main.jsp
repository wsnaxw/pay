<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Main</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/unicorn.main.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/uniform.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/select2.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/css/unicorn.grey.css" class="skin-color"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap-table.min.css">
</head>
<body>
	<% if(session.getAttribute("userbean") == null){
		response.sendRedirect(path + "/login");
		return;
	}%>

<div id="header">
    <h1><a href="./dashboard.html">Admin</a></h1>
</div>

<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav btn-group">
        <li class="btn btn-inverse"><a title="" href="#"><i class="icon icon-user"></i> <span
                class="text">Profile</span></a></li>
        <li class="btn btn-inverse"><a title="" href="<%= path %>/signout"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
    </ul>
</div>

<div id="sidebar">
    <a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
        <li class="active"><a href="index.html"><i class="icon icon-home"></i> <span>信息查看</span></a></li>
        <li><a href="#" data-toggle="modal" data-target="#import"><i class="icon icon-th"></i> <span>导入数据</span></a></li>
        <li><a href="#"><i class="icon icon-th"></i> <span>导出数据</span></a></li>
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
    </div>
    <div id="breadcrumb">
        <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a>
        <a href="#" class="current">Dashboard</a>
    </div>
    <div class="container-fluid">

        <div class="row-fluid">
            <div class="span12">
                <!-- TABLE -->
                <table id="table" data-toggle="table" data-click-to-select="true"
                       data-classes="table table-hover table-condensed" data-search="true"
                       data-show-refresh="true" data-pagination="true" data-show-columns="true"
                       data-height="810" data-page-list="[5, 10, 20, 50, 100, 200]"
                       data-url="<%= path %>/adminjson">
                    <thead>
                    <tr>
                        <th data-field="ID" data-align="center">ID</th>
                        <th data-field="name" data-align="center">姓名</th>
                        <th data-field="stuNum" data-align="center">学号</th>
                        <th data-field="IDCard" data-align="center">身份证</th>
                        <th data-field="department" data-align="center">院系</th>
                        <th data-field="grade" data-align="center">年级</th>
                        <th data-field="sClass" data-align="center">班级</th>
                        <th data-field="direction" data-align="center">方向</th>
                        <th data-field="educationalSystem" data-align="center">学制</th>
                    </tr>
                    </thead>
                </table>
                <!-- END TABLE -->　
            </div>
        </div>
        
        <!-- Modal -->
		<div class="modal fade" id="import" tabindex="-1" role="dialog" aria-labelledby="import">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title" id="importLabel">导入Excel数据</h4>
		      </div>
		      
		      <form action="<%= path %>/importexcel" method="post" enctype="multipart/form-data">
		      <div class="modal-body">
				<div class="control-group">
					<label class="control-label">File upload input</label>
					<div class="controls">
						<input type="file" name="file" />
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="submit" class="btn btn-primary">导入</button>
		      </div>
		      </form>
		      
		    </div>
		  </div>
		</div>

        <div class="row-fluid">
            <div id="footer" class="span12">
                2016 &copy; <a href="#">四川外国语大学成都学院</a>
            </div>
        </div>
    </div>
</div>


<script src="<%=basePath%>assets/js/excanvas.min.js"></script>

<script src="<%=basePath%>assets/js/jquery.min.js"></script>
<script src="<%=basePath%>assets/js/jquery.ui.custom.js"></script>
<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
<script src="<%=basePath%>assets/js/unicorn.js"></script>

<script src="<%=basePath%>assets/js/select2.min.js"></script>

<script src="<%=basePath%>assets/js/jquery.uniform.js"></script>
<script src="<%=basePath%>assets/js/unicorn.js"></script>
<script src="<%=basePath%>assets/js/unicorn.form_common.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="<%=basePath%>assets/js/bootstrap-table.min.js"></script>
<!-- Latest compiled and minified Locales -->
<script src="<%=basePath%>assets/js/bootstrap-table-zh-CN.js"></script>

<script type="text/javascript">
$(function () {
    $(window).resize(function () {
        $('#table').bootstrapTable('resetView');
    });
});
</script>

</body>
</html>