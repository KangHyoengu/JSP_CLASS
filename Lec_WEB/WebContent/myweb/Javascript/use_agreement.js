$(function(){
    setCenter();
});

window.onresize = function(){
    setCenter();
}

function setCenter(){
    var title_width = ($("#title").width()/2.0)*-1;
    var wrap_width = ($("#wrap").width()/2.0)*-1;

    $("#title").css('margin-left',title_width);
    $("#wrap").css('margin-left',wrap_width);
}