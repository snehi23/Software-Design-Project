<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<title>Home</title>
</head>
<body>
<style>
	#input_images img{
		border: solid;
		margin-right:14px;	
	}
	.output_images img{
		border: solid;
		margin-right:14px;
		margin-bottom:10px;	
	}
</style>
<script>

	var selShape = "";
	var selunit = "meters";
	var Obj = null;
	
	$(document).ready(function () {
		
		$("#input_div").hide();
		$("#ajax").hide();
		
		$('#img_cube').click(function(event) {	
			selShape="Cube";
			$("#input_div").show();		
		});
		
		$('#img_rp').click(function(event) {		
			selShape="Rectangular Pyramid";
			$("#input_div").show();		
		});
		
		$('#img_tp').click(function(event) {	
			selShape="Triangular Pyramid";
			$("#input_div").show();		
		});	
		
		$('input:radio[name="out_measure"]').change(
			    function(){
			        var u = "meters";
			        
			    	//Change Values as per unit selected in the result view.
			        if (this.checked && this.value == 'meters') {
			        	unitObject = Obj.meters;
			        	u = 'meter';
					}
			        if (this.checked && this.value == 'yards') {
			        	unitObject = Obj.yards;
			        	u = 'yards';
			        }
			        if (this.checked && this.value == 'centimeters') {
			        	unitObject = Obj.centimeters;
			        	u = 'centimeter';
			        }
			        if (this.checked && this.value == 'inches') {
			        	unitObject = Obj.inches;
			        	u = 'inches';
			        }
			        $("#shape_volume").text(unitObject.volume + " cubic" + u);
					$("#shape_length").text(unitObject.case1.max_length + " "+ u );
					$("#shape_breadth").text(unitObject.case1.max_length + " "+ u );
					$("#shape_height").text(unitObject.case1.max_length + " "+ u );
			    });
			
		$('#submitIt').click(function(event) {
			
			if (validateInput() == true) {
				
				var length = $('#length').val();
				var breadth = $('#breadth').val();
				var height = $('#height').val();
				selunit = $('input[name="measure"]:checked').val();
				
				$.post('VolCalController',{"length":length,"breadth":breadth,"height":height,"unit":selunit,"shape":selShape},function(data){		
							alert("Ajax successful"+JSON.stringify(data));
							
							
							Obj = data;
							
							//hide Other divs and show the result div
							$('#input_images').hide();
							$('#input_div').hide();
							$('#ajax').show();
							
							// populate values as per provided unit for measurement
							if( selunit == "meters"){
							unitObject = data.meters;
							$('[name="out_measure"][value="meters"]').prop( "checked", true );
							}
							if( selunit == "centimeters"){
								unitObject = data.centimeters;
							$('[name="out_measure"][value="centimeters"]').prop( "checked", true );
							}
							if( selunit == "yards"){
								unitObject = data.yards;
							$('[name="out_measure"][value="yards"]').prop( "checked", true );
							}
							if( selunit == "inches"){
								unitObject = data.inches;
							$('[name="out_measure"][value="inches"]').prop( "checked", true );
							}
							
							$("#shape_volume").text(unitObject.volume + " cubic" + selunit);
							$("#shape_length").text(unitObject.case1.max_length + " "+ selunit );
							$("#shape_breadth").text(unitObject.case1.max_length + " "+ selunit );
							$("#shape_height").text(unitObject.case1.max_length + " "+ selunit );
							
						} );
					}
			})
		
		function validateInput() {
			
			var length = parseFloat($('#length').val());
			var breadth = parseFloat($('#breadth').val());
			var height = parseFloat($('#height').val());
			selunit = $('input[name="measure"]:checked').val();
			
			if (isNaN(length) || isNaN(breadth) || isNaN(height)) {
				alert("Please provide values")
				return false;
			}
			
			if (length <= 0 || breadth <= 0 || height <= 0 || length <= breadth || length <= height) {
				
				alert("There is some problem with Input\
						\n1. One of your dimension is Zero\
						\n2. Length of wood cannot be less than its Breadth or Height\
						\nPlease re enter correct values.");
				return false;
			}		
			if (selShape == 'Cube') {
				var a = ( length + 8 * breadth + 8 * height ) / 12;				
				if(a <= 0 || (a - 2 * breadth <= 0) || (a - 2 * height <= 0)) {
					alert("We cannot carve out a cube out of given dimensions\
							\n Please check if the breadth or Height values are proportionate to Length.");
					
					return false;				
				}			
			} 	
			if (selShape == 'Rectangular Pyramid') {	
				var a = length / 8;
				if(a <= 0 || (a - 2 * breadth <= 0) || (a - 2 * height <= 0)) {
					alert("We cannot carve out a Rectangular Pyramid out of given dimensions\
					\n Please check if the breadth or Height values are proportionate to Length.");
					return false;				
				}			
			}	
			if (selShape == 'Triangular Pyramid') {	
				var a = length / 6;
				if(a <= 0 || a <= breadth || a <= height) {
					alert("We cannot carve out a Triangular Pyramid out of given dimensions\
					\n Please check if the breadth or Height values are proportionate to Length.");
					return false;				
				}			
			}			
			return true;	
		}
		
	});

</script>

<div class="container">
	<p><center><H1> Welcome To ASU Volume Calculator</H1><p>

<div id="input_images" >
	<div id="Shape_Select">
		<p><H3> Select a Shape you would like to build</H3><p>
	</div>
		<img src="images/cube_image.jpg"  id="img_cube" width="200" height="167" class = "img-rounded">
		<img src="images/rectangular_pyramid.jpg" id="img_rp" width="200" height="167" class = "img-rounded">
		<img src="images/tetrahedron.jpg"  id="img_tp" width="200" height="167" class = "img-rounded">
</div>

<div id="input_div">
<br/>
<form role="form">

 <div class="form-group row">
    <label class="control-label col-md-1 col-sm-offset-3" for="measure">Unit for Measurement:</label>
    <div class="col-md-4">
    	<label class="radio-inline"><input type="radio" name="measure" value = "meters" checked>Meter</label>
    	<label class="radio-inline"><input type="radio" name="measure" value = "yards">Yard</label>
    	<label class="radio-inline"><input type="radio" name="measure" value = "centimeters">Centimeter</label>
    	<label class="radio-inline"><input type="radio" name="measure" value = "inches">Inches</label>
  	</div>
 </div>
 
 <div class="form-group row">
    <label class="control-label col-md-1 col-sm-offset-3" for="length">Length:</label>
    <div class="col-md-3">
    	<input type="text" id="length" class="form-control" placeholder="Enter length of Wood">
  	</div>
 </div>
 
 <div class="form-group row">
   <label class="control-label col-md-1 col-sm-offset-3" for="breadth">Breadth:</label>
   <div class="col-md-3">
   		<input type="text" id="breadth" class="form-control" placeholder="Enter Breadth of Wood"/>
   </div>
 </div>
 
 <div class="form-group row">
    <label class="control-label col-md-1 col-sm-offset-3" for="height">Height:</label>
 	<div class="col-md-3">
 		<input type="text" id="height" class="form-control" placeholder="Enter Height of Wood"/>
  	</div>
 </div>  
 
 	<button type="button" id="submitIt" class="btn btn-primary">Submit</button>
 </form>
</div>
 
<div id="ajax">
		<div id="Shape_Select">
			<p><H3>Showing Result</H3><p>
		</div>
		<div class="row">
       	  <div class="output_images">
			<img src="images/cube_image.jpg"  id="img_cube" width="200" height="167" class = "img-rounded">
			<img src="images/cube_image.jpg" id="img_rp" width="200" height="167" class = "img-rounded">
		</div></div>
		<div class="row">
       	  <div class="output_images">
			<img src="images/cube_image.jpg"  id="img_tp" width="200" height="167" class = "img-rounded">
			<img src="images/cube_image.jpg"  id="img_tp" width="200" height="167" class = "img-rounded">
			</div></div>
		
   <div id="output_div"><br/>
	
	
	 <div class="form-group row">
	    <label class="control-label col-md-1 col-sm-offset-4" for="out_measure">Unit for Measurement:</label>
	    <div class="col-md-4">
	    	<label class="radio-inline"><input type="radio" name="out_measure" value = "meters">Meter</label>
	    	<label class="radio-inline"><input type="radio" name="out_measure" value = "yards">Yard</label>
	    	<label class="radio-inline"><input type="radio" name="out_measure" value = "centimeters">Centimeter</label>
	    	<label class="radio-inline"><input type="radio" name="out_measure" value = "inches">Inches</label>
	  	</div>
	 </div>
	 
	 <div class="form-group row">
	    <label class="control-label col-md-1 col-sm-offset-4" for="height">Volume:</label>
	 	<div class="col-md-3">
	 		<label class="control-label" id="shape_volume"></label>
	  	</div>
	 </div> 
	 <div class="form-group row">
	    <label class="control-label col-md-1 col-sm-offset-4" for="length">Length:</label>
	    <div class="col-md-3">
	    	<label class="control-label" id="shape_length"></label>
	  	</div>
	 </div>
	 
	 <div class="form-group row">
	   <label class="control-label col-md-1 col-sm-offset-4" for="breadth">Breadth:</label>
	   <div class="col-md-3">
	   		<label class="control-label" id="shape_breadth"></label>
	   </div>
	 </div>
	 
	 <div class="form-group row">
	    <label class="control-label col-md-1 col-sm-offset-4" for="height">Height:</label>
	 	<div class="col-md-3">
	 		<label class="control-label" id="shape_height"></label>
	  	</div>
	</div></div>

  </div>
</center></div>
</body>
</html>