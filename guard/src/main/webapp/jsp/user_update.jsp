
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
    <title>小区门禁管理系统</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="../static/css/templatemo_main.css">
</head>
<body background="../static/img/background_login.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="logo"><h1>小区门禁管理系统——业主信息修改</h1></div>
        </div>
    </div>
    <div class="template-page-wrapper">
        <form class="form-horizontal templatemo-signin-form" role="form" action="user_update_do.html" method="post">
            <div class="form-group" style="background-color: #fff">
                <div class="col-md-12">
                    <label for="name" class="col-sm-2 control-label">业主名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name" value="${user.name}">
                    </div>
                </div>
            </div>
            <div class="form-group" style="background-color: #fff">
                <div class="col-md-12">
                    <label for="name" class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="sex" name="sex" value="${user.sex}">
                    </div>
                </div>
            </div>

            <div class="form-group" style="background-color: #fff">
                <div class="col-md-12">
                    <label for="location" class="col-sm-2 control-label">门栋号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="location" name="location" value="${user.location}">
                    </div>
                </div>
            </div>
            <div class="form-group" style="background-color: #fff">
                <div class="col-md-12">
                    <label for="per_id" class="col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-10">
                        <input type="text" readonly="readonly" class="form-control" id="per_id" name="per_id"
                               value="${user.per_id}">
                    </div>
                </div>
            </div>
            <div class="form-group" style="background-color: #fff">
                <div class="col-md-12">
                    <label for="phone" class="col-sm-2 control-label">手机号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
                    </div>
                </div>
            </div>
            <div class="form-group" style="background-color: #fff">
                <div class="col-md-12">
                    <label for="status">车辆类型</label>
                    <select class="form-control margin-bottom-15" id="status" name="status" value="${user.status}">
                        <option value="1">有空位的车</option>
                        <option value="2">无空为的车</option>
                        <option value="0">没有车</option>
                    </select>
                </div>
            </div>
            <div class="form-group" style="background-color: #fff">
                <div class="col-md-12">
                    <label for="tax_year">车位租期延长</label>
                    <select class="form-control margin-bottom-15" id="tax_year" name="tax_year" value="${user.tax_year}">
                        <option value="0">无</option>
                        <option value="1">3个月</option>
                        <option value="2">6个月</option>
                        <option value="3">9个月</option>
                        <option value="4">12个月</option>
                    </select>
                </div>
            </div>
            <div class="form-group" style="background-color: #fff">
                <div class="col-md-12">
                    <label for="car_id" class="col-sm-2 control-label">车牌号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="car_id" name="car_id" value="${user.car_id}">
                        <input type="hidden" id="old_car" name="old_car" value="${user.car_id}">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="完成" class="btn btn-primary  btn-block">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
