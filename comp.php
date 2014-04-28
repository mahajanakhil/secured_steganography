<?php
	//$fileId = uniqid();
	
	//move_uploaded_file($_FILES["imag"]["tmp_name"],"upload/".$fileId.'.jpg');
	
	//$fp = fopen("input/".$fileId.".input", 'w');
	//fwrite($fp, "haar_compression(\"../upload/".$fileId.".jpg\", ".$_POST['thresh'].", 3, \"../output/".$fileId.".jpg\")");
	
	$command = "matlab -r '5*5'";
	$a=exec($command);	
	echo $a;
?>