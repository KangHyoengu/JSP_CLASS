$(function(){
    setHeight();

    $("#content").click(function(){
        $("#content input").focus();
    });

    $("#content input").focus(function(){
        $("#searchbar").css("boxShadow","3px 3px 3px #ccc");
    });
    
    $("#content input").blur(function(){
        $("#searchbar").css("boxShadow","none");
    });

    $("#searchbar input").keydown(function(){
        if(event.keyCode == 13){
            let address = $("#searchbar input").val().trim();
            
            move(encodeURIComponent(address));
        }
    })

    $("#hamberger").click(function(){
        var list = ["block","none"];
        var cc = $(this).attr("cc");

        $("#subbar").css("display", list[cc]);

        $(this).attr("cc", (eval($(this).attr("cc"))+1)%2)
    });

    var move = function(address) {
        window.location.href = 'HTML/map.html?address='+address;
    };
});

window.onresize = function(){
    setHeight();
    
}

function setHeight(){
    var h = $(window).height();

    $("section").css("height",h);
}