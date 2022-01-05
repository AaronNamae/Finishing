
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>管理员/门卫登陆</title>
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
            <div class="logo"><h1>小区门禁管理系统——登录</h1></div>
        </div>
    </div>
    <div class="template-page-wrapper">
        <form class="form-horizontal templatemo-signin-form" role="form" onsubmit="return false" id="loginForm"
              method="post">
            <div class="form-group">
                <div class="col-md-12">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" placeholder="Username">
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
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="remember"> Remember me
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="loginButton" class="btn btn-primary  btn-block">管理员登陆</button>
                        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="loginButton_Door" class="btn btn-primary  btn-block">门卫登陆</button>
                        <p style="text-align: right;color: red;position: absolute" id="info_Door"></p><br/>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="registerButton" class="btn btn-primary  btn-block">注册</button>
                        <p style="text-align: right;color: red;position: absolute" id="info_register"></p><br/>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="panel-body" style="margin: 0 auto ;background-color: #fff">
        <div class="panel-heading">
            <h1 class="panel-title" style="font-size: 50px;text-align: center">当前剩余空车位是：</h1>
            <p style="color: #ac2925 ;font-size: 60px;text-align: center"><strong>${emptySet}</strong></p>
        </div>
    </div>
    <script>


        // 记住登录信息
        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', {
                username: username,
                password: password,
                remember: checked
            }, {expires: 30, path: ''})
        }

        // 若选择记住登录信息，则进入页面时设置登录信息
        function setLoginStatus() {
            var loginStatusText = Cookies.get('loginStatus');
            if (loginStatusText) {
                var loginStatus;
                try {
                    loginStatus = JSON.parse(loginStatusText);
                    $('#username').val(loginStatus.username);
                    $('#password').val(loginStatus.password);
                    $("#remember").prop('checked', true);
                } catch (__) {
                }
            }
        }

        $(document).ready(function () {
            // 设置登录信息
            setLoginStatus();

            $("#loginButton").click(function () {
                var id = $("#username").val();
                var passwd = $("#password").val();
                var remember = $("#remember").prop('checked');
                if (id === '') {
                    $("#info").text("提示:账号不能为空");
                } else if (passwd === '') {
                    $("#info").text("提示:密码不能为空");
                } else {
                    $.ajax({
                        type: "POST",
                        url: "/api/loginCheck",
                        data: {
                            username: id,
                            password: passwd
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data.stateCode.trim() === "0") {
                                $("#info").text("提示:账号或密码错误！");

                            } else if (data.stateCode.trim() === "1") {
                                if (remember) {
                                    rememberLogin(id, passwd, remember);
                                } else {
                                    Cookies.remove('loginStatus');
                                }
                                $("#info").text("提示:登陆成功，跳转中...");
                                window.location.href = "index.html";
                            }
                        }
                    });
                }
            });


            $("#registerButton").click(function () {
                window.location.href = "admin_register.html";
            });
        })
        $(document).ready(function () {
            // 设置登录信息
            setLoginStatus();

        $("#loginButton_Door").click(function () {
            var Dname = $("#username").val();
            var Dpassword = $("#password").val();
            var remember = $("#remember").prop('checked');
            if (Dname === '') {
                $("#info_Door").text("提示:账号不能为空");
            } else if (Dpassword === '') {
                $("#info_Door").text("提示:密码不能为空");
            } else {
                $.ajax({
                    type: "POST",
                    url: "/api/loginCheck_Door",
                    data: {
                        Dname: Dname,
                        Dpassword: Dpassword
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data.stateCode.trim() === "0") {
                            $("#info_Door").text("提示:账号或密码错误！");

                        } else if (data.stateCode.trim() === "1") {
                            if (remember) {
                                rememberLogin(Dname, Dpassword, remember);
                            } else {
                                Cookies.remove('loginStatus');
                            }
                            $("#info_Door").text("提示:登陆成功，跳转中...");
                            window.location.href = "index_Door.html";
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
