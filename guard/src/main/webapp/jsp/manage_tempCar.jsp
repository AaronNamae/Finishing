<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wingstudioly.guard.bean.Car" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="panel-title"><h1>小区门禁管理系统</h1></div>
            <div class="right"><h1>欢迎你，管理员</h1></div>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
    </div>

    <div class="template-page-wrapper">
        <div class="navbar-collapse collapse templatemo-sidebar">
            <ul class="templatemo-sidebar-menu">
                <li class="active"><a href="index.html"><i class="fa fa-home"></i>主页</a></li>
                <li class="sub open">
                    <a href="javascript:">
                        <i class="fa fa-database"></i> 车辆识别
                        <div class="pull-right"><span class="caret"></span></div>
                    </a>
                    <ul class="templatemo-submenu">
                        <li><a href="identity_car.html?state=1"><i class="fa fa-arrow-circle-up"></i> 车辆入场</a></li>
                        <li><a href="identity_car.html?state=0"><i class="fa fa-arrow-circle-down"></i> 车辆出场</a></li>
                    </ul>
                </li>
                <li><a href="identity_person.html"><i class="fa fa-cubes"></i>人员识别</a></li>
                <li><a href="manage_car.html"><i class="fa fa-map-marker"></i>车辆管理</a></li>
                <li class="sub open">
                    <a href="javascript:">
                        <i class="fa fa-database"></i> 用户管理
                        <div class="pull-right"><span class="caret"></span></div>
                    </a>
                    <ul class="templatemo-submenu">
                        <li><a href="manage_user.html"><i class="fa fa-file"></i> 业主信息</a></li>
                        <li><a href="manage_Car_set.html"><i class="fa fa-file"></i> 车位信息</a></li>
                    </ul>
                </li>
                <li><a href="manage_save.html"><i class="fa fa-wrench"></i>安全管理</a></li>
                <li><a href="javascript:" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>退出登录</a>
                </li>
            </ul>
        </div><!--/.navbar-collapse -->

        <div class="templatemo-content-wrapper">
            <div class="templatemo-content">
                <h1>车辆管理</h1>

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel-body">
                            <img src="../static/img/food.jpg" alt="food"/>
                        </div>

                        <div class="table-responsive">
                            <h4 class="margin-bottom-15">临时车辆登记表</h4>
                            <table class="table table-striped table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>车牌号</th>
                                    <th>进场时间</th>
                                    <th>出场时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% ArrayList<Car> cars = (ArrayList<Car>) request.getSession().getAttribute("cars");
                                    String words = "无";
                                    for (Car car :
                                            cars) {
                                %>
                                <tr>
                                    <th><%=car.getCar_id()%>
                                    </th>
                                    <th><%=car.getIn_time()%>
                                    </th>
                                    <th><%=car.getOut_time()%>
                                    </th>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">确定要退出登陆吗?</h4>
                    </div>
                    <div class="modal-footer">
                        <a href="/login.html" class="btn btn-primary">是</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">否</button>
                    </div>
                </div>
            </div>
        </div>

        <footer class="templatemo-footer">
            <div class="templatemo-copyright">
                <p>Welcome to 世纪天成 community</p>
            </div>
        </footer>
    </div>
</div>
<script src="../static/js/jquery.min.js"></script>
<script src="../static/js/bootstrap.min.js"></script>
<script src="../static/js/templatemo_script.js"></script>
</body>
</html>