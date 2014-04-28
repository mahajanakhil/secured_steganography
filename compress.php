<!DOCTYPE HTML>
<html>
<head>
<title>
Secured Steganography and Spatial Domain Algorithms : A comparison
</title>
<style>
input {
background-color:white;height:20pt;border-color:black;
border:solid 2px;border-radius:4pt;
}
</style>
</head>
<body bgcolor="aqua">
<h1 align="center">Secured Steganography and Spatial Domain Algorithms : A comparison</h1>
<hr>
<?php
	
	move_uploaded_file($_FILES["imag"]["tmp_name"],"upload\\".$_FILES['imag']['name']);
	//echo "<h3 align='center'>The image provided is:</h3>";
	//echo "<center><img src='upload/".$_FILES['imag']['name']."'></center>";
	
	$command = "matlab -nodesktop -nosplash -r haar_compression('upload\\".$_FILES['imag']['name']."',".$_POST['thres'].",3);quit;";
	//echo $command;
	exec($command);	
	sleep(7);
	$a=filesize('b.jpg');
	$a=$a/1024;
	$f= substr( number_format( $a,4, '.', '' ) ,0 ,-1 );
	$nm = "upload\\".$_FILES['imag']['name'];
	$m=filesize($nm);
	$m=$m/1024;
	$f1= substr( number_format( $m,4, '.', '' ) ,0 ,-1 );
	echo "<table align='center' cellpadding='5'>";
	echo "<tr><th><h3 align='center'>Image Provided</h3></th><th><h3 align='center'>Image after Compression</h3></th></tr>";
	echo "<tr><td><center><img src='upload/".$_FILES['imag']['name']."'></center></td><td><center><img src='b.jpg'></center></td></tr>";
	echo "<tr><td><center>File Size :".$f1." kb</center></td><td><center>File Size :".$f." kb</center></td></tr></table>";
	//echo "<center><img src='b.jpg'></center>";
	?>
<h3 align="center">Algorithm Executed Successfully!!</h3> 
<form name="f4" action="index1.html">
<center><input type="submit" value="Execute other algorithms"></input></center>
</form>
</body>
</html>