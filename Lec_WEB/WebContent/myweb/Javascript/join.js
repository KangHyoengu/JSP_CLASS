$(function(){
    setlocation($("#title"));
    setlocation($(".container"));

    window.onresize = function(){
        setlocation($("#title"));
        setlocation($(".container"));
    }
});

function setlocation(element){
    var tt = eval(element.css("padding").split("px")[0]);
    console.log(tt)
    var left = (element.width()/2+tt)*-1;
    element.css("marginLeft",left);
}