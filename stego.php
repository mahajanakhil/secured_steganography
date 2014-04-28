<!DOCTYPE HTML>
<html>
<head>
<title>
Secured Steganography and Spatial Domain Algorithms : A comparison
</title>
</head>
<body bgcolor="aqua">
<h1 align="center">Secured Steganography and Spatial Domain Algorithms : A comparison</h1>
<hr>
<?php

$message = $_POST["mess"];
$fp = fopen("pro.txt","w+");
fwrite($fp,$message);
fclose($fp);
	
	move_uploaded_file($_FILES["imag"]["tmp_name"],"upload\\".$_FILES['imag']['name']);
	echo "<h1 align='center'>The image provided is:</h1>";
	echo "<center><img src='upload/".$_FILES['imag']['name']."'></center>";
	echo "<h3 align='center'>The message to embedd is ".$_POST["mess"]."</h3>";
	$command = "matlab -nodesktop -nosplash -r stego('pro.txt','upload\\".$_FILES['imag']['name']."','out.txt');quit;";
	//echo $command;
	exec($command);	
	sleep(27);
	echo "<h3 align='center'>Algorithm Executed Successfully!!</h3>";
	$fp = fopen("psnr_s.txt","r");
	$s=fread($fp,6);
	fclose($fp);
	$fp = fopen("out.txt","r");
	$s1=fread($fp,filesize('out.txt'));
	fclose($fp);
	echo "<h3 align='center'>The extracted message is ".$s1."</h3>";
	echo "<h3 align='center'>The PSNR value for this algorithm is ".$s."</h3>";
	
?> 
<button type="button" onclick="compare.php">Compare</button>
<a align="center" href="compare.php">Compare the PSNR value with other values</a>
<br>
<a align="center" href="index1.html">Execute other algorithms</a>
</body>
</html>