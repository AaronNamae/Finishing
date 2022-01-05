
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
<body background="../static/img/background_login.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="main-wrapper">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <div class="logo"><h1>小区门禁管理系统——业主信息登记</h1></div>
        </div>
    </div>
    <div class="template-page-wrapper">
        <div class="row clearfix">
            <div class="col-md-1 column">
            </div>
            <div class="col-md-3 column">
                <p>

                </p>
                <h3>
                    图像采集
                </h3>
                <p>

                </p>
                <p>

                </p>
                <p>

                </p>
                <br/>
                <br/>
                <button onclick="openMedia()" class="btn btn-primary  btn-lg">打开相机</button>
                <p>

                </p>
                <video id="video" width="320px" height="180px" autoplay="autoplay"></video>
                <canvas style="display: none;" id="canvas" width="1280px"
                        height="720px"></canvas>
                <button onclick="takePhoto()" class="btn btn-primary  btn-lg">拍照</button>
                <img style="width:320px" id="imgTag" src="" alt="imgTag"><br/>
                <p>

                </p>
                <button onclick="closeMedia()" class="btn btn-primary  btn-lg">关闭相机</button>
            </div>
            <div class="col-md-6 column">
                <h3>
                    信息录入
                </h3>
                <form class="form-horizontal templatemo-signin-form" role="form" id="addForm" action="/user_faceAdd.html"
                      enctype="multipart/form-data" method="post">
                    <div class="form-group" style="background-color: #fff">
                        <div class="col-md-12">
                            <label for="name" class="col-sm-2 control-label">业主名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="background-color: #fff">
                        <div class="col-md-12">
                            <label for="name" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="sex" name="sex">
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="background-color: #fff">
                        <div class="col-md-12">
                            <label for="photo">业主人脸图像</label>

                            <input type="file" multiple="multiple" id="photo" name="photo">
                            <p class="help-block">👆上传图像</p>
                        </div>
                    </div>
                    <div class="form-group" style="background-color: #fff">
                        <div class="col-md-12">
                            <label for="location" class="col-sm-2 control-label">门栋号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="location" name="location">
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="background-color: #fff">
                        <div class="col-md-12">
                            <label for="per_id" class="col-sm-2 control-label">身份证号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="per_id" name="per_id">
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="background-color: #fff">
                        <div class="col-md-12">
                            <label for="phone" class="col-sm-2 control-label">手机号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="phone" name="phone">
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="background-color: #fff">
                        <div class="col-md-12">
                            <label for="status">车辆类型</label>
                            <select class="form-control margin-bottom-15" id="status" name="status">
                                <option value="1">有固位的车</option>
                                <option value="2">无固位的车</option>
                                <option value="0">没有车</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" style="background-color: #fff">
                        <div class="col-md-12">
                            <label for="tax_year">车位租期</label>
                            <select class="form-control margin-bottom-15" id="tax_year" name="tax_year">
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
                                <input type="text" class="form-control" id="car_id" name="car_id" placeholder="没有请填写无">
                            </div>
                        </div>
                    </div>
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary  btn-block" id="addUserBTN">登记</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </form>
            </div>
            <div class="col-md-2 column">
            </div>
        </div>

    <script src="../static/js/jquery.min.js"></script>
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

            let file = new File([fileData], '3.jpg', { type: mime });

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
        }

        function takePhoto() {
            //获得Canvas对象
            let video = document.getElementById('video');
            let canvas = document.getElementById('canvas');
            let ctx = canvas.getContext('2d');
            ctx.drawImage(video, 10, 10, 1280, 720);


            // toDataURL  ---  可传入'image/png'---默认, 'image/jpeg'
            let img = document.getElementById('canvas').toDataURL();
            // 这里的img就是得到的图片
            document.getElementById('imgTag').src = img;
            var fileInput = base64ToFile(img);
            var myFormData = new FormData();

            if (!fileInput) {
                alert("请选择上传文件！");
            } else {
                myFormData.append('photo', fileInput);

                $.ajax({
                    type: "POST",
                    url: "/api/photo_ADD",
                    data: myFormData,

                    contentType: false,  // 不用任何编码 因为formdata对象自带编码
                    processData: false,  // 告诉浏览器不要处理我的数据 直接发就行
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                    }
                })

                //return fileInput;
            }
        }

        function closeMedia() {
            let stream = document.getElementById('video').srcObject;
            let tracks = stream.getTracks();

            tracks.forEach(function(track) {
                track.stop();
            });

            document.getElementById('video').srcObject = null;
        }




        //上传业主信息（包括图片)
        $("#addForm").submit(function () {
            var name = $("#name").val();
           // var photo = takePhoto();
            var sex  = $("#sex").val();
            var phone = $("#phone").val();
            var per_id = $("#per_id").val();
            var loc = $("#location").val();
            var status = $("#status").val();
            var tax_year = $("#tax_year").val();
            var car_id = $("#car_id").val();

           // console.log(photo)

            if (name === '' ||sex === '' || phone === '' || per_id === '' || loc === '') {
                alert("必填项不能为空");
                return false;
            } else if(phone.length != 11){
                alert("手机号位数错误");
                return false;
            } else if(per_id.length != 18){
                alert("身份证号位数错误");
                return false;
            } else if(status == '0'){
                if(tax_year != 0){
                    alert("没有租赁车位 请勿选择租期");
                    return false;
                }else if(car_id == '无'){
                    alert("没有租赁车位 请勿填写车牌");
                    return false;
                }
            } else if(status != '0'){
                if(tax_year == 0){
                    alert("请选择租期");
                    return false;
                }else if(car_id === ''||car_id === '无'){
                    alert("请填写车牌号");
                    return false;
                }
            }
        })

    </script>

</div>
</body>
</html>