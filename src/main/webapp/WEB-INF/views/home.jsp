<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>Home Page</title>
</head>
<body>
<h1>Wellcome homepage</h1>
<h2>Demo boostrap reposive</h2>
<div class="container-fluid">
    <div class="row">
        <div id="colRed" class="col-md-4 col-sm-2 jqueryRed" style="height: 50px" data-text = "hauphvn" ></div>
        <div class="col-md-4 col-sm-6"  style="background-color: yellow; height: 50px"></div>
        <div class="col-md-4 col-sm-4"  style="background-color: purple; height: 50px"></div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
