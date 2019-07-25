<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>Home Page</title>
</head>
<body>

<div id="header" class="container-fluid">
    <div>
        <nav id="nav-homepage" class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">MINISHOP</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto navbar-center">
                    <li class="nav-item active">
                        <a class="nav-link nav-link-actived" href="#">TRANG CHỦ <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">DỊCH VỤ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">LIÊN HỆ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            THỜI TRANG
                        </a>
                        <div class="dropdown-menu dropdown-menu-none" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
<%--                            <div class="dropdown-divider"></div>--%>
<%--                            <a class="dropdown-item" href="#">Something else here</a>--%>
                        </div>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-item"><a class="nav-link" href="#">ĐĂNG KÝ</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">ĐĂNG NHẬP</a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><img src='<c:url value="/resources/imgs/white-cart.ico"/> ' alt=""></a></li>
                </ul>
            </div>
        </nav>
        <div class="event-header container">
            <span>Ngày 1/1 đến 2/3</span><br/>
            <span style="font-size: 50px">Mua 1 tặng 1</span><br/>
            <button>XEM NGAY</button>
        </div>
    </div>
    <div></div>
    <div></div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
