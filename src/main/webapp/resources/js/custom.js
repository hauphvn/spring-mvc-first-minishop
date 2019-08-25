$(document).ready(function () {
    $("#colRed").click(function () {
        var text = $(this).attr("data-text");
    });
    checkAmountItemCart();
    checkPriceProduct();
    getTotalPrice();


    function clickPagination(numberPage) {
        var result = null;
        $.ajax({
            url: "/Minishop/api/pagination",
            type: "get",
            data: {
                curPage: numberPage

            },
            dataType: "html",
            async: false,
            success: function (outHtml) {
                result = outHtml;

            }
        });
        return result;
    }


    function checkPriceProduct() {
        $(".checkPriceProduct").each(function () {
            var amountOrigin = $(this).find(".amountProduct").val();
            // alert(amountOrigin);
            var priceOrigin = $(this).find(".priceOrigin").attr("data-priceOrigin");
            var priceUpdated = (parseInt(priceOrigin) * amountOrigin);
            var formatCurrency = priceUpdated.toFixed(3).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,").toString();
            $(this).find(".priceOrigin").html(formatCurrency.replace('.', ',') + ' đ');
        });
    };

    function getTotalPrice() {
        var sumPriceProductCart = 0;
        $(".priceOrigin").each(function () {
            var monoPrice = $(this).text().replace(/,/g, '');
            monoPrice = parseFloat(monoPrice);
            sumPriceProductCart = sumPriceProductCart + monoPrice;
        });
        sumPriceProductCart = sumPriceProductCart.toFixed(0).replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
        $('.totalPrice').html(
            sumPriceProductCart + " VNĐ");
    };

    function checkAmountItemCart() {
        $.ajax({
            url: "/Minishop/api/itemInCart",
            type: "get",
            success: function (value) {
                if (value != "") {
                    $("#showAmountItemInCart").addClass("amount-item-cart")
                        .html("<span>" + value + "</span>");
                }
            }
        })
    }

    $("ul").on("click", ".currentPage", function () {
        var curPage = $(this).attr("data-currentPage");
        $(this).closest("ul").find(".currentPage").removeClass("active");
        $(this).addClass("active");
        var outHtml = clickPagination(curPage);
        $("#choosePage").html.removeData;
        $("#choosePage").html(outHtml);
    });

    $(".page-prev").click(function () {
        var curPage = $(this).closest("ul").find(".active").attr("data-currentPage");
        if (curPage > 1) {
            curPage--;
            var classPos = "."+curPage+"";
            $(this).closest("ul").find(".currentPage").removeClass("active");
            var pos =  $(this).closest("ul").find(".currentPage").attr("data-currentPage");
            $(this).closest("ul").find(classPos).addClass("active");
            var outHtml = clickPagination(curPage);
            $("#choosePage").html.removeData;
            $("#choosePage").html(outHtml);
        }
    });

    $(".page-next").click(function () {
        var curPage = $(this).closest("ul").find(".active").attr("data-currentPage");
        var pageNo = $("#pageNo").attr("data-pageNo");
        if (curPage < pageNo) {
            curPage++;
            var classPos = "."+curPage+"";
            $(this).closest("ul").find(".currentPage").removeClass("active");
            var pos =  $(this).closest("ul").find(".currentPage").attr("data-currentPage");
            $(this).closest("ul").find(classPos).addClass("active");
            $("#choosePage").html.removeData;
            $("#choosePage").html(outHtml);
        }
    });

    $("tbody").on("click", ".removeProduct", function () {
        var idRemove = $(this).attr("data-removeProduct");
        idRemove = parseInt(idRemove);
        var This = $(this);
        // alert(idRemove);
        $.ajax({
            url:"/Minishop/api/deleteProductById",
            type:"Get",
            data:{
                id: idRemove
            },
            success:function (value) {
                if(value == "true"){}
                This.closest("tr").remove();
            }
        });
    });

    var arrayFile = [];
    $("#imageProduct").change(function (event) {
        arrayFile = event.target.files;
        forms = new FormData();
        forms.append("imageFile", arrayFile[0]);
        $.ajax({
            url:"/Minishop/api/uploadFile",
            type:"Post",
            contentType:false,
            processData: false,
            enctype: "multipart/form-data",
            data: forms

        });
    });

    $(".adding-product").click(function () {
        var nameProduct = $(".nameProduct").val();
        var idCategory = $(".idCategory").children("option:selected").val();
        var price = $(".priceProduct").val();
        var image = $("#imageProduct").val().replace(/C:\\fakepath\\/i, '');
        var comment = $("#comment").val();
        alert(comment);
    });
    $(".amountProduct").change(function () {
        var amountOrigin = $(this).val();
        var codeProduct = parseInt($(this).closest("tr").find(".idProduct").attr("data-idProduct"));
        var codeColor = parseInt($(this).closest("tr").find(".idColor").attr("data-idColor"));
        var codeSize = parseInt($(this).closest("tr").find(".idSize").attr("data-idSize"));
        $.ajax({
            url: "/Minishop/api/updateAmount",
            type: "Get",
            data: {
                idProduct: codeProduct,
                idColor: codeColor,
                idSize: codeSize,
                amount: amountOrigin
            },
            success: function (value) {
            }
        });
        var priceOrigin = $(this).closest("tr").find(".priceOrigin").attr("data-priceOrigin");
        var priceUpdated = (parseInt(priceOrigin) * amountOrigin);
        var formatCurrency = priceUpdated.toFixed(3).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,").toString();
        $(this).closest("tr").find(".priceOrigin").html(formatCurrency.replace('.', ',') + ' đ');
        getTotalPrice();
    });

    $(".removeProductFromCart").click(function () {
        var self = $(this);
        var codeProduct = parseInt($(this).closest("tr").find(".idProduct").attr("data-idProduct"));
        var codeColor = parseInt($(this).closest("tr").find(".idColor").attr("data-idColor"));
        var codeSize = parseInt($(this).closest("tr").find(".idSize").attr("data-idSize"));
        $.ajax({
            url: "/Minishop/api/removeProductFromCart",
            type: "Get",
            data: {
                idProduct: codeProduct,
                idColor: codeColor,
                idSize: codeSize
            },
            success: function (value) {
                if (value == "true") {
                    self.closest("tr").remove();
                    checkAmountItemCart();
                    getTotalPrice();
                } else {
                    alert(value);
                }
            }
        });
    });

    $(".btn-addCart").click(function () {
        var nameProduct = $("#nameProduct").text();
        var idProductDetail = $(this).attr("data-idProductDetail");
        var codeProduct = $("#nameProduct").attr("code-product-value");
        var priceProduct = $("#priceProduct").attr("data-value");
        var colorCode = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("color-code-value");
        var sizeCode = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("size-code-value");
        var nameColor = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("color-name-value");
        var nameSize = $(this).closest("tr").find("#rowSingleCart-Color-Size").attr("size-name-value");
        var amountProduct = $(this).closest("tr").find("#rowSingleCart-Amount").attr("data-value");
        var urlImage = $("#urlImage").attr("urlImage-value");
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
                amount: amountProduct,
                urlImage: urlImage,
                idProductDetail: idProductDetail
            },
            success: function (value) {//return value =  amount of cart
                if (value != "") {
                    $("#showAmountItemInCart").addClass("amount-item-cart")
                        .html("<span>" + value + "</span>");
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