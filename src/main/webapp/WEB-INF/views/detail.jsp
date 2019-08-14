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
    <jsp:include page="nav-menu.jsp"/>
</div>

<div class="container-fluid nav-menu-content">
    <div class="row container-detail">
        <div class="col-md-2 col-sm-3">
            <h4>Danh mục</h4>

            <ul class="list-group">
                <c:forEach var="category" items="${categories}">
                    <a href='<c:url value="/product/${category.getCategory_id()}/${category.getName()}"/> '>
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
                            <button class="btn btn-success btn-addCart" data-idProductDetail="${detail.getDetail_product_id()}">Thêm vào giỏ hàng</button>
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
<jsp:include page="footer-minishop.jsp"/>
<jsp:include page="footer.jsp"/>
</body>
</html>

