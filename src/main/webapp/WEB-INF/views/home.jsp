<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>Home Page</title>
</head>
<body>

<div id="header" class="container-fluid promotion nav-menu-content">
    <jsp:include page="nav-menu.jsp"/>
    <div class="event-header container wow flash ">
        <span>Ngày 1/1 đến 2/3</span><br/>
        <span style="font-size: 50px">Mua 1 tặng 1</span><br/>
        <button>XEM NGAY</button>
    </div>
</div>
<div id="info" class="container">
    <div class="row">
        <div class="col-12 col-sm-4 col-md-4 wow fadeInRight" data-wow-duration="2s">
            <img src='<c:url value="/resources/imgs/quality.png"/> ' alt="icon-quality"/><br/>
            <span style="font-size: 32px;">Chất lượng</span><br/>
            <span>Chúng tôi cam kết sẽ mang đến cho bạn sản phẩm với chất lượng tốt nhất</span>
        </div>
        <div class="col-12 col-sm-4 col-md-4 wow fadeInLeft" data-wow-duration="2s">
            <img src='<c:url value="/resources/imgs/icon-piggy-bank.png"/> ' alt="icon-quality"/><br/>
            <span style="font-size: 32px;">Tiết kiệm chi phí</span><br/>
            <span>Chúng tôi cam kết sẽ mang đến cho bạn sản phẩm với chất lượng tốt nhất</span>
        </div>
        <div class="col-12 col-sm-4 col-md-4 wow fadeInDown" data-wow-duration="2s">
            <img src='<c:url value="/resources/imgs/icon-shipped.png"/> ' alt="icon-quality"/><br/>
            <span style="font-size: 32px;">Giao hàng</span><br/>
            <span>Chúng tôi cam kết sẽ mang đến cho bạn sản phẩm với chất lượng tốt nhất</span>
        </div>
    </div>
</div>
<div class="product-title container">
    <div style="margin-bottom: 48px;">
        <span>SẢN PHẨM HOT</span>
    </div>
    <div class="row">
        <c:forEach var="product" items="${listProducts}">
            <div class="col-md-3 col-sm-6">
                <div class="product-home wow zoomIn">
                    <div class="card-deck product-cart">
                        <a href="detail/${product.getProduct_id()}/"><img class="card-img-top"
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
