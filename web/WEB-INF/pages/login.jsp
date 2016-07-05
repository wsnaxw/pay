<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Unicorn Admin</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="<%=basePath%>assets/css/unicorn.login.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    <body>
        <div id="logo">
            <img src="<%=basePath%>assets/img/logo.png" alt="" />
        </div>
        <div id="loginbox">
            <form id="loginform" class="form-vertical" action="<%=path%>/adminlogin"/>
				<p>管理员登陆</p>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-user"></i></span><input type="text" placeholder="user..." name="user" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-lock"></i></span><input type="password" placeholder="password.." name="pwd" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><input type="button" class="btn btn-inverse" id="to-recover" value="缴费入口" /></span>
                    <span class="pull-right"><input type="submit" class="btn btn-inverse" value="Login" /></span>
                </div>
            </form>

            <form id="recoverform" action="<%=path%>/userlogin" class="form-vertical" method="post"/>
				<p>学生缴费登陆</p>
				<div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-envelope"></i></span><input type="text" name="IDCard" id="IDCard" placeholder="身份证号" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><input type="button" class="btn btn-inverse" id="to-login" value="后台管理" /></span>
                    <span class="pull-right"><input type="submit" class="btn btn-inverse" id="userlogin" value="Login" /></span>
                </div>
            </form>
            
        </div>

        <script src="<%=basePath%>assets/js/jquery.min.js"></script>
        <script src="<%=basePath%>assets/js/unicorn.login.js"></script>
    </body>
</html>
