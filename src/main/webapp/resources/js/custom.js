// $(document).ready(function(){
//     $("#colRed").click(function () {
//        $(this).addClass("jqueryOrange")
//     });
// })

$(document).ready(function(){
    $("#colRed").click(function () {
       var text = $(this).attr("data-text");
       alert(text);
    });

    $("#btnLogin").click(function () {

        var username = $("#username").val();
        var password = $("#password").val();
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
                    $("#resultCheckLogin").append("Fail")
                }
            }
        })
    });

    $("#sign-in").click(function(){
        $(this).addClass("login-active");
        $("#sign-up").removeClass("login-active");
        $("#frame-sign-up").css("display","none");
        $("#frame-sign-in").show();

    });
    $("#sign-up").click(function(){
        $(this).addClass("login-active");
        $("#sign-in").removeClass("login-active");
        $("#frame-sign-in").css("display","none");
        $("#frame-sign-up").show();
    });
})