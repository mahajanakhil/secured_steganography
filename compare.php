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
</head>
<body bgcolor="aqua">
<h1 align="center">Secured Steganography and Spatial Domain Algorithms : A comparison</h1>
<hr>
<h3 align="center">PSNR VALUES</h3>
<br>
<table border='2' align="center" cellpadding="10px" rules="all">
<tr>
<th>Secured Steganography
<th>LSB Technique
<th>PVD Technique
<th>OPA Technoque
</tr>
<tr>
<?php
$fp = fopen("psnr_s.txt",'r');
$s[0]=fread($fp,6);
if($s[0]=='')
{
echo "<td align='center'>";
echo "NOT Executed";
$s[0]=0;
}
else
{
echo "<td align='center'>";
echo $s[0];
}
fclose($fp);
echo "<br>";

$fp = fopen("psnr_lemb.txt",'r');
$s[1]=fread($fp,6);
if($s[1]=='')
{
echo "<td align='center'>";
echo "NOT Executed";
$s[1]=0;
}
else
{
echo "<td align='center'>";
echo $s[1];
}
fclose($fp);
echo "<br>";

$fp = fopen("psnr_pemb.txt",'r');
$s[2]=fread($fp,6);
if($s[2]=='')
{
echo "<td align='center'>";
echo "NOT Executed";
$s[2]=0;
}
else
{
echo "<td align='center'>";
echo $s[2];
}
fclose($fp);
$fp = fopen("psnr_oemb.txt",'r');
$s[3]=fread($fp,6);
if($s[3]=='')
{
echo "<td align='center'>";
echo "NOT Executed";
$s[3]=0;
}
else
{
echo "<td align='center'>";
echo $s[3];
}
fclose($fp);
echo "<br>";

echo "</tr></table>";
echo "<br>";
$pos=0;
$max=$s[0];
for($i=1;$i<4;$i++)
{
if($max<$s[$i])
{
$max=$s[$i];
$pos=$i+1;
}
}
echo "<h4 align='center'>The highest PSNR value among executed algorithms is ".$max."</h4>";
if($pos==1)
echo "<h4 align='center'>The Best algorithm based on PSNR value is Secured Steganography";
else if($pos==2)
echo "<h4 align='center'>The Best algorithm based on PSNR value is LSB Technique";
else if($pos==3)
echo "<h4 align='center'>The Best algorithm based on PSNR value is PVD Technique";
else
echo "<h4 align='center'>The Best algorithm based on PSNR value is OPA Technique";
?>