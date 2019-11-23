<?php
	extract($_GET);
	if($count==-1){
		echo "!mainstyle.css";
	}
	if($count==0){
		echo "#pics/epic.jpeg";
	}
	if($count==1){
		echo "pics/slide6.jpg;pics/sell.jpg";
	}
	if($count>=2){
		echo "pics/map.jpg";
	}
?>