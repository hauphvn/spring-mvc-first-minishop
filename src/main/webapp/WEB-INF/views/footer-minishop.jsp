<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
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
</body>
</html>
