function light(sw) {
	var pic;
	
	if(sw == 1){
		pic = "https://www.w3schools.com/html/pic_bulboff.gif";
	} else{
		pic = "https://www.w3schools.com/html/pic_bulbon.gif";
	}
	
	document.getElementById('myImage').src = pic;
}