<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <%--    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">--%>
    <title>Login</title>
</head>
<body id="body-login">
<div id="body-flex-login">
    <div id="container-login">
        <div id="avatar-login">
            <div id="text-header-login-left" class="header-login">
                <span id="text-logo">Wellcome</span><br/>
                <span id="hint-text-logo">Lorem ipsum dolor sit amet</span>
            </div>
            <div id="text-header-login-left-bottom">
                <p><img src='<c:url value="/resources/imgs/oval.png"/>' alt=""><span>Lorem ipsum dolor sit amet</span></p>
                <p><img src='<c:url value="/resources/imgs/oval.png"/>' alt=""><span>Lorem ipsum dolor sit amet</span></p>
                <p><img src='<c:url value="/resources/imgs/oval.png"/>' alt=""><span>Lorem ipsum dolor sit amet</span></p>
            </div>
        </div>
        <div id="input-login">
            <div id="text-top-right" class="header-login">
                <span class="login-actived">Đăng nhập</span>/
                <span>Đăng kí</span>
            </div>
            <div id="form-login">
                <form action="">
                    <input class="meterial-text-input input-icon-email" placeholder="Email" type="text"> <br/>
                    <input class="meterial-text-input input-icon-password" placeholder="Password" type="password"><br/>
                    <input class="meterial-submit-input" type="submit" value="Đăng Nhập"><br/>
                </form>
            </div>
            <div id="logo-social">
                <span><img src='<c:url value="/resources/imgs/facebook.png" />' alt=""></span>
                <span><img src='<c:url value="/resources/imgs/google-plus.png" />' alt=""></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
