<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>湖</title>

    <style>
        .div1 {
            position:absolute;
            top:0; left:0; bottom:0; right:0;
            height:20%; /*임의로 준 크기.*/
            margin:20% auto;
            background: black;
        }

        .h3_lake {
            text-align: center;
            /*margin-top: 20%;*/
            /*vertical-align: middle;*/
            color: white;
        }

        .hr1 { /* 디폴트 값 */
            display: block;
            margin-top: 0.5em;
            margin-bottom: 0.5em;
            margin-left: auto;
            margin-right: auto;
            border-style: inset;
            border-width: 1px;
        }

        .div2 {
            text-align: center;
        }

        .Pwd {
            text-align: center;
        }

        .Enter {
            background: black;
            color: white;
            border: 0;
            /* 클릭 전 버튼 테두리 */
            /*outline: 0; */
            /* 클릭 후 버튼 파란색 테두리 */
        }
    </style>

</head>
<body style="background: black;" oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
<!-- 드래그 금지 https://tren-d.tistory.com/entry/HTML-%EB%93%9C%EB%9E%98%EA%B7%B8-%EA%B8%88%EC%A7%80%ED%95%98%EA%B8%B0 -->

<div class="div1" style="">
    <h3 class="h3_lake" style="">湖</h3>
    <hr class="hr1" >
    <br />
    <form method="post" action="/board/home"> <!-- 도착 페이지 -->
        <div class="div2" style="">
            <input class="Pwd" type="password" style="text-align: center; padding: 5px;" placeholder=""><br /><br />
            <button type="button" class="Enter" style="" onclick="location.href='./board/home' ">入場</button>
        </div>
    </form>
</div>
</body>
</html>


