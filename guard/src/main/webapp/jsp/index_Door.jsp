
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
<div class="navbar navbar-inverse" role="navigation">
    <div class="navbar-header">
        <div class="panel-title"><h1>小区门禁管理系统</h1></div>
        <div class="right"><h1>欢迎你，门卫</h1></div>
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
            <li class="active"><a href="index_Door.html"><i class="fa fa-home"></i>主页</a></li>
            <li class="sub open">
                <a href="javascript:">
                    <i class="fa fa-database"></i> 车辆识别
                    <div class="pull-right"><span class="caret"></span></div>
                </a>
                <ul class="templatemo-submenu">
                    <li><a href="identity_car_Door.html?state=1"><i class="fa fa-arrow-circle-up"></i> 车辆入场</a></li>
                    <li><a href="identity_car_Door.html?state=0"><i class="fa fa-arrow-circle-down"></i> 车辆出场</a></li>
                </ul>
            </li>
            <li><a href="identity_person_Door.html"><i class="fa fa-cubes"></i>人员识别</a></li>
            <li><a href="javascript:" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>退出登录</a>
            </li>
        </ul>
    </div><!--/.navbar-collapse -->

    <!--主要页面-->
    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
            <h1>欢迎来到世纪天成小区</h1>
            <div class="row margin-bottom-30">
                <div class="col-md-12">
                    <ul class="nav nav-pills">
                        <li>车位剩余量<span class="badge">${emptyC1}</span></li>
                    </ul>
                </div>
            </div>
            <div class="templatemo-panels">
                <div class="row">
                    <img src="../static/img/road.jpg" height="600" alt="background"/>
                </div>
            </div>
        </div>
    </div>

    <!-- 确认是否登出 -->
    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">确认退出登录吗？</h4>
                </div>
                <div class="modal-footer">
                    <a href="login.html" class="btn btn-primary">是</a>
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

<script src="../static/js/jquery.min.js"></script>
<script src="../static/js/bootstrap.min.js"></script>
<script src="../static/js/Chart.min.js"></script>
<script src="../static/js/templatemo_script.js"></script>
<script type="text/javascript">
    // Line chart
    var randomScalingFactor = function () {
        return Math.round(Math.random() * 100)
    };
    var lineChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
            },
            {
                label: "My Second dataset",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
            }
        ]

    };

    window.onload = function () {

    };
</script>
</body>
</html>
