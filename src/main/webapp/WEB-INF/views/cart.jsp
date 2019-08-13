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
                        <tr class="checkPriceProduct" data-value="dfsdf">
                            <td class="idProduct" data-idProduct="${product.getIdProduct()}" style="display: none"></td>
                            <td class="idSize" data-idSize="${product.getIdSize()}" style="display: none"></td>
                            <td class="idColor" data-idColor="${product.getIdColor()}" style="display: none"></td>
                            <td><img src='<c:url value="${product.getImage()}"/> ' style="width: 50px;"
                                     alt="Detail image product"></td>
                            <td>${product.getNameProduct()}|${product.getNameColor()}|${product.getNameSize()}</td>
                            <td class="UpdateAmountProduct">
                                    <%--                                <div class="form-group">--%>
                                <input class="amountProduct form-control" style="text-align: center;" type="number"
                                       min="1" value="${product.getAmount()}">
                                    <%--                                </div>--%>
                            </td>
                            <td class="priceOrigin" data-priceOrigin="${product.getPrice()}">
                                    ${product.getPrice()} <span> đ</span>
                            </td>
                            <td>
                                <a class="removeProductFromCart" href="#"><img style="cursor: pointer"
                                                                               src='<c:url value="/resources/imgs/remove.png"/> '
                                                                               alt="icon-remove-product"></a>
                                    <%--                                <form action="" id="formRemoveItem" method="post">--%>
                                    <%--                                    <a href="#"><img style="cursor: pointer" src='<c:url value="/resources/imgs/remove.png"/> ' alt="icon-remove-product"></a>--%>
                                    <%--                                </form>--%>
                            </td>
                            <br>
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
            <form action="" method="post">
                <div class="form-group">
                    <label for="txtCustomerName">Tên</label>
                    <input type="text" class="required form-control" id="txtCustomerName" name="customer"
                           placeholder="Tên người nhận">
                </div>
                <div class="form-group">
                    <label for="txtPhone">Điện thoại liên lạc</label>
                    <input type="text" class="required form-control" id="txtPhone" name="phoneNumber"
                           placeholder="Số điện thoại">
                </div>
                <div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="deliveryForm" checked="checked" value="shipToHome">
                            Nhận hàng tại nhà/công ty/bưu điện
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="deliveryForm" value="pickFromShop">
                            Nhận hàng tại cửa hàng MiniShop gần nhất
                        </label>
                    </div>
                </div>
                <div class="form-group" id="pnlAddress" style="display: block;">
                    <input type="text" class="required form-control " id="txtAddressLine" name="deliveryAddress"
                           placeholder="Địa chỉ nhận hàng">
                </div>
                <div class="form-group" id="pnlChoseShop" style="display: none;">
                    <select name="slTakeFromShop" id="slTakeFromShop" class="form-control">
                        <option value="Chọn cửa hàng nhận hàng"></option>
                        <optgroup label="Tp. Hồ Chí Minh">
                            <option value="YaMe Q.10: 770F, Sư Vạn Hạnh (nd), P.12">YaMe Q.10: 770F, Sư Vạn Hạnh (nd),
                                P.12
                            </option>
                            <option value="YaMe Q.10: 286, 3 tháng 2, P.12">YaMe Q.10: 286, 3 tháng 2, P.12</option>
                            <option value="YaMe Q.5: 190, Nguyễn Trãi, P.3">YaMe Q.5: 190, Nguyễn Trãi, P.3</option>
                            <option value="YaMe Q.5: 116, Nguyễn Trãi, P.3">YaMe Q.5: 116, Nguyễn Trãi, P.3</option>
                            <option value="YaMe Q.7: 323 Huỳnh Tấn Phát">YaMe Q.7: 323 Huỳnh Tấn Phát</option>
                            <option value="YaMe Q.6: 102 Hậu Giang">YaMe Q.6: 102 Hậu Giang</option>
                            <option value="YaMe Q.9 (1): 114 Đỗ Xuân Hợp">YaMe Q.9 (1): 114 Đỗ Xuân Hợp</option>
                            <option value="YaMe Q.9 (2): 200 Lê Văn Việt P.Tăng Nhơn Phú B">YaMe Q.9 (2): 200 Lê Văn
                                Việt P.Tăng Nhơn Phú B
                            </option>
                            <option value="YaMe Q.12: 290 Phan Văn Hớn, Q.12">YaMe Q.12: 290 Phan Văn Hớn, Q.12</option>
                            <option value="YaMe Q.BT: 138 Đinh Tiên Hoàng, P.1">YaMe Q.BT: 138 Đinh Tiên Hoàng, P.1
                            </option>
                            <option value="YaMe Tân Phú (1): 34 Nguyễn Sơn">YaMe Tân Phú (1): 34 Nguyễn Sơn</option>
                            <option value="YaMe Tân Phú (2): 189, Hòa Bình">YaMe Tân Phú (2): 189, Hòa Bình</option>
                            <option value="YaMe Gò Vấp (1): 507 - 509, Quang Trung, P.10">YaMe Gò Vấp (1): 507 - 509,
                                Quang Trung, P.10
                            </option>
                            <option value="YaMe Gò Vấp (2): 1096 Quang Trung, Gò Vấp">YaMe Gò Vấp (2): 1096 Quang Trung,
                                Gò Vấp
                            </option>
                            <option value="YaMe Q.Bình Tân: 232 Lê Văn Qưới">YaMe Q.Bình Tân: 232 Lê Văn Qưới</option>
                            <option value="YaMe Hóc Môn: 39 Quang Trung, Thới Tam Thôn">YaMe Hóc Môn: 39 Quang Trung,
                                Thới Tam Thôn
                            </option>
                            <option value="YaMe Thủ Đức: 336, Võ Văn Ngân, Q. Thủ Đức">YaMe Thủ Đức: 336, Võ Văn Ngân,
                                Q. Thủ Đức
                            </option>
                        </optgroup>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txtNote">Ghi chú</label>
                    <textarea class="form-control" name="notes" id="txtNote" rows="2"></textarea>
                </div>
                <button class="btn btn-info fw form-control">Đặt hàng</button>
            </form>

            <hr>
            <a href="#" class="btn btn-warning fw form-control">Cần sản phẩm khác? Tiếp tục mua hàng</a>
        </div>
    </div>
</div>

<jsp:include page="footer-minishop.jsp"/>
<jsp:include page="footer.jsp"/>
</body>
</html>

