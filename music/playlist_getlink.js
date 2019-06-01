// run this in developer console in browser AFTER scroll down to the bottom
link = document.getElementsByClassName("yt-simple-endpoint style-scope ytd-playlist-video-renderer");
ret = "";
for(var i = 0; i < link.length; i++){
	ret = ret + link[i].href + "," + link[i].innerText.split("\n")[1] + ",\n";
}
console.log(ret)
