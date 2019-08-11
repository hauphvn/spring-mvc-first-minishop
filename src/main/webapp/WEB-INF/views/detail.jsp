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
        <nav id="nav-homepage" class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/Minishop/">MINISHOP</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="navbar-center">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link nav-link-actived" href="#">TRANG CHỦ</a>
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
                                <%--                            <div class="dropdown-divider"></div>--%>
                                <%--                            <a class="dropdown-item" href="#">Something else here</a>--%>
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
                    <li class="nav-item"><a class="nav-link" href="/Minishop/cart"><img
                            src='<c:url value="/resources/imgs/white-cart.ico"/> ' alt="">
                            <div id="showAmountItemInCart"></div>

                    </a>
                    </li>
                </ul>
            </div>
        </nav>

    </div>
</div>

<div class="container-fluid">
    <div class="row container-detail">
        <div class="col-md-2 col-sm-3">
            <h4>Danh mục</h4>

            <ul class="list-group">
                <c:forEach var="category" items="${categories}">
                    <a href="#">
                        <li class="list-group-item" style="background:transparent">${category.getName()}</li>
                    </a>
                </c:forEach>
            </ul>

        </div>
        <div class="col-md-3 col-sm-3">
            <img id="urlImage" urlImage-value ="/resources/imgs/products/${product.getImage()}" class="img-responsive" src='<c:url value="/resources/imgs/products/${product.getImage()}"/> '
                 alt="Hinh anh chi tiet san pham">
        </div>
        <div class="col-md-5 col-sm-3">
            <h4 id="nameProduct" code-product-value="${product.getProduct_id()}">${product.getName()}</h4>
            <h5 id="priceProduct" data-value = " ${product.getPrice()}" class="price">đ ${product.getPrice()}</h5>
            <table class="table table-condensed">
                <thead>
                <tr>
                    <th>Màu/Kích cỡ</th>
                    <th>Số lượng</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="detail" items="${detailProducts}">
                    <tr id="rowSingleCart">
                        <td id="rowSingleCart-Color-Size" color-code-value="${detail.getColor(). getColor_id()}" size-code-value="${detail.getSize(). getSize_id()}" color-name-value="${detail.getColor(). getName()}" size-name-value="${detail.getSize(). getName()}">${detail.getColor().getName()}, ${detail.getSize().getName()}</td>
                        <td id="rowSingleCart-Amount" data-value="${detail.getAmount()}">Còn ${detail.getAmount()} sản phẩm</td>
                        <td>
                            <button class="btn btn-success btn-addCart">Thêm vào giỏ hàng</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-md-2 col-sm-3">
            <span>${product.getDescription()}</span>
        </div>
    </div>
</div>

<div id="footer" class="container-fluid">
    <div class="row">
        <div class="col-md-4 col-sm-4 wow fadeInRight" data-wow-duration="2s">
            <span class="title-footer ">THÔNG TIN SHOP</span><br/>
            <span>Minihshop là một thương hiệu đây uy tín, luôn đưa khách hàng lên hàng cao nhất</span>
        </div>
        <div class="col-md-4 col-sm-4 wow fadeInDown">
            <span class="title-footer ">LIÊN HỆ</span><br/>
            <span>161D/Lạc long quân, phường 3, quận 11, TP. Hồ Chí Minh</span>
        </div>
        <div class="col-md-4 col-sm-4  wow fadeInLeft">
            <span class="title-footer">GÓP Ý</span><br/>
            <form action="" method="post">
                <input name="fullname" class="footer-command" type="text" placeholder="Email"/>
                <textarea name="age" class="footer-command" rows="4" cols="30" placeholder="Nhập nội dung"></textarea>
                <button type="submit" style="width: 100%; font-weight: bold;">Gửi</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>

