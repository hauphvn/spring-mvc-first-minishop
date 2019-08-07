
$(document).ready(function(){
    $("#colRed").click(function () {
       var text = $(this).attr("data-text");
       alert(text);
    });

    $(".btn-addCart").click(function () {
        var nameProduct = $("#nameProduct").text();
        var priceProduct = $("#priceProduct").attr("data-value");
        var colorCode = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("color-value");
        var sizeCode = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("size-value");
        var nameColorSize = $(this).closest("tr").find("#rowSingleCart-Color-Size").text();
        var amountProduct = $(this).closest("tr").find("#rowSingleCart-Amount").attr("data-value");

        alert(nameProduct + "-"+priceProduct +"-"+nameColorSize+"-"+colorCode+"-"+sizeCode+"-"+amountProduct);

    });

    $("#btnSignIn").click(function () {

        var username = $("#username-sign-in").val();
        var password = $("#password-sign-in").val();
        $.ajax({
            url:"/Minishop/api/checkLogin",
            type: "get",
            data:{
                username: username,
                password: password
            },
            success: function(value){
                if (value == "true"){
                    //get link page current
                    linkCurrent = window.location.href;
                    linkHomePage = linkCurrent.replace("dangnhap/","");
                    window.location = linkHomePage;
                }else{
                    $("#resultCheckLogin").text("Sai thông tin đăng nhập");
                }
            }
        })
    });

    $("#sign-in").click(function(){
        $("#resultSignUpOrSignIn").hide();
        $("#resultCheckLogin").hide();
        $(this).addClass("login-active");
        $("#sign-up").removeClass("login-active");
        $("#frame-sign-up").css("display","none");
        $("#frame-sign-in").show();

    });
    $("#sign-up").click(function(){
        $("#resultSignUpOrSignIn").hide();
        $("#resultCheckLogin").hide(); z
        $(this).addClass("login-active");
        $("#sign-in").removeClass("login-active");
        $("#frame-sign-in").css("display","none");
        $("#frame-sign-up").show();
    });


})