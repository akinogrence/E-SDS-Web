<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/Koziuk-S/pen/jbJydJ?limit=all&page=85&q=form" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>

        <style class="cp-pen-styles">* {
                box-sizing: border-box;
                font-family: 'Open Sans', sans-serif;
            }
            body {
                background: #dde3e8;
            }
            .wrapper, 
            .container {
                height: 525px;
                width: 337px;
            }
            .wrapper {
                margin: auto;
                position: absolute;
                top: -10px; right: 0; bottom: 0; left: 0;
            }
            .container {
                position: relative;
            }
            .container .stencil {
                border: 5px solid #77dff9;
                height: 440px;
                width: 235px;
                transform: matrix(0.85,0.8,-0.08,0.7,19,43);   
                position: absolute;
                z-index: 1;
            }
            .container .stencil .line {
                border: 3px solid #77dff9 ;
                height: 94.6%;
                margin: 11px 0;
                border-right: none;
                border-left: none;
            }
            .container .border-triangle  {
                position: absolute;
                z-index: 10;
                border-top: 257px solid transparent;
                border-left: 337px solid rgba(255,255,255,0.5);
                border-bottom: 268px solid transparent;  
            }
            .container .content-triangle {
                position: absolute;
                left: 12px;
                top: 22px;
                border-top: 235px solid transparent;
                border-left: 307px solid #fff;
                border-bottom: 245px solid transparent;
                z-index: 15;
            }
            .container .content-triangle:before,
            .container .content-triangle:after,
            .container form .title:after {
                content: '';
                position: absolute;
                width: 10px;
                height: 15px;
                border: 1px solid #71d2ec;

            }
            .container .content-triangle:before {
                border-bottom: none;
                border-right: none;
                transform: matrix(0.85,0.64,-0,0.7,-295,-203);
            }
            .container .content-triangle:after {
                border-top: none;
                border-right: none;
                transform: matrix(0.85,-0.7,-0,0.7,-295,197);
            }
            .container .enter-triangle-one {
                position: absolute;
                border-top: 90px solid transparent;
                border-left: 135px solid #192042;
                border-bottom: 76px solid transparent;
                transform: rotate(51.5deg);
                bottom: 5px;
                left: 153px;
                z-index: 5;
            }
            .container .enter-triangle-one:before {
                content: '';
                position: absolute;
                border-top: 120px solid transparent;
                border-left: 188px solid #192042;
                border-bottom: 141px solid transparent;
                transform: rotate(4deg);
                bottom: -129px;
                left: -207px;
                -webkit-filter: blur(20px);
                filter: blur(20px);
                z-index: 5;
            }
            .container .enter-triangle-two {
                position: absolute;
                border-top: 111px solid transparent;
                border-left: 108px solid rgba(40, 65, 143, 0.2);
                border-bottom: 47px solid transparent;
                transform: rotate(51deg);
                bottom: 13px;
                left: 148px;
                z-index: 6;
            }
            .container form {
                position: absolute;
                z-index: 20;
                top: 166px;
                left: 30px;
            }
            .container form:before,
            .container form:after,
            .container form .input-inform:before,
            .container form .title:before {
                content: '';
                position: absolute;
                background: rgba(204,204,204,0.13);
                height: 1px;
            }
            .container form:before {
                width: 315px;
                transform: rotate(37.2deg);
                left: -28px;
                top: -11px;
            }
            .container form:after {
                width: 320px;
                left: -31px;
                bottom: 35px;
                transform: rotate(-39deg);
            }
            .container form .title {
                border-bottom: 1px solid #67e2fb;
                padding-bottom: 9px;
                margin: 0 0 30px 9px;
                width: 95px;
            }
            .container form .title:before {
                width: 26px;
                background: #67e2fb;
                top: 58px;
            }
            .container form .title:after {
                border-top: none;
                border-left: none;
                width: 8px;
                height: 9px;
                transform: matrix(0.85,-0.7,0.8,0.6,241,37);
            }
            .container form label {
                display: block;
                color: #6b707d;
                font-size: 20px;
                font-weight: 300;
                line-height: 24px;
            }
            .container form .input-inform:before {
                width: 1px;
                height: 396px;
                left: -5px;
                top: -102px;
            }
            .container form input:focus {
                outline: none;
            }
            .container form label:last-child {
                font-weight: bold;
                letter-spacing: 1px;
            }
            .container form input[type="text"],
            .container form input[type="password"] {
                border: none;
                border-bottom: 1px solid #f2f2f2;
                display: block;
                width: 160px;
                color: #71d2ec;
            }
            .container form input[type="text"] {
                padding: 0 0 7px 9px;
            }
            .container form input[type="password"] {
                padding: 17px 0 9px 9px;
            }
            .container form #forgot-pas,
            .container form .enter,
            .container form .enter label,
            .container form #enter {
                cursor: pointer;
                position: relative;
            }
            .container form #forgot-pas {
                color: #c5c5c5;
                background: #fff;
                border: 1px solid #f2f2f2;
                font-size: 7px;
                height: 17px;
                width: 96px;
                top: 6px;
                left: 25px;
            }
            .container form .enter {
                width: 50px;
                height: 50px;
                top: 50px;
                left: 148px;
            }
            .container form .enter label:before {
                content: '\1F512';
                color: rgba(197, 197, 197,0.6);
                left: 10px;
                top: 7px;
                position: relative;
            }
            .container form .enter label:hover:before {
                content: '\1F513';
            }
            .container form #enter {
                color: #fff;
                border: none;
                font-size: 10px;
                background: transparent;
            }</style></head>
    
    <body>
        <!-- https://dribbble.com/shots/2358349-Daily-Shmaily-UI-1-Game-Login -->
    <div class="wrapper">
        <div class="container">
            <div class="stencil">
                <div class="line">
                    <div class="line"></div>
                </div>
            </div>
            <div class="border-triangle"></div>
            <div class="content-triangle"></div>
            <div class="enter-triangle-one"></div>
            <div class="enter-triangle-two"></div>
            <form action="<s:url value="/doLogin"></s:url>" method="post" id="form">
                <div class="title">
                    <label>GİRİŞ YAPIN</label>
                </div>
                <div class="input-inform">
                    <input type="text" name="userName" id="name" placeholder="Kullanıcı Adı..." />
                    <input type="password" name="password" id="password" placeholder="Parola..." />
                    <input type="button" value="FORGOT PASSWORD?" id="forgot-pas"/>
                </div>
                <div class="enter">
                    <label for="enter"></label>
                    <input type="submit" name="submit" value="Giriş Yap" id="enter"/>
                </div>
            </form>    
        </div>
    </div>
    <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
    <script >document.getElementById('enter').onclick = function () {
            valid(document.getElementById('form'));
        }

        function valid(form) {
            var fail = false,
                    name = form.name.value.trim(),
                    password = form.password.value.trim();
            console.log();

            if (!name)
                fail = 'Kullanıcı adı boş bıraklılamaz';
            else if (!password)
                fail = 'Parola boş bırakılamaz';
            if (fail)
                alert(fail);
        }
        //# sourceURL=pen.js
    </script>
    <script src="//production-assets.codepen.io/assets/editor/live/check-c263eb37bf3a3d49b8311c096168b478f5750c61a1166ea2cc660498870d671f.js"></script>
</body>
</html>