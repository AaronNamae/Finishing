<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
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

<!--主要页面-->
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
                    <li><a href="identity_car_Door.html?state1=1"><i class="fa fa-arrow-circle-up"></i> 车辆入场</a></li>
                    <li><a href="identity_car_Door.html?state1=0"><i class="fa fa-arrow-circle-down"></i> 车辆出场</a></li>
                </ul>
            </li>
            <li><a href="identity_person_Door.html"><i class="fa fa-cubes"></i>人员识别</a></li>
            <li><a href="javascript:" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>退出登录</a>
            </li>
        </ul>
    </div><!--/.navbar-collapse -->

    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <h2>车辆<c:choose>
                        <c:when test="${state1 == '0'}">
                            出场
                        </c:when>
                        <c:when test="${state1 == '1'}">
                            入场
                        </c:when>
                        <c:otherwise>
                            识别
                        </c:otherwise>
                    </c:choose></h2>
                </div>
            </div>


            <div class="row clearfix">
                <div class="templatemo-alerts">
                    <div class="col-md-12 column" id="message">
                        <div class="alert alert-success alert-dismissible" role="alert" id="panelIN"
                             style="display: none">
                            <button type="button" class="close" data-dismiss="alert"><span
                                    aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <strong>识别成功!</strong> 为小区业主车，已自动放行.
                        </div>
                        <div class="alert alert-warning alert-dismissible" role="alert" id="panelEX"
                             style="display: none">
                            <button type="button" class="close" data-dismiss="alert"><span
                                    aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <strong>识别成功!</strong>
                            <p id="info_EX"></p>
                        </div>
                        <div class="alert alert-danger alert-dismissible" role="alert" id="panelWarning"
                             style="display: none">
                            <button type="button" class="close" data-dismiss="alert"><span
                                    aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <strong>查无此车!</strong>
                        </div>
                    </div>
                </div>
            </div>

            <!--下半部分的内容-->
            <div class="templatemo-panels">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <div class="row">
                            <div class="col-md-5 col-sm-6 margin-bottom-40">
                                <div><c:choose>
                                    <c:when test="${state1 == '0'}">
                                        <div class="col-md-35 column">
                                                <%--                                    <div class="jumbotron">--%>
                                                <%--                                        <h1>--%>
                                                <%--                                            一路顺风！--%>
                                                <%--                                        </h1>--%>
                                                <%--                                        <p>--%>
                                                <%--                                            送你一杯美酒，祝你前程路上福长有；送你一杯清茶，祝你前程路上乐无涯。--%>
                                                <%--                                        </p>--%>

                                                <%--                                    </div>--%>
                                            <button onclick="openMedia()" class="btn btn-primary  btn-block">开始工作</button>
                                            <p>

                                            </p>
                                            <video id="video" width="400px" height="225px" autoplay="autoplay"></video>
                                            <canvas style="display: none;" id="canvas" width="1280px"
                                                    height="720px"></canvas>
                                                <%--                                            <button onclick="takePhoto()">拍照</button>--%>
                                            <h4>
                                                车辆图片
                                            </h4>
                                            <img style="width:400px" id="imgTag" src="" alt="imgTag">
                                                <%--                                    <button onclick="closeMedia()">关闭摄像头</button>--%>
                                        </div>
                                    </c:when>
                                    <c:when test="${state1 == '1'}">
                                        <%--                                        <div class="col-md-40 column">--%>
                                        <%--                                            <div class="jumbotron">--%>
                                        <%--                                                <h1>--%>
                                        <%--                                                    欢迎回家！--%>
                                        <%--                                                </h1>--%>
                                        <%--                                                <p>--%>
                                        <%--                                                    无论何时何地家永远是向游子敞开大门的地方。——罗伯特--%>
                                        <%--                                                </p>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
<%--                                        <button onclick="openMedia()" class="btn btn-primary  btn-block">开始工作</button>--%>
<%--                                        <p>--%>

<%--                                        </p>--%>
<%--                                        <video id="video" width="400px" height="225px" autoplay="autoplay"></video>--%>
<%--                                        <canvas style="display: none;" id="canvas" width="1280px"--%>
<%--                                                height="720px"></canvas>--%>
<%--                                        &lt;%&ndash;                                            <button onclick="takePhoto()">拍照</button>&ndash;%&gt;--%>
<%--                                        <h4>--%>
<%--                                            车辆图片--%>
<%--                                        </h4>--%>
<%--                                        <img style="width:400px" id="imgTag" src="" alt="imgTag">--%>

                                        <button onclick="openMedia()" class="btn btn-primary  btn-block">开始工作</button>
                                        <p>

                                        </p>
                                        <video id="video" width="400px" height="225px" autoplay="autoplay"></video>
                                        <canvas style="display: none;" id="canvas" width="1280px"
                                                height="720px"></canvas>
                                        <%--                                            <button onclick="takePhoto()">拍照</button>--%>
                                        <h4>
                                            车辆图片
                                        </h4>
                                        <img style="width:400px" id="imgTag" src="" alt="imgTag">

                                    </c:when>
                                    <c:otherwise>
                                        <%--                                        <div class="col-md-40 column">--%>
                                        <%--                                            <div class="jumbotron">--%>
                                        <%--                                                <h1>--%>
                                        <%--                                                    天天开心！--%>
                                        <%--                                                </h1>--%>
                                        <%--                                                <p>--%>
                                        <%--                                                    This is a template for a simple marketing or informational website.--%>
                                        <%--                                                </p>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <button onclick="openMedia()" class="btn btn-primary  btn-block">开始工作</button>
                                        <p>

                                        </p>
                                        <video id="video" width="400px" height="225px" autoplay="autoplay"></video>
                                        <canvas style="display: none;" id="canvas" width="1280px"
                                                height="720px"></canvas>
                                        <%--                                            <button onclick="takePhoto()">拍照</button>--%>
                                        <h4>
                                            车辆图片
                                        </h4>
                                        <img style="width:400px" id="imgTag" src="" alt="imgTag">
                                    </c:otherwise>
                                </c:choose>
                                </div>

                                <%--                                <div class="col-md-20">--%>
                                <%--                                    <label for="tmp_carPhoto">--%>
                                <%--                                        <h2>车辆图片--%>
                                <%--                                        </h2>--%>
                                <%--                                    </label>--%>
                                <%--                                    <input type="file" id="tmp_carPhoto" name="tmp_carPhoto" multiple="multiple">--%>
                                <%--                                    <p class="help-block">👆上传图片</p>--%>
                                <%--                                </div>--%>

                                <div class="col-md-12">
                                    <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
                                </div>
                                <%--                                <div class="row clearfix">--%>
                                <%--                                    <div class="col-md-4 column">--%>
                                <%--                                        <div class="col-sm-offset--1 col-sm-14">--%>
                                <%--                                            <button type="button" id="recognitionButton"--%>
                                <%--                                                    class="btn btn-default btn-inverse btn-block">开始识别--%>
                                <%--                                            </button>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <div class="row clearfix">
                                    <div class="col-md-12 column">
                                        <div class="col-sm-offset--1 col-sm-20">
                                            <button type="button" id="openGateButton" class="btn btn-default btn-block">
                                                一键开门
                                            </button>
                                            <p>

                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 col-sm-6 margin-bottom-80">
                            </div>

                            <div class="col-md-5 col-sm-6 margin-bottom-80">
                                <div><c:choose>

                                    <c:when test="${state1 == '0'}">
                                        <div class="col-md-35 column">
                                            <div class="jumbotron">
                                                <h1>
                                                    一路顺风！
                                                </h1>
                                                <p>
                                                    送你一杯美酒，祝你前程路上福长有；送你一杯清茶，祝你前程路上乐无涯。
                                                </p>

                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${state1 == '1'}">
                                        <div class="col-md-40 column">
                                            <div class="jumbotron">
                                                <h1>
                                                    欢迎回家！
                                                </h1>
                                                <p>
                                                    无论何时何地家永远是向游子敞开大门的地方。——罗伯特
                                                </p>
                                            </div>
                                        </div>
                                    </c:when>
                                </c:choose>
                                </div>
                            </div>
                        </div>
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
<script src="../static/js/templatemo_script.js"></script>
<script>
    let mediaStreamTrack=null; // 视频对象(全局)
    let video ;
    function base64ToFile(data) {

        // 将base64 的图片转换成file对象上传 atob将ascii码解析成binary数据
        let binary = atob(data.split(',')[1]);
        let mime = data.split(',')[0].match(/:(.*?);/)[1];
        let array = [];
        for (let i = 0; i < binary.length; i++) {
            array.push(binary.charCodeAt(i));
        }
        let fileData = new Blob([new Uint8Array(array)], {
            type: mime,
        });

        let file = new File([fileData], '5.jpg', { type: mime });

        return file;

    }
    function openMedia() {
        let constraints = {
            video: { width: 1280, height: 720 },
            audio: false
        };
        //获得video摄像头
        video = document.getElementById('video');
        let promise = navigator.mediaDevices.getUserMedia(constraints);
        promise.then((mediaStream) => {
            // mediaStreamTrack = typeof mediaStream.stop === 'function' ? mediaStream : mediaStream.getTracks()[1];
            mediaStreamTrack=mediaStream.getVideoTracks()
            video.srcObject = mediaStream;
            video.play();
        });
        let canvas = document.getElementById('canvas');
        let ctx = canvas.getContext('2d');
        ctx.drawImage(video, 10, 10, 1280, 720);
        // toDataURL  ---  可传入'image/png'---默认, 'image/jpeg'
        let img = document.getElementById('canvas').toDataURL();
        // 这里的img就是得到的图片
        document.getElementById('imgTag').src = img;


        var fileInput = base64ToFile(img);
        var myFormData = new FormData();

        var classpath = "getTmpCarPhoto?fileName=";

        if (!fileInput) {
            alert("请选择上传文件！");
        } else {
            myFormData.append('tmp_car', fileInput);
            myFormData.append('state', ${state1});

            $.ajax({
                type: "POST",
                url: "/api/recognition_tmpCar",
                data: myFormData,

                contentType: false,  // 不用任何编码 因为formdata对象自带编码
                processData: false,  // 告诉浏览器不要处理我的数据 直接发就行
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $("#info").text("识别结果：" + data.car_id + " " + data.car_color + " 牌");
                    //进场
                    if (data.stateCode == 1) {
                        console.log("进场");
                        //1代表是业主车
                        if (data.car_isIN == 1) {
                            var messageInput17 = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\">\n" +
                                "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                "                            <strong>识别成功!</strong> 为小区固定车位业主车，已自动放行.\n" +
                                "                        </div>";
                            $("#message").html(messageInput17);
                        } else if (data.car_isIN == 2) {
                            var messageInput18 = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\">\n" +
                                "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                "                            <strong>识别成功!</strong> 为小区非固定车位业主车，已自动放行.\n" +
                                "                        </div>";
                            $("#message").html(messageInput18);
                        } else if (data.car_isIN == 0){
                            var messageInput19 = "<div class=\"alert alert-warning alert-dismissible\" role=\"alert\">\n" +
                                "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                "                            <strong>识别成功!</strong>\n" +
                                "                            <p id=\"info_EX\">为外来临时车,已自动放行.</p>\n" +
                                "                        </div>";
                            $("#message").html(messageInput19);
                        } else if (data.car_isIN == -4){
                            var messageInput20 = "<div class=\"alert alert-danger alert-dismissible\" role=\"alert\">\n" +
                                "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                "                            <strong>请勿重复进入!</strong>\n" +
                                "                        </div>";
                            $("#message").html(messageInput20);
                        } else if (data.car_isIN == -3){
                            $("#message").html("");
                        }
                    }
                    //出场
                    if (data.stateCode == 0) {
                        console.log("出场");
                        if (data.car_isIN == -1) {
                            var messageInput21 = "<div class=\"alert alert-danger alert-dismissible\" role=\"alert\">\n" +
                                "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                "                            <strong>查无此车!</strong>\n" +
                                "                        </div>";
                            $("#message").html(messageInput21);
                            //$("#message").delete(messageInput3);
                            //alert("查无此车！");
                        }

                        //1代表是业主车
                        if (data.car_isIN == 1) {
                            var messageInput22 = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\" >\n" +
                                "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                "                            <strong>识别成功!</strong> \n" +
                                "                            <p id=\"info_EX\">为小区固定车位业主车，已自动放行.</p>\n" +
                                "                        </div>";
                            $("#message").html(messageInput22)

                        }
                        //2代表非固定车位临时车
                        if (data.car_isIN == 2) {
                            var messageInput23 = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\" >\n" +
                                "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                "                            <strong>识别成功!</strong> \n" +
                                "                            <p id=\"info_EX\">为小区非固定车位业主车，已自动放行.</p>\n" +
                                "                        </div>";
                            $("#message").html(messageInput23);

                        }
                        //0代表是临时车
                        if (data.car_isIN == 0) {
                            var money = data.car_money;
                            var messageInput24 = "<div class=\"alert alert-warning alert-dismissible\" role=\"alert\" >\n" +
                                "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                "                            <strong>识别成功!</strong>\n" +
                                "                            <p id=\"info_EX\">为外来临时车，将收取" + money + "元停车费.</p>\n" +
                                "                        </div>";
                            $("#message").html(messageInput24);

                        }
                        if (data.car_isIN == -2) {

                            $("#message").html("");

                        }
                    }
                }
            })

        }


        setTimeout("openMedia()",1000);

    }

    $(document).ready(function () {

        $("#openGateButton").click(function () {
            window.alert("开门成功");
        });

        $("#recognitionButton").click(function () {
            var fileInput = $("#tmp_carPhoto").get(0).files[0];
            var myFormData = new FormData();

            var classpath = "getTmpCarPhoto?fileName=";

            if (!fileInput) {
                alert("请选择上传文件！");
            } else {
                myFormData.append('tmp_car', fileInput);
                myFormData.append('state1', ${state});
                $.ajax({
                    type: "POST",
                    url: "/api/recognition_tmpCar",
                    data: myFormData,

                    contentType: false,  // 不用任何编码 因为formdata对象自带编码
                    processData: false,  // 告诉浏览器不要处理我的数据 直接发就行
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        $("#info").text("识别结果：" + data.car_id + " " + data.car_color + " 牌");
                        //进场
                        if (data.stateCode == 1) {
                            console.log("进场");
                            //1代表是业主车
                            if (data.car_isIN == 1) {
                                var messageInput1 = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\">\n" +
                                    "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                    "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                    "                            <strong>识别成功!</strong> 为小区业主车，已自动放行.\n" +
                                    "                        </div>";
                                $("#message").append(messageInput1);
                            } else {
                                var messageInput2 = "<div class=\"alert alert-warning alert-dismissible\" role=\"alert\">\n" +
                                    "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                    "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                    "                            <strong>识别成功!</strong>\n" +
                                    "                            <p id=\"info_EX\">为外来临时车,请联系保安为其放行.</p>\n" +
                                    "                        </div>";
                                $("#message").append(messageInput2);
                            }
                        }
                        //出场
                        if (data.stateCode == 0) {
                            console.log("出场");
                            if (data.car_isIN == -1) {
                                var messageInput3 = "<div class=\"alert alert-danger alert-dismissible\" role=\"alert\">\n" +
                                    "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                    "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                    "                            <strong>查无此车!</strong>\n" +
                                    "                        </div>";
                                $("#message").append(messageInput3);
                            }

                            //1代表是业主车
                            if (data.car_isIN == 1) {
                                var messageInput4 = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\" >\n" +
                                    "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                    "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                    "                            <strong>识别成功!</strong> \n" +
                                    "                            <p id=\"info_EX\">为小区业主车，已自动放行.</p>\n" +
                                    "                        </div>";
                                $("#message").append(messageInput4)

                            }
                            //0代表是临时车
                            if (data.car_isIN == 0) {
                                var money = data.car_money;
                                var messageInput5 = "<div class=\"alert alert-warning alert-dismissible\" role=\"alert\" >\n" +
                                    "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                                    "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                                    "                            <strong>识别成功!</strong>\n" +
                                    "                            <p id=\"info_EX\">为外来临时车，将收取" + money + "元停车费.</p>\n" +
                                    "                        </div>";
                                $("#message").append(messageInput5);

                            }
                        }
                    }
                })

            }

        })

    })

</script>

</body>
</html>
