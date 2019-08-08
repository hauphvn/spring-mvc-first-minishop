$(document).ready(function () {
    $("#colRed").click(function () {
        var text = $(this).attr("data-text");
        alert(text);
    });

    $.ajax({
        url:"/Minishop/api/itemInCart",
        type:"get",
        success: function (value) {
            if (value != ""){
                $("#showAmountItemInCart").addClass("amount-item-cart")
                    .html("<span>"+ value + "</span>");
            }
        }
    })

    $(".btn-addCart").click(function () {
        var nameProduct = $("#nameProduct").text();
        var codeProduct = $("#nameProduct").attr("code-product-value");
        var priceProduct = $("#priceProduct").attr("data-value");
        var colorCode = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("color-code-value");
        var sizeCode = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("size-code-value");
        var nameColor = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("color-name-value");
        var nameSize = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("size-name-value");
        var amountProduct = $(this).closest("tr").find("#rowSingleCart-Amount").attr("data-value");

        $.ajax({
            url: "/Minishop/api/addCart",
            type: "Get",
            data: {
                idProduct: codeProduct,
                idSize: sizeCode,
                idColor: colorCode,
                nameProduct: nameProduct,
                nameColor: nameColor,
                nameSize: nameSize,
                price: priceProduct,
                amount: amountProduct
            },
            success: function (value) {//return value =  amount of cart
                if (value != ""){
                    $("#showAmountItemInCart").addClass("amount-item-cart")
                        .html("<span>"+ value + "</span>");
                }
            }
        })

    });

    $("#btnSignIn").click(function () {

        var username = $("#username-sign-in").val();
        var password = $("#password-sign-in").val();
        $.ajax({
            url: "/Minishop/api/checkLogin",
            type: "get",
            data: {
                username: username,
                password: password
            },
            success: function (value) {
                if (value == "true") {
                    //get link page current
                    linkCurrent = window.location.href;
                    linkHomePage = linkCurrent.replace("dangnhap/", "");
                    window.location = linkHomePage;
                } else {
                    $("#resultCheckLogin").text("Sai thông tin đăng nhập");
                }
            }
        })
    });

    $("#sign-in").click(function () {
        $("#resultSignUpOrSignIn").hide();
        $("#resultCheckLogin").hide();
        $(this).addClass("login-active");
        $("#sign-up").removeClass("login-active");
        $("#frame-sign-up").css("display", "none");
        $("#frame-sign-in").show();

    });
    $("#sign-up").click(function () {
        $("#resultSignUpOrSignIn").hide();
        $("#resultCheckLogin").hide();
        z
        $(this).addClass("login-active");
        $("#sign-in").removeClass("login-active");
        $("#frame-sign-in").css("display", "none");
        $("#frame-sign-up").show();
    });


})