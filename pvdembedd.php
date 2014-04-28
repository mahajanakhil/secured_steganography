<!DOCTYPE HTML>
<html>
<head>
<title>
Secured Steganography and Spatial Domain Algorithms : A comparison
</title>
<style>
input
{
border-color:black;
border:solid 2px;
border-radius:5px;
}
</style>
<script>
    function submitForm(action)
    {
        document.getElementById('f3').action = action;
        document.getElementById('f3').submit();
    }
</script>
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
	$command = "matlab -nodesktop -nosplash -r TpvdEmbed('pro.txt','upload\\".$_FILES['imag']['name']."','x.png');quit;";
	//echo $command;
	exec($command);
	sleep(7);
	echo "<h3 align='center'>Algorithm Executed Successfully!!</h3>";
	$fp = fopen("psnr_pemb.txt","r");
	$s=fread($fp,6);
	fclose($fp);
	echo "<h3 align='center'>The PSNR value for this algorithm is ".$s."</h3>";	
?>
<form id="f3">
<table align='center'>
<tr>
<td>
<center><input type="button" onclick="submitForm('compare.php')" value="Compare PSNR values"></input></center></td>
<td>
<center><input type="button" onclick="submitForm('index1.html')" value="Execute other algorithms"></input></center></td></tr></table>
</form>
</body>
</html>