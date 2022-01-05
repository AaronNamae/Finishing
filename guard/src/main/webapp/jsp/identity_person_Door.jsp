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
                    <li><a href="identity_car_Door.html?state=1"><i class="fa fa-arrow-circle-up"></i> 车辆入场</a></li>
                    <li><a href="identity_car_Door.html?state=0"><i class="fa fa-arrow-circle-down"></i> 车辆出场</a></li>
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
                    <h2>
                        人员 入场
                    </h2>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-6">
                    <div class="templatemo-alerts">
                        <div class="row">
                            <div class="col-md-12 column" id="message">
                                <div class="alert alert-success alert-dismissible" role="alert" id="panel_IN"
                                     style="display: none">
                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                                            class="sr-only">Close</span></button>
                                    <strong>识别成功!</strong> 为小区业主，已自动放行
                                </div>
                                <div class="alert alert-warning alert-dismissible" role="alert" id="panel_EX"
                                     style="display: none">
                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                                            class="sr-only">Close</span></button>
                                    <strong>识别成功!</strong> 为外来人员，请联系安保人员.
                                </div>
                            </div>
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
                                <div>
                                    <button onclick="openMedia()" class="btn btn-primary  btn-block">开始工作</button>
                                    <p>

                                    </p>
                                    <video id="video" width="400px" height="225px" autoplay="autoplay"></video>
                                    <canvas style="display: none;" id="canvas" width="1280px"
                                            height="720px"></canvas>
                                    <%--                                            <button onclick="takePhoto()">拍照</button>--%>
                                    <h4>
                                        人脸图片
                                    </h4>
                                    <img style="width:400px" id="imgTag" src="" alt="imgTag">
                                </div>
                                <%--                                <div id="regcoDiv">--%>
                                <%--                                    <input style='display: none' type='file' name='file1' id='file1'--%>
                                <%--                                           multiple='multiple'/><br>--%>
                                <%--                                    <img src='../static/img/shibie.jpg' onclick='chooseFile()' id='img0'--%>
                                <%--                                         style='width: 30rem;height: 25rem;'>--%>
                                <%--                                    <h2>点击图片区域上传文件👆</h2>--%>
                                <%--                                </div>--%>
                                <%--                    </div>--%>
                                <%--                    <div class="col-md-6 col-sm-6 margin-bottom-30">--%>
                                <div class="list-group" id="infoContainer"></div>
                                <%--                                <div class=" col-sm-offset--2 col-sm-11">--%>
                                <%--                                    <button id="recognitionButton" class="btn btn-default  btn-block">开始识别</button>--%>
                                <%--                                    <p style="text-align: right;color: red;position: absolute" id="info_register"></p>--%>
                                <%--                                    <br/>--%>
                                <%--                                </div>--%>
                                <div class="col-md-12 col-sm-80 ">
                                    <button id="openGateButton" class="btn btn-default  btn-block">一键开门</button>
                                    <p>

                                    </p>
                                </div>
                            </div>
                            <div class="col-md-1 column">

                            </div>
                            <div class="col-md-5 column">
                                <div class="row">
                                    <div class="col-md-35 column">
                                        <div class="jumbotron">
                                            <h1>
                                                欢迎光临
                                            </h1>
                                            <p>
                                                欢迎来到世纪天成小区！
                                            </p>

                                        </div>
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
                        <a href="<c:url value="/login.html"/>" class="btn btn-primary">是</a>
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

        let file = new File([fileData], '7.jpg', { type: mime });

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


        var file = base64ToFile(img);
        var myFormData = new FormData();

        if (file == undefined) {
            alert("请选择上传文件！");
            return false;
        } else
            var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function () {
            var base64 = reader.result;
            myFormData.append('file', base64);
            $.ajax({
                type: "POST",
                url: "/faceSearch",
                data: myFormData,
                contentType: false,
                processData: false,
                dataType: "json",
                success: function (data) {
                    console.log(data);


                    if (data.code == 0) {
                        $("#message").html("");
                        var messageInput15 = "<div class=\"alert alert-success alert-dismissible\" role=\"alert\">\n" +
                            "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                            "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                            "                            <strong>识别成功!</strong> 为小区业主，已自动放行.\n" +
                            "                        </div>";
                        $("#message").html(messageInput15);
                        // $("#panel_EX").hide();
                        // $("#panel_IN").show();
                        // $("#infoContainer").empty();
                        // let infoInput = "<p style=\"text-align:right;color: red;position: absolute\" id=\"info\">识别结果：小区业主</p><br/>";
                        // $("#infoContainer").append(infoInput);
                        /*$("#info").text("识别结果："+text.data.name.trim()+"。相似度："+text.data.similarValue.trim());*/

                    } else if(data.code == 15){
                        $("#message").html("");
                        var messageInput16 = "<div class=\"alert alert-warning alert-dismissible\" role=\"alert\">\n" +
                            "                            <button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span\n" +
                            "                                    aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>\n" +
                            "                            <strong>陌生人！</strong> 请联系门卫.\n" +
                            "                        </div>";
                        $("#message").html(messageInput16);
                        // $("#panel_IN").hide();
                        // $("#panel_EX").show();
                        // $("#infoContainer").empty();
                        // let infoInput = "<p style=\"text-align:right;color: red;position: absolute\" id=\"info\">识别结果：外来人员</p><br/>";
                        // $("#infoContainer").append(infoInput);
                        // /*$("#info").text("识别结果：外来人员");*/
                    } else if(data.code == 14){
                        $("#message").html("");
                    }
                },

                error: function (error) {
                    alert(error)
                }
            })
        }
        setTimeout("openMedia()",1000);
    }

    function chooseFile() {
        $("#file1").trigger('click');
    }

    $(document).on("change", "#file1", function () {
        var objUrl = getObjectURL(this.files[0]);//获取文件信息
        console.log("objUrl = " + objUrl);
        if (objUrl) {
            //显示上传的图片
            $("#img0").attr("src", objUrl);
        }
    });

    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) {
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }


    $(document).ready(function () {

        $("#openGateButton").click(function () {
            window.alert("开门成功");
        });

        $("#recognitionButton").click(function () {
            var file = $("#file1")[0].files[0];
            var myFormData = new FormData();

            if (file == undefined) {
                alert("请选择上传文件！");
                return false;
            } else
                var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function () {
                var base64 = reader.result;
                myFormData.append('file', base64);
                $.ajax({
                    type: "POST",
                    url: "/faceSearch",
                    data: myFormData,
                    contentType: false,
                    processData: false,
                    dataType: "json",
                    success: function (data) {
                        console.log(data);

                        if (data.code == 0) {
                            $("#panel_EX").hide();
                            $("#panel_IN").show();
                            $("#infoContainer").empty();
                            let infoInput = "<p style=\"text-align:right;color: red;position: absolute\" id=\"info\">识别结果：小区业主</p><br/>";
                            $("#infoContainer").append(infoInput);
                            /*$("#info").text("识别结果："+text.data.name.trim()+"。相似度："+text.data.similarValue.trim());*/

                        } else {
                            $("#panel_IN").hide();
                            $("#panel_EX").show();
                            $("#infoContainer").empty();
                            let infoInput = "<p style=\"text-align:right;color: red;position: absolute\" id=\"info\">识别结果：外来人员</p><br/>";
                            $("#infoContainer").append(infoInput);
                            /*$("#info").text("识别结果：外来人员");*/
                        }
                    },

                    error: function (error) {
                        alert(error)
                    }
                })
            }
        })

    })
</script>
</body>
</html>
