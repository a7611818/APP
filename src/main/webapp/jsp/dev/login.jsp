<%--
  Created by IntelliJ IDEA.
  User: ybq
  Date: 2019/2/23
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理-登陆</title>
    <link rel="stylesheet" href="${ctx}/static/plugin/layui/css/layui.css">
    <%--<link rel="stylesheet" href="css/admin.css">--%>
    <style>

        body {
            background-color: #e7e7e7;
        }

        input:-webkit-autofill {
            -webkit-box-shadow: inset 0 0 0 1000px #fff;
            background-color: transparent;

        }

        .admin-login-background {
            width: 300px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -150px;
            margin-top: -100px;
        }

        .admin-header {
            margin-top: -100px;
            margin-bottom: 20px;
        }

        .admin-logo {
            width: 280px;
        }

        .admin-button {
            margin-top: 20px;
        }

        .admin-input {

            border-top-style: none;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            height: 50px;
            width: 300px;
            padding-bottom: 0px;
        }


        .admin-input-username {
            border-top-style: solid;
            border-radius: 10px 10px 0 0;
        }

        .admin-input-verify {
            border-radius: 0 0 10px 10px;
        }

        .admin-button {
            width: 300px;
            height: 50px;
            border-radius: 4px;
            background-color: #2d8cf0;
        }

        .admin-icon {
            margin-left: 260px;
            margin-top: 10px;
            font-size: 30px;
        }

        i {
            position: absolute;
        }

        .admin-captcha {
            position: absolute;
            margin-left: 205px;
            margin-top: -40px;
        }
    </style>
</head>
<body>
${errorMsg}
<div id="container">
    <div></div>
    <div class="admin-login-background">
        <!--<div class="admin-header">-->
        <!--<img src="image/ex_logo.png" class="admin-logo">-->
        <!--</div>-->
        <form class="layui-form" action="${ctx}/dev/login" method="post">
            <div>
                <i class="layui-icon layui-icon-username admin-icon admin-icon-username"></i>
                <input type="text" name="devCode" placeholder="请输入用户名"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-username">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon admin-icon-password"></i>
                <input type="password" name="devPassword"
                       placeholder="请输入密码"
                       autocomplete="off"
                       class="layui-input admin-input">
            </div>
            <div>
                <input type="text" name="verify"
                       placeholder="请输入验证码"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-verify">
                <img class="admin-captcha" src=""
                     onclick="updateVerify()">
            </div>
            <button class="layui-btn admin-button" lay-submit lay-filter="formDemo">登陆</button>


        </form>
    </div>
</div>
<script src="layui/layui.js"></script>
<script>

    function updateVerify() {

    }


</script>
</body>
</html>
