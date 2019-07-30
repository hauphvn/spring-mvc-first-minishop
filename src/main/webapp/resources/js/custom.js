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
                    $("#resultCheckLogin").append("Success")
                }else{
                    $("#resultCheckLogin").append("Fail")
                }
            }
        })
    });
})