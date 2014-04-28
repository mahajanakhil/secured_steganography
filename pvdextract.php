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
	$command = "matlab -nodesktop -nosplash -r TpvdExtract('x.png','out.txt');quit;";
	//echo $command;
	exec($command);	
	sleep(5);
	$fp = fopen("out.txt","r");
	$s=fread($fp,filesize('out.txt'));
	fclose($fp);
	echo "<h2 align='center'>Image Provided</h2>";
	echo "<center><img src='upload/".$_FILES['imag']['name']."'></center>";
	echo "<br>";
	echo "<br>";
	echo "<i><table align='center' rules='all' border='2' cellpadding='5'>";
	echo "<tr><th> Embedded Message   </th><th> Extracted Message   </th></tr>";
	echo "<tr><td align='center'>".$_POST["mess"]."</td><td align='center'>".$s."</td></tr></table>";
	echo "<br>";
	if($s==" ")
	echo "<i><h3 align='center'>Algorithm did not Execute Successfully!!</h3> ";
	else
	echo "<i><h3 align='center'>Algorithm Executed Successfully!!</h3> ";
?>
<form name="fp" action="index1.html">
<center><input type="submit" value="Execute other algorithms"></input></center>
</form>
</body>
</html>