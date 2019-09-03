<%--
  Created by IntelliJ IDEA.
  User: cmd
  Date: 14/08/2019
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Updating Product</title>
    <%--    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>--%>
    <link href="<c:url value="/resources/web-backend/css/style.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/web-backend/css/morris.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/web-backend/css/font-awesome.css" />" rel="stylesheet">
    <link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet'
          type='text/css'/>
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='<c:url value="/resources/web-backend/css/bootstrap.min.css"/> ' rel='stylesheet' type='text/css'/>
    <script src='<c:url value="/resources/web-backend/js/jquery-2.1.4.min.js"/> '></script>
    <link rel="stylesheet" href='<c:url value="/resources/web-backend/css/icon-font.min.css"/> '>
</head>
<body>


<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">
            <!--header start here-->
            <div class="header-main">
                <div class="profile_details w3l">
                    <ul>
                        <li class="dropdown profile_details_drop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <div class="profile_img">
                                    <span class="prfil-img"><img
                                            src='<c:url value="/resources/web-backend/images/in4.jpg"/> '
                                            alt=""> </span>
                                    <div class="user-name">
                                        <p>Malorum</p>
                                        <span>Administrator</span>
                                    </div>
                                    <i class="fa fa-angle-down"></i>
                                    <i class="fa fa-angle-up"></i>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                            <ul class="dropdown-menu drp-mnu">
                                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                                <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                                <li><a href="#"><i class="fa fa-sign-out"></i> Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="clearfix"></div>
            </div>
            <!--heder end here-->
            <ol class="breadcrumb" style="margin: 0 !important;">
                <li class="breadcrumb-item">
                    <a href='<c:url value="/dashboard"/> '>Trang chủ</a>
                    <i class="fa fa-angle-right"></i>
                    <a href='<c:url value="/adminAddingProduct"/> '>Sản phẩm</a>
                </li>
            </ol>

            <!--inner block start here-->
            <div class="inner-block">
                <h3 style="text-align: center;">CẬP NHẬT SẢN PHẨM</h3>
                <div class="row">

                    <div class="col-sm-12 col-md-12">
                        <form action="" id="form-input-info-product">
                            <div class="form-group">
                                <p id="idProduct" data-idProduct="${product.getProduct_id()}"></p>
                                <label for="nameProduct">Tên sản phẩm:</label>
                                <input name="name" class="form-control nameProduct" id="nameProduct"
                                       value="${product.getName()}">
                            </div>
                            <div class="form-group">
                                <label for="category">Danh mục:</label>
                                <select name="category" class="form-control idCategory" id="category">
                                    <c:forEach var="category" items="${categories}">
                                        <c:choose>
                                            <c:when test="${category.getCategory_id() == product.getCategory().getCategory_id()}">
                                                <option selected value="${category.getCategory_id()}">${category.getName()}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${category.getCategory_id()}">${category.getName()}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <%--                          TODO xu li input gia tien san pham--%>
                                <label for="price">Giá tiền:</label>
                                <input name="price" type="text" class="form-control priceProduct" id="price"
                                       value="${product.getPrice()}">
                            </div>

                            <div class="form-group">
                                <label for="imageProduct">Chọn hình ảnh</label>
                                <input name="image" type="file" class="form-control-file" id="imageProduct">
                            </div>
                            <div class="form-group">
                                <label for="comment">Mô tả:</label>
                                <textarea name="description" class="form-control" rows="5"
                                          id="comment">${product.getDescription()}</textarea>
                            </div>
                        </form>
                        <form action="" id="form-input-detail-product">
                            <div id="moreDetailProduct">

                                <c:forEach var="detail" items="${product.getDetailProducts()}">
                                    <fieldset class="detailProduct">
                                        <legend>Thông tin chi tiết:</legend>
                                        <label>Màu sắc:</label>
                                        <select name="color" class="form-control idColor">
                                            <c:forEach var="color" items="${colors}">
                                                <c:choose>
                                                    <c:when test="${detail.getColor().getColor_id() == color.getColor_id()}">
                                                        <option selected
                                                                value="${color.getColor_id()}">${color.getName()}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${color.getColor_id()}">${color.getName()}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                        <label>Kích thước:</label>
                                        <select name="size" class="form-control idSize">
                                            <c:forEach var="size" items="${sizes}">
                                                <c:choose>
                                                    <c:when test="${detail.getSize().getSize_id() == size.getSize_id()}">
                                                        <option selected
                                                                value="${size.getSize_id()}">${size.getName()}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${size.getSize_id()}">${size.getName()}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                        <label>Số lượng</label>
                                        <input name="amount" min="1" value=${detail.getAmount()} type="number"
                                               class="form-control priceProduct">

                                        <label>Ngày nhập:</label>
                                        <input name="dayOfEntry" type="date" class="form-control dayOfEntry" value="${detail.getDayOfEntry()}">
                                        <p></p>
                                        <button class="btn btn-success btn-clone-detail-product">Thêm chi tiết</button>
                                        <p></p>
                                    </fieldset>
                                </c:forEach>

                            </div>
                        </form>


                        <fieldset id="cloneDetailProduct" class="detailProduct">
                            <legend>Thông tin chi tiết:</legend>
                            <label>Màu sắc:</label>
                            <select name="color" class="form-control idColor">
                                <c:forEach var="color" items="${colors}">
                                    <option value="${color.getColor_id()}">${color.getName()}</option>
                                </c:forEach>
                            </select>
                            <label>Kích thước:</label>
                            <select name="size" class="form-control idSize">
                                <c:forEach var="size" items="${sizes}">
                                    <option value="${size.getSize_id()}">${size.getName()}</option>
                                </c:forEach>
                            </select>
                            <label>Số lượng</label>
                            <input name="amount" min="1" value="1" type="number"
                                   class="form-control priceProduct">

                            <label>Ngày nhập:</label>
                            <input name="dayOfEntry" type="date" class="form-control dayOfEntry">
                            <p></p>
                            <button class="btn btn-success btn-clone-detail-product">Thêm chi tiết</button>
                            <p></p>
                        </fieldset>

                        <div class="success-alert myHidden">
                            <i class="fa fa-check"></i>
                            Cập nhập sản phẩm THÀNH CÔNG!
                        </div>
                        <div class="fail-alert myHidden">
                            <i class="fa fa-check"></i>
                            Cập nhập sản phẩm THẤT BẠI!
                        </div>

                        <button style="text-align: center;" class="btn btn-block btn-success updating-product"
                        >CẬP NHẬT SẢN PHẨM
                        </button>
                    </div>

                </div>
            </div>
            <!--inner block end here-->


            <!--copy rights start here-->
            <div class="copyrights">
                <p>© 2016 Pooled. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a>
                </p>
            </div>
            <!--COPY rights end here-->
        </div>
    </div>
    <!--//content-inner-->
    <!--/sidebar-menu-->
    <div class="sidebar-menu">
        <header class="logo1">
            <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a>
        </header>
        <div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
        <div class="menu">
            <ul id="menu">
                <li><a href='<c:url value="/dashboard"/> '><i class="fa fa-tachometer"></i> <span>Dashboard</span>
                    <div class="clearfix"></div>
                </a></li>


                <li id="menu-academico"><a href="adminAddingProduct"><i class="fa fa-cube"></i><span>Sản phẩm</span>
                    <div class="clearfix"></div>
                </a></li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<script src='<c:url value="/resources/web-backend/js/jquery.nicescroll.js"/> '></script>
<script src='<c:url value="/resources/web-backend/js/scripts.js"/> '></script>
<!-- Bootstrap Core JavaScript -->
<script src='<c:url value="/resources/web-backend/js/bootstrap.min.js"/> '></script>
<!-- /Bootstrap Core JavaScript -->
<!-- morris JavaScript -->
<script src='<c:url value="/resources/web-backend/js/raphael-min.js"/> '></script>
<script src='<c:url value="/resources/web-backend/js/morris.js"/> '></script>
<script src='<c:url value="/resources/js/custom.js"/> '></script>
<script>
</script>
<!-- script-for sticky-nav -->
<script>
    $(document).ready(function () {
        var navoffeset = $(".header-main").offset().top;
        $(window).scroll(function () {
            var scrollpos = $(window).scrollTop();
            if (scrollpos >= navoffeset) {
                $(".header-main").addClass("fixed");
            } else {
                $(".header-main").removeClass("fixed");
            }
        });

    });
</script>
</body>
</html>
