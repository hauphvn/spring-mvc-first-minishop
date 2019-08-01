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
                <span id="sign-in" class="login-active" style="cursor: pointer">Đăng nhập</span>/
                <span id="sign-up" style="cursor: pointer">Đăng kí</span>
            </div>
            <div id="frame-sign-in" class="form-login">
                <input id="username-sign-in" name="username" class="meterial-text-input input-icon-email" placeholder="Email" type="text"> <br/>
                <input id="password-sign-in" name="password" class="meterial-text-input input-icon-password" placeholder="Password" type="password"><br/><br/>
                <button id="btnSignIn" class="meterial-submit-input"/>Đăng Nhập<br/>

            </div>

            <div id="frame-sign-up" class="form-login">
                <input id="username-sign-up" name="username" class="meterial-text-input input-icon-email" placeholder="Username" type="text"> <br/>
                <input id="password-sign-up" name="password" class="meterial-text-input input-icon-email" placeholder="Password" type="text"> <br/>
                <input id="repassword" name="repassword" class="meterial-text-input input-icon-password" placeholder="Re password" type="password"><br/><br/>
                <button id="btnSignUp" class="meterial-submit-input"/>Đăng ký<br/>

            </div>
            <span id = "resultCheckLogin"></span>
            <div id="logo-social">
                <span><img src='<c:url value="/resources/imgs/facebook.png" />' alt=""></span>
                <span><img src='<c:url value="/resources/imgs/google-plus.png" />' alt=""></span>
            </div>
        </div>
    </div>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>
