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
    <title>Adding Product</title>
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
                <%--                <div class="logo-w3-agile">--%>
                <%--                    <h1><a href="index.html">Pooled</a></h1>--%>
                <%--                </div>--%>
                <%--                <div class="w3layouts-left">--%>

                <%--                    <!--search-box-->--%>
                <%--                    <div class="w3-search-box">--%>
                <%--                        <form action="#" method="post">--%>
                <%--                            <input type="text" placeholder="Search..." required="">--%>
                <%--                            <input type="submit" value="">--%>
                <%--                        </form>--%>
                <%--                    </div><!--//end-search-box-->--%>
                <%--                    <div class="clearfix"> </div>--%>
                <%--                </div>--%>
                <%--                <div class="w3layouts-right">--%>
                <%--                    <div class="profile_details_left"><!--notifications of menu start -->--%>
                <%--                        <ul class="nofitications-dropdown">--%>
                <%--                            <li class="dropdown head-dpdn">--%>
                <%--                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-envelope"></i><span class="badge">3</span></a>--%>
                <%--                                <ul class="dropdown-menu">--%>
                <%--                                    <li>--%>
                <%--                                        <div class="notification_header">--%>
                <%--                                            <h3>You have 3 new messages</h3>--%>
                <%--                                        </div>--%>
                <%--                                    </li>--%>
                <%--                                    <li><a href="#">--%>
                <%--                                        <div class="user_img"><img src='<c:url value="/resources/web-backend/images/in11.jpg"/> ' alt=""></div>--%>
                <%--                                        <div class="notification_desc">--%>
                <%--                                            <p>Lorem ipsum dolor</p>--%>
                <%--                                            <p><span>1 hour ago</span></p>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="clearfix"></div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li class="odd"><a href="#">--%>
                <%--                                        <div class="user_img"><img src='<c:url value="/resources/web-backend/images/in10.jpg"/> ' alt=""></div>--%>
                <%--                                        <div class="notification_desc">--%>
                <%--                                            <p>Lorem ipsum dolor </p>--%>
                <%--                                            <p><span>1 hour ago</span></p>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="clearfix"></div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li><a href="#">--%>
                <%--                                        <div class="user_img"><img src='<c:url value="/resources/web-backend/images/in9.jpg"/> ' alt=""></div>--%>
                <%--                                        <div class="notification_desc">--%>
                <%--                                            <p>Lorem ipsum dolor</p>--%>
                <%--                                            <p><span>1 hour ago</span></p>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="clearfix"></div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li>--%>
                <%--                                        <div class="notification_bottom">--%>
                <%--                                            <a href="#">See all messages</a>--%>
                <%--                                        </div>--%>
                <%--                                    </li>--%>
                <%--                                </ul>--%>
                <%--                            </li>--%>
                <%--                            <li class="dropdown head-dpdn">--%>
                <%--                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell"></i><span class="badge blue">3</span></a>--%>
                <%--                                <ul class="dropdown-menu">--%>
                <%--                                    <li>--%>
                <%--                                        <div class="notification_header">--%>
                <%--                                            <h3>You have 3 new notification</h3>--%>
                <%--                                        </div>--%>
                <%--                                    </li>--%>
                <%--                                    <li><a href="#">--%>
                <%--                                        <div class="user_img"><img src='<c:url value="/resources/web-backend/images/in8.jpg"/> ' alt=""></div>--%>
                <%--                                        <div class="notification_desc">--%>
                <%--                                            <p>Lorem ipsum dolor</p>--%>
                <%--                                            <p><span>1 hour ago</span></p>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="clearfix"></div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li class="odd"><a href="#">--%>
                <%--                                        <div class="user_img"><img src='<c:url value="/resources/web-backend/images/in6.jpg"/> ' alt=""></div>--%>
                <%--                                        <div class="notification_desc">--%>
                <%--                                            <p>Lorem ipsum dolor</p>--%>
                <%--                                            <p><span>1 hour ago</span></p>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="clearfix"></div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li><a href="#">--%>
                <%--                                        <div class="user_img"><img src='<c:url value="/resources/web-backend/images/in7.jpg"/> ' alt=""></div>--%>
                <%--                                        <div class="notification_desc">--%>
                <%--                                            <p>Lorem ipsum dolor</p>--%>
                <%--                                            <p><span>1 hour ago</span></p>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="clearfix"></div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li>--%>
                <%--                                        <div class="notification_bottom">--%>
                <%--                                            <a href="#">See all notifications</a>--%>
                <%--                                        </div>--%>
                <%--                                    </li>--%>
                <%--                                </ul>--%>
                <%--                            </li>--%>
                <%--                            <li class="dropdown head-dpdn">--%>
                <%--                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-tasks"></i><span class="badge blue1">9</span></a>--%>
                <%--                                <ul class="dropdown-menu">--%>
                <%--                                    <li>--%>
                <%--                                        <div class="notification_header">--%>
                <%--                                            <h3>You have 8 pending task</h3>--%>
                <%--                                        </div>--%>
                <%--                                    </li>--%>
                <%--                                    <li><a href="#">--%>
                <%--                                        <div class="task-info">--%>
                <%--                                            <span class="task-desc">Database update</span><span class="percentage">40%</span>--%>
                <%--                                            <div class="clearfix"></div>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="progress progress-striped active">--%>
                <%--                                            <div class="bar yellow" style="width:40%;"></div>--%>
                <%--                                        </div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li><a href="#">--%>
                <%--                                        <div class="task-info">--%>
                <%--                                            <span class="task-desc">Dashboard done</span><span class="percentage">90%</span>--%>
                <%--                                            <div class="clearfix"></div>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="progress progress-striped active">--%>
                <%--                                            <div class="bar green" style="width:90%;"></div>--%>
                <%--                                        </div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li><a href="#">--%>
                <%--                                        <div class="task-info">--%>
                <%--                                            <span class="task-desc">Mobile App</span><span class="percentage">33%</span>--%>
                <%--                                            <div class="clearfix"></div>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="progress progress-striped active">--%>
                <%--                                            <div class="bar red" style="width: 33%;"></div>--%>
                <%--                                        </div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li><a href="#">--%>
                <%--                                        <div class="task-info">--%>
                <%--                                            <span class="task-desc">Issues fixed</span><span class="percentage">80%</span>--%>
                <%--                                            <div class="clearfix"></div>--%>
                <%--                                        </div>--%>
                <%--                                        <div class="progress progress-striped active">--%>
                <%--                                            <div class="bar  blue" style="width: 80%;"></div>--%>
                <%--                                        </div>--%>
                <%--                                    </a></li>--%>
                <%--                                    <li>--%>
                <%--                                        <div class="notification_bottom">--%>
                <%--                                            <a href="#">See all pending tasks</a>--%>
                <%--                                        </div>--%>
                <%--                                    </li>--%>
                <%--                                </ul>--%>
                <%--                            </li>--%>
                <%--                            <div class="clearfix"> </div>--%>
                <%--                        </ul>--%>
                <%--                        <div class="clearfix"> </div>--%>
                <%--                    </div>--%>
                <%--                    <!--notification menu end -->--%>

                <%--                    <div class="clearfix"> </div>--%>
                <%--                </div>--%>
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
                    <div class="success-alert myHidden" style="float:right;">
                        <i class="fa fa-check"></i>
                        Xóa sản phẩm THÀNH CÔNG!
                    </div>
                    <div class="fail-alert myHidden" style="float:right">
                        <i class="fa fa-check"></i>
                        Xóa sản phẩm THẤT BẠI!
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
                <div class="row" style="margin: 0 !important;">
                    <div class="col-sm-12 col-md-12">
                        <nav aria-label="Page navigation example">
                            <span id="pageNo" data-pageNo="${pageNo}"></span>
                            <ul class="pagination" >

                                <c:forEach var="i" begin="1" end="${pageNo}">
                                    <c:if test="${i == 1}">
                                        <li class="page-prev page-link" data-page-prev="${i}"><a href="#">Trang trước</a></li>
                                    </c:if>
                                    <c:choose>
                                        <c:when test = "${i == 1}">
                                            <li class="${i} page-item currentPage active" data-currentPage="${i}"><a class="page-link" href="#">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="${i} page-item currentPage" data-currentPage="${i}"><a class="page-link" href="#">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${i == pageNo}">
                                        <li class="page-next page-link" data-page-next=""><a href="#">Trang kế</a></li>
                                    </c:if>
                                </c:forEach>

                            </ul>
                            <a href='<c:url value="/adminAddingProduct/addProductSingle"/> '>
                                <button type="button" class="btn" style="background-color: #1B93E1; color: white; float: right;">Thêm sản phẩm</button>
                            </a>
                        </nav>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <table class="table table-condensed" id="table-product">
                            <thead>
                            <tr>
                                <th>Tên</th>
                                <th>Danh mục</th>
                                <th>Giá tiền</th>
                                <th>Xóa</th>
                                <th>Cập nhật</th>
                            </tr>
                            </thead>
                            <tbody id="choosePage" >
                                    <c:forEach var="product" items="${products}" begin="0" end="${rowMax - 1}">
                                        <tr>
                                            <td>${product.getName()}</td>
                                            <td>${product.getCategory().getName()}</td>
                                            <td>${product.getPrice()}</td>
                                            <td><img class="removeProduct" data-removeProduct="${product.getProduct_id()}" style='cursor: pointer' src='<c:url value='/resources/imgs/remove.png'/> ' alt='img-remove-product'></td>
                                            <td><a href="adminAddingProduct/updatingProduct/${product.getProduct_id()}"><img src='<c:url value="/resources/imgs/updated.png"/> '
                                                                                                          alt="icon-update-product"></a></td>
                                        </tr>
                                    </c:forEach>
                            </tbody>
                        </table>
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
                <%--                <li><a href="gallery.html"><i class="fa fa-picture-o" aria-hidden="true"></i><span>Gallery</span><div class="clearfix"></div></a></li>--%>
                <%--                <li id="menu-academico" ><a href="charts.html"><i class="fa fa-bar-chart"></i><span>Charts</span><div class="clearfix"></div></a></li>--%>
                <%--                <li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span> Short Codes</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>--%>
                <%--                    <ul id="menu-academico-sub" >--%>
                <%--                        <li id="menu-academico-avaliacoes" ><a href="icons.html">Icons</a></li>--%>
                <%--                        <li id="menu-academico-avaliacoes" ><a href="typography.html">Typography</a></li>--%>
                <%--                        <li id="menu-academico-avaliacoes" ><a href="faq.html">Faq</a></li>--%>
                <%--                    </ul>--%>
                <%--                </li>--%>
                <%--                <li id="menu-academico" ><a href="errorpage.html"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><span>Error Page</span><div class="clearfix"></div></a></li>--%>
                <%--                <li id="menu-academico" ><a href="#"><i class="fa fa-cogs" aria-hidden="true"></i><span> UI Components</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>--%>
                <%--                    <ul id="menu-academico-sub" >--%>
                <%--                        <li id="menu-academico-avaliacoes" ><a href="button.html">Buttons</a></li>--%>
                <%--                        <li id="menu-academico-avaliacoes" ><a href="grid.html">Grids</a></li>--%>
                <%--                    </ul>--%>
                <%--                </li>--%>
                <%--                <li><a href="tabels.html"><i class="fa fa-table"></i>  <span>Tables</span><div class="clearfix"></div></a></li>--%>
                <%--                <li><a href="maps.html"><i class="fa fa-map-marker" aria-hidden="true"></i>  <span>Maps</span><div class="clearfix"></div></a></li>--%>
                <%--                <li id="menu-academico" ><a href="#"><i class="fa fa-file-text-o"></i>  <span>Pages</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>--%>
                <%--                    <ul id="menu-academico-sub" >--%>
                <%--                        <li id="menu-academico-boletim" ><a href="calendar.html">Calendar</a></li>--%>
                <%--                        <li id="menu-academico-avaliacoes" ><a href="signin.html">Sign In</a></li>--%>
                <%--                        <li id="menu-academico-avaliacoes" ><a href="signup.html">Sign Up</a></li>--%>


                <%--                    </ul>--%>
                <%--                </li>--%>
                <%--                <li><a href="#"><i class="fa fa-check-square-o nav_icon"></i><span>Forms</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>--%>
                <%--                    <ul>--%>
                <%--                        <li><a href="input.html"> Input</a></li>--%>
                <%--                        <li><a href="validation.html">Validation</a></li>--%>
                <%--                    </ul>--%>
                <%--                </li>--%>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<%--<script>--%>
<%--    var toggle = true;--%>

<%--    $(".sidebar-icon").click(function() {--%>
<%--        if (toggle)--%>
<%--        {--%>
<%--            $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");--%>
<%--            $("#menu span").css({"position":"absolute"});--%>
<%--        }--%>
<%--        else--%>
<%--        {--%>
<%--            $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");--%>
<%--            setTimeout(function() {--%>
<%--                $("#menu span").css({"position":"relative"});--%>
<%--            }, 400);--%>
<%--        }--%>

<%--        toggle = !toggle;--%>
<%--    });--%>
<%--</script>--%>
<!--js -->
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
    // $(document).ready(function() {
    //     //BOX BUTTON SHOW AND CLOSE
    //     jQuery('.small-graph-box').hover(function() {
    //         jQuery(this).find('.box-button').fadeIn('fast');
    //     }, function() {
    //         jQuery(this).find('.box-button').fadeOut('fast');
    //     });
    //     jQuery('.small-graph-box .box-close').click(function() {
    //         jQuery(this).closest('.small-graph-box').fadeOut(200);
    //         return false;
    //     });
    //
    //     //CHARTS
    //     function gd(year, day, month) {
    //         return new Date(year, month - 1, day).getTime();
    //     }
    //
    //     graphArea2 = Morris.Area({
    //         element: 'hero-area',
    //         padding: 10,
    //         behaveLikeLine: true,
    //         gridEnabled: false,
    //         gridLineColor: '#dddddd',
    //         axes: true,
    //         resize: true,
    //         smooth:true,
    //         pointSize: 0,
    //         lineWidth: 0,
    //         fillOpacity:0.85,
    //         data: [
    //             {period: '2014 Q1', iphone: 2668, ipad: null, itouch: 2649},
    //             {period: '2014 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
    //             {period: '2014 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
    //             {period: '2014 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
    //             {period: '2015 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
    //             {period: '2015 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
    //             {period: '2015 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
    //             {period: '2015 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
    //             {period: '2016 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
    //             {period: '2016 Q2', iphone: 8442, ipad: 5723, itouch: 1801}
    //         ],
    //         lineColors:['#ff4a43','#a2d200','#22beef'],
    //         xkey: 'period',
    //         redraw: true,
    //         ykeys: ['iphone', 'ipad', 'itouch'],
    //         labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
    //         pointSize: 2,
    //         hideHover: 'auto',
    //         resize: true
    //     });
    //
    //
    // });
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
<!-- /script-for sticky-nav -->
<%--script of hauphvn--%>

<%--/script of hauphvn--%>
</body>
</html>
