<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>Home Page</title>
</head>
<body>
<div  class="container-fluid promotion nav-menu-content">
    <jsp:include page="nav-menu.jsp"/>
</div>
<div class="product-title container">
    <div style="margin-bottom: 48px;">
        <span>${nameCategory}</span>
    </div>
    <div class="row">
        <c:forEach var="product" items="${products}">
            <div class="col-md-3 col-sm-6">
                <div class="product-home wow zoomIn">
                    <div class="card-deck product-cart">
                        <a href='<c:url value="/detail/${product.getProduct_id()}/"/> '><img class="card-img-top"
                                                                          src='<c:url value="/resources/imgs/products/${product.getImage()}" />'
                                                                          alt="Card image"></a>
                        <div class="card-body">
                            <h4 class="card-title">${product.getName()}</h4>
                            <a href="#" class="btn btn-primary">${product.getPrice()} VNĐ</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="footer-minishop.jsp"/>
<jsp:include page="footer.jsp"/>
</body>
</html>
