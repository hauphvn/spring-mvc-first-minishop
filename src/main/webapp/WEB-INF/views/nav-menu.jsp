<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div class="nav-menu">
    <nav id="nav-homepage" class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/Minishop/" style="background-color: transparent;">MINISHOP</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="navbar-center">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/Minishop/">TRANG CHỦ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">DỊCH VỤ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">LIÊN HỆ</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            THỜI TRANG
                        </a>
                        <div class="dropdown-menu dropdown-menu-none" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                        </div>
                    </li>
                </ul>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <%--                    <li class="nav-item"><a class="nav-link" href="#">ĐĂNG KÝ</a></li>--%>
                <c:choose>
                    <c:when test="${not empty firstName}">
                        <li class="nav-item"><a class="nav-link avatar-login" href="#">
                            <span>${firstName}</span></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="dangnhap/">
                            ĐĂNG NHẬP</a></li>
                    </c:otherwise>
                </c:choose>
                <li class="nav-item"><a style="background-color: transparent;" class="nav-link" href="/Minishop/cart"><img
                        src='<c:url value="/resources/imgs/white-cart.ico"/> ' alt="">
                    <div id="showAmountItemInCart"></div>

                </a>
                </li>
            </ul>
        </div>
    </nav>
    <br><br><br><br>
</div>
</body>
</html>
