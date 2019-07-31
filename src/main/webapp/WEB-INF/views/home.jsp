<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>Home Page</title>
</head>
<body>

<div id="header" class="container-fluid">
    <div>
        <nav id="nav-homepage" class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">MINISHOP</a>
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
                            src='<c:url value="/resources/imgs/white-cart.ico"/> ' alt=""></a></li>
                </ul>
            </div>
        </nav>

        <div class="event-header container wow flash">
            <span>Ngày 1/1 đến 2/3</span><br/>
            <span style="font-size: 50px">Mua 1 tặng 1</span><br/>
            <button>XEM NGAY</button>
        </div>
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
        <div class="col-md-3 col-sm-6">
            <div class="product-home wow zoomIn">
                <div class="card-deck product-cart">
                    <img class="card-img-top" src='<c:url value="/resources/imgs/icon-tshirt.png" />' alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Áo sơ mi</h4>
                        <%--                       <p class="card-text">Some example text.</p>--%>
                        <a href="#" class="btn btn-primary">150K</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-home wow zoomIn">
                <div class="card-deck product-cart">
                    <img class="card-img-top" src='<c:url value="/resources/imgs/icon-tshirt.png" />' alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Áo sơ mi</h4>
                        <%--                        <p class="card-text">Some example text.</p>--%>
                        <a href="#" class="btn btn-primary">150K</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-home wow zoomIn">
                <div class="card-deck product-cart">
                    <img class="card-img-top" src='<c:url value="/resources/imgs/icon-tshirt.png" />' alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Áo sơ mi</h4>
                        <%--                        <p class="card-text">Some example text.</p>--%>
                        <a href="#" class="btn btn-primary">150K</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-home wow zoomIn">
                <div class="card-deck product-cart">
                    <img class="card-img-top" src='<c:url value="/resources/imgs/icon-tshirt.png" />' alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Áo sơ mi</h4>
                        <%--                        <p class="card-text">Some example text.</p>--%>
                        <a href="#" class="btn btn-primary">150K</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-home wow zoomIn">
                <div class="card-deck product-cart">
                    <img class="card-img-top" src='<c:url value="/resources/imgs/icon-tshirt.png" />' alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Áo sơ mi</h4>
                        <%--                        <p class="card-text">Some example text.</p>--%>
                        <a href="#" class="btn btn-primary">150K</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-home wow zoomIn">
                <div class="card-deck product-cart">
                    <img class="card-img-top" src='<c:url value="/resources/imgs/icon-tshirt.png" />' alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Áo sơ mi</h4>
                        <%--                        <p class="card-text">Some example text.</p>--%>
                        <a href="#" class="btn btn-primary">150K</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-home wow zoomIn">
                <div class="card-deck product-cart">
                    <img class="card-img-top" src='<c:url value="/resources/imgs/icon-tshirt.png" />' alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Áo sơ mi</h4>
                        <%--                        <p class="card-text">Some example text.</p>--%>
                        <a href="#" class="btn btn-primary">150K</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-home wow zoomIn">
                <div class="card-deck product-cart">
                    <img class="card-img-top" src='<c:url value="/resources/imgs/icon-tshirt.png" />' alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">Áo sơ mi</h4>
                        <%--                        <p class="card-text">Some example text.</p>--%>
                        <a href="#" class="btn btn-primary">150K</a>
                    </div>
                </div>
            </div>
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
