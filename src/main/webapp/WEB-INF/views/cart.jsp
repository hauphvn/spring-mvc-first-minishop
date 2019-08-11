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
                    <li class="nav-item"><a class="nav-link" href="#"><img
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
    <div class="row">
        <div class="col-sm-12 col-md-6">
            <br>
            <c:if test="${empty carts}">
                <h4>Bạn chưa chọn sản phẩm nào</h4>
            </c:if>
            <c:if test="${not empty carts}">
                <h4>Chi tiết sản phẩm trong giỏ hàng</h4>
                <table class="table table-striped">
                    <col>
                    <col>
                    <col width="90">
                    <col>
                    <col>
                    <thead>
                    <tr>
                        <th></th>
                        <th>Sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Giá</th>
                        <th>Bỏ khỏi giỏ hàng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${carts}">
                        <tr>
                            <td><img src='<c:url value="${product.getImage()}"/> ' style="width: 50px;" alt="Detail image product"></td>
                            <td>${product.getNameProduct()}|${product.getNameColor()}|${product.getNameSize()}</td>
                            <td class="UpdateAmountProduct">
<%--                                <div class="form-group">--%>
                                    <input class="amountProduct form-control" style="text-align: center;" type="number" min="1" value="${product.getAmount()}">
<%--                                </div>--%>
                            </td>
                            <td class="priceOrigin" data-priceOrigin="${product.getPrice()}" >
                                    ${product.getPrice()} <span> đ</span>
                            </td>
                            <td>
                                <form action="" id="formRemoveItem" method="post">
                                    <a href="#"><img style="cursor: pointer" src='<c:url value="/resources/imgs/remove.png"/> ' alt="icon-remove-product"></a>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr style="font-weight: bold">
                        <td colspan="3" class="text-right">Tổng cộng:</td>
                        <td class="totalPrice" colspan="3"></td>
                    </tr>
                    </tbody>
                </table>
            </c:if>
        </div>
        <div class="col-sm-12 col-md-6">
            <br>
            <h4>Thông tin người mua/nhận hàng</h4>
            <form action="">
                <div class="form-group">
                    <label for="txtCustomerName">Tên</label>
                    <input type="text" class="required form-control" id="txtCustomerName" name="txtCustomerName" placeholder="Tên người nhận">
                </div>
                <div class="form-group">
                    <label for="txtPhone">Điện thoại liên lạc</label>
                    <input type="text" class="required form-control" id="txtPhone" name="txtPhone" placeholder="Số điện thoại">
                </div>
                <div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="chosePickupAddress" checked="checked" value="shipToHome">
                            Nhận hàng tại nhà/công ty/bưu điện
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="chosePickupAddress" checked="checked" value="pickFromShop">
                            Nhận hàng tại cửa hàng MiniShop gần nhất
                        </label>
                    </div>
                </div>
                <div class="form-group" id="pnlAddress" style="display: block;">
                    <input type="text" class="required form-control " id="txtAddressLine" name="txtAddressLine" placeholder="Địa chỉ nhận hàng">
                </div>
                <div class="form-group" id="pnlChoseShop" style="display: none;">
                    <select name="slTakeFromShop" id="slTakeFromShop" class="form-control">
                        <option value="Chọn cửa hàng nhận hàng"></option>
                        <optgroup label="Tp. Hồ Chí Minh">
                            <option value="YaMe Q.10: 770F, Sư Vạn Hạnh (nd), P.12">YaMe Q.10: 770F, Sư Vạn Hạnh (nd), P.12</option>
                            <option value="YaMe Q.10: 286, 3 tháng 2, P.12">YaMe Q.10: 286, 3 tháng 2, P.12</option>
                            <option value="YaMe Q.5: 190, Nguyễn Trãi, P.3">YaMe Q.5: 190, Nguyễn Trãi, P.3</option>
                            <option value="YaMe Q.5: 116, Nguyễn Trãi, P.3">YaMe Q.5: 116, Nguyễn Trãi, P.3</option>
                            <option value="YaMe Q.7: 323 Huỳnh Tấn Phát">YaMe Q.7: 323 Huỳnh Tấn Phát</option>
                            <option value="YaMe Q.6: 102 Hậu Giang">YaMe Q.6: 102 Hậu Giang</option>
                            <option value="YaMe Q.9 (1): 114 Đỗ Xuân Hợp">YaMe Q.9 (1): 114 Đỗ Xuân Hợp</option>
                            <option value="YaMe Q.9 (2): 200 Lê Văn Việt P.Tăng Nhơn Phú B">YaMe Q.9 (2): 200 Lê Văn Việt P.Tăng Nhơn Phú B</option>
                            <option value="YaMe Q.12: 290 Phan Văn Hớn, Q.12">YaMe Q.12: 290 Phan Văn Hớn, Q.12</option>
                            <option value="YaMe Q.BT: 138 Đinh Tiên Hoàng, P.1">YaMe Q.BT: 138 Đinh Tiên Hoàng, P.1</option>
                            <option value="YaMe Tân Phú (1): 34 Nguyễn Sơn">YaMe Tân Phú (1): 34 Nguyễn Sơn</option>
                            <option value="YaMe Tân Phú (2): 189, Hòa Bình">YaMe Tân Phú (2): 189, Hòa Bình</option>
                            <option value="YaMe Gò Vấp (1): 507 - 509, Quang Trung, P.10">YaMe Gò Vấp (1): 507 - 509, Quang Trung, P.10</option>
                            <option value="YaMe Gò Vấp (2): 1096 Quang Trung, Gò Vấp">YaMe Gò Vấp (2): 1096 Quang Trung, Gò Vấp</option>
                            <option value="YaMe Q.Bình Tân: 232 Lê Văn Qưới">YaMe Q.Bình Tân: 232 Lê Văn Qưới</option>
                            <option value="YaMe Hóc Môn: 39 Quang Trung, Thới Tam Thôn">YaMe Hóc Môn: 39 Quang Trung, Thới Tam Thôn</option>
                            <option value="YaMe Thủ Đức: 336, Võ Văn Ngân, Q. Thủ Đức">YaMe Thủ Đức: 336, Võ Văn Ngân, Q. Thủ Đức</option>
                        </optgroup>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txtNote">Ghi chú</label>
                    <textarea class="form-control" name="txtNote" id="txtNote" rows="2"></textarea>
                </div>
            </form>
            <button class="btn btn-info fw form-control">Đặt hàng</button>
            <hr>
            <a href="#" class="btn btn-warning fw form-control">Cần sản phẩm khác? Tiếp tục mua hàng</a>
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

