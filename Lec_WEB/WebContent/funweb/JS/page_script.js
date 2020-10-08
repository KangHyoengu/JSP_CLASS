window.onload = function() {
	var ga = document.getElementById('galary');
	var img = ga.getElementsByTagName('img');
	
	var img_path = ["images/main_img.jpg","images/main_img1.jpg","images/main_img2.jpg"];
	var i = 1;
	j = 1
	
	function scrollPic() {
		var newImg = document.createElement('img')
		newImg.src = img_path[i]
		ga.style.width = (971+(971*j))+"px"
		ga.appendChild(newImg)
		
		ga.style.left = (-971*j)+"px";
		
		i = (i+1) % 3
		j++
	}
	
	setInterval(scrollPic,2000)
}
