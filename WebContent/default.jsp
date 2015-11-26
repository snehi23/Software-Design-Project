<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<title>Home</title>
</head>
<body>
<script>

	$(document).ready(function () {
			
		$('#submitIt').click(function(event) {
			
			var length = $('#length').val();
			var breadth = $('#breadth').val();
			var height = $('#height').val();
			var unit = $('#unit').val();
			$.post('VolCalController',{"length":length,"breadth":breadth,"height":height,"unit":unit},function(data){		
				alert("Ajax successful"+data);				
			} );
		})
		
	});

</script>
<!-- <form action="CalController" method="post">
		Length (In meters): <input type="text" name="given_length"/>
		Breadth (In meters): <input type="text" name="given_breadth"/>
		Height (In meters): <input type="text" name="given_height"/>
		<select name="units">
  				<option value="meters">meters</option>
  				<option value="centimeters">centimeters</option>
  				<option value="inches">inches</option>
  				<option value="yards">yards</option>
		</select>
		<input type="submit" value="submit"/>
</form> -->

<div>
		Length <input type="text" id="length"/>
		Breadth <input type="text" id="breadth"/>
		Height <input type="text" id="height"/>
		<select id="unit">
  				<option value="meters">meters</option>
  				<option value="centimeters">centimeters</option>
  				<option value="inches">inches</option>
  				<option value="yards">yards</option>
		</select>
		<input type="submit" id="submitIt" value="submit"/>
</div>

<div id="ajax">

</div>

</body>
</html>