
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>管理员/门卫注册</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="../static/css/templatemo_main.css">
    <script src="../static/js/jquery.min.js"></script>
    <script src="../static/js/js.cookie.js"></script>
</head>
<body background="../static/img/background_login.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="logo"><h1>小区门禁管理系统——管理员/门卫注册</h1></div>
        </div>
    </div>
    <div class="template-page-wrapper">
        <form class="form-horizontal templatemo-signin-form" role="form" onsubmit="return false" id="admin_registerForm"
               method="post">
            <div class="form-group">
                <div class="col-md-12">
                    <label for="name" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" placeholder="Username">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" placeholder="Password">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="UID" class="col-sm-2 control-label">工号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="UID" placeholder="userID">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="confirmpassword" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="confirmpassword" placeholder="confirmpassword">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label for="Verification_Code" class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="Verification_Code" placeholder="Verification_Code">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="registerButton" class="btn btn-primary  btn-block">管理员注册</button>
                        <p style="text-align: right;color: red;position: absolute" id="info_register"></p><br/>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="registerButton_Door" class="btn btn-primary  btn-block">门卫注册</button>
                        <p style="text-align: right;color: red;position: absolute" id="info_register_Door"></p><br/>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function () {
            $("#registerButton").click(function () {
                var name = $("#name").val();
                var password = $("#password").val();
                var UID = $("#UID").val();
                var confirmpassword = $("#confirmpassword").val();
                var Verification_Code = $("#Verification_Code").val();
                $("#info_register_Door").text("");
                if (name === '') {
                    $("#info_register").text("提示:账号不能为空");
                } else if (password === '') {
                    $("#info_register").text("提示:密码不能为空");
                } else if (password.length < 6) {
                    $("#info_register").text("提示:密码不能少于6位");
                } else if (UID === '') {
                    $("#info_register").text("提示:工号不能为空");
                } else if (UID.length != 5){
                    $("#info_register").text("提示:工号位数错误");
                } else if (Number(confirmpassword) != Number(password)){
                    $("#info_register").text("提示:两次密码不一致");
                } else if(Verification_Code != "1234") {
                    $("#info_register").text("提示:验证码错误");
                } else {
                    $.ajax({
                        type: "POST",
                        url: "/api/AdminRegisterCheck",
                        data: {
                            name: name,
                            password: password,
                            UID: UID
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.stateCode.trim() === "0") {
                                $("#info_register").text("提示:注册失败！");

                            } else if (data.stateCode.trim() === "2") {
                                $("#info_register").text("提示:账号已经存在 注册失败！");

                            } else if (data.stateCode.trim() === "1") {
                                $("#info_register").text("提示:注册成功，跳转中...");
                                window.location.href = "login.html";
                            }
                        }
                    });
                }
            });


            $("#registerButton_Door").click(function () {
                var Dname = $("#name").val();
                var Dpassword = $("#password").val();
                var DUID = $("#UID").val();
                var Verification_Code = $("#Verification_Code").val();
                var confirmpassword = $("#confirmpassword").val();
                $("#info_register").text("");
                if (Dname === '') {
                    $("#info_register_Door").text("提示:账号不能为空");
                } else if (Dpassword === '') {
                    $("#info_register_Door").text("提示:密码不能为空");
                } else if (Dpassword.length < 6) {
                    $("#info_register_Door").text("提示:密码不能少于6位");
                } else if (DUID === '') {
                    $("#info_register_Door").text("提示:工号不能为空");
                } else if (DUID.length != 5){
                    $("#info_register_Door").text("提示:工号位数错误");
                } else if (Number(confirmpassword) != Number(Dpassword)){
                    $("#info_register_Door").text("提示:两次密码不一致");
                } else if(Verification_Code != "4321") {
                    $("#info_register_Door").text("提示:验证码错误");
                } else {
                    $.ajax({
                        type: "POST",
                        url: "/api/AdminRegisterCheck_Door",
                        data: {
                            Dname: Dname,
                            Dpassword: Dpassword,
                            DUID: DUID
                        },
                        dataType: "json",
                        success: function (data) {

                            if (data.stateCode.trim() === "0") {
                                $("#info_register_Door").text("提示:注册失败！");

                            } else if (data.stateCode.trim() === "2") {
                                $("#info_register_Door").text("提示:账号已经存在 注册失败！");

                            } else if (data.stateCode.trim() === "1") {
                                $("#info_register_Door").text("提示:注册成功，跳转中...");
                                window.location.href = "login.html";
                            }
                        }
                    });
                }
            });

        })

    </script>
</div>
</body>
</html>
