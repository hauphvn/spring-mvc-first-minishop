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
})