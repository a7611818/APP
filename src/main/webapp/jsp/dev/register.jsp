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

        .layui-btn-primary {
            margin-top: 20px;
        }
        .layui-btn-normal {
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

        .layui-btn-primary {
            width: 300px;
            height: 50px;
            border-radius: 4px;
            /*background-color: #2d8cf0;*/
        }

        .layui-btn-normal {
            width: 300px;
            height: 50px;
            border-radius: 4px;
            /*background-color: #2d8cf0;*/
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
<body onload="alertError()">
<div id="container">
    <div class="admin-login-background">
        <!--<div class="admin-header">-->
        <!--<img src="image/ex_logo.png" class="admin-logo">-->
        <!--</div>-->
        <form class="layui-form" action="${ctx}/dev/register" method="post">
            <div>
                <i class="layui-icon layui-icon-username admin-icon admin-icon-username"></i>
                <input type="text" name="devCode" placeholder="请输入用户名"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-username">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon admin-icon-password"></i>
                <input type="password" name="devPassword" id="pw"
                       placeholder="请输入密码"
                       autocomplete="off"
                       class="layui-input admin-input">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon admin-icon-password"></i>
                <input type="password" name="devPasswordTwo" id="pwTwo"
                       placeholder="请再次输入密码"
                       autocomplete="off"
                       class="layui-input admin-input">
            </div>
            <div>
                <input type="text" name="code"
                       placeholder="请输入验证码"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-verify">
                <img class="admin-captcha" src=""
                     onclick="updateVerify()">
            </div>
            <a href="#" onclick="changeImg()"><img id="imgObj" alt="验证码" src="${ctx}/app/getCode"></a><br/>

            <button class="layui-btn layui-btn-normal" onclick="checkPw()">注册</button>

        </form>
    </div>
</div>
<script src="layui/layui.js"></script>
<script src="/static/plugin/jQuery/jquery-3.1.1.min.js"></script>
<script>

    function alertError(){
        var error = '${errorMsg}';
        if (error != null && error !='' ){
            alert(error);
        }

    }
    function checkPw(){
        var pw = document.getElementById('pw').value;
        var pw2 = document.getElementById('pwTwo').value;
        if (pw != pw2){
            alert('密码不一致');
            window.event.returnValue = false;
        }
    }

    function changeImg() {
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }

    // 时间戳
    // 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, 20);
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }


</script>
</body>
</html>
