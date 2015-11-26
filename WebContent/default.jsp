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
		
		$("#input_div").hide();
		
		$('#img_cube').click(function(event) {	
			$("#input_div").show();		
		});
		
		$('#img_rp').click(function(event) {		
			$("#input_div").show();		
		});
		
		$('#img_tp').click(function(event) {	
			$("#input_div").show();		
		});	
			
		$('#submitIt').click(function(event) {
			
			if (validateInput() == true) {
				
				var length = $('#length').val();
				var breadth = $('#breadth').val();
				var height = $('#height').val();
				var unit = $('#unit').val();
				var shape = $('#shape').val();
			
			$.post('VolCalController',
					{"length":length,"breadth":breadth,"height":height,"unit":unit,"shape":shape},function(data){		
				//alert("Ajax successful"+JSON.stringify(data));	
				$("#ajax").text(JSON.stringify(data));
				//$("#input_div").hide();
			} );
			
			} else {
				
				alert("In valid Input Diamensions. Please verify");
			}
		})
		
		function validateInput() {
			
			var length = parseFloat($('#length').val());
			var breadth = parseFloat($('#breadth').val());
			var height = parseFloat($('#height').val());
			var unit = $('#unit').val();
			var shape = $('#shape').val();
			
			if (isNaN(length) || isNaN(breadth) || isNaN(height)) {
				
				return false;
			}
			
			if (length <= 0 || breadth <= 0 || height <= 0 || length <= breadth || length <= height) {
				return false;
			}		
			if (shape == 'Cube') {
				var a = ( length + 8 * breadth + 8 * height ) / 12;				
				if(a <= 0 || (a - 2 * breadth <= 0) || (a - 2 * height <= 0)) {
					return false;				
				}			
			} 	
			if (shape == 'Rectangular Pyramid') {	
				var a = length / 8;
				if(a <= 0 || (a - 2 * breadth <= 0) || (a - 2 * height <= 0)) {
					return false;				
				}			
			}	
			if (shape == 'Triangular Pyramid') {	
				var a = length / 6;
				if(a <= 0 || a <= breadth || a <= height) {
					return false;				
				}			
			}			
			return true;	
		}
		
	});

</script>

<div id="input_images" >
		<img src="wooden_frame_cube.jpg"  id="img_cube" height="60" width="60">
		<img src="rectangular_pyramid.png" id="img_rp" height="60" width="60">
		<img src="triangular_pyramid.gif"  id="img_tp" height="60" width="60">
</div>

<div id="input_div">

		<p> Please enter dimensions (In Meters)</p>
		Length: <input type="text" id="length"/>
		Breadth: <input type="text" id="breadth"/>
		Height: <input type="text" id="height"/>
		Unit: <select id="unit">
  				<option value="meters">meters</option>
  				<option value="centimeters">centimeters</option>
  				<option value="inches">inches</option>
  				<option value="yards">yards</option>
		</select>
		Shape: <select id="shape">
  				<option value="Cube">Cube</option>
  				<option value="Rectangular Pyramid">Rectangular Pyramid</option>
  				<option value="Triangular Pyramid">Triangular Pyramid</option>
		</select>
		<input type="submit" id="submitIt" value="submit"/>
</div>

<div id="ajax">

</div>

</body>
</html>