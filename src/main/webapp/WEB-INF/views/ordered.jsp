<%--
  Created by IntelliJ IDEA.
  User: cmd
  Date: 02/08/2019
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>Detail Product</title>
</head>
<body>

<div class="container-fluid">
    <div style="background-color: black">
      <jsp:include page="nav-menu.jsp"/>
    </div>
</div>

<div class="container-fluid nav-menu-content">
    <div class="row">
        <div class="col-sm-12 col-md-12" style="margin-bottom: 212px;">
            <h4>Đặt hàng thành công.</h4>
            <p>
                Đơn hàng của bạn đã được ghi nhận. Bộ phận chăm sóc khách hàng sẽ liên hệ bạn trong <b>24h</b> để xác nhận đơn hàng.
            </p>
        </div>
    </div>
</div>

<jsp:include page="footer-minishop.jsp"/>
<jsp:include page="footer.jsp"/>
</body>
</html>

