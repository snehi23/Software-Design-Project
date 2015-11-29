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
	
	.selectedIMG{
	box-shadow:2px 12px 15px 2px #833;
	}
	
	#errorMessage{
		position: absolute;
		left: 60%;
		width:250px;
		max-width:250px;
   		height:20px;
   		max-height:20px;
   		color: red; 
	}
	
	
</style>
<script>

	var selShape = "";
	var selunit = "meters";
	var Obj = null;
	var selIMG = "";
	
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
		
		$('img').click(function(){
			   $('.selectedIMG').removeClass('selectedIMG'); // removes the previous selected class
			
			   // adds the class to the clicked image
			   $(this).addClass('selectedIMG');
			   
			   selIMG = $(this).prop('name');
			});
		
		
		$('input:radio[name="out_measure"]').change(
			    function(){
			        var u = "";
			        var caseObject =null;
			    	//select the Unit of measurement for display
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
			        
			        //change values s per selected image from results.
			        if (selIMG == 'case1')
			        	caseObject = unitObject.case1;
			        if (selIMG == 'case2') 
			        	caseObject = unitObject.case2;
			        if (selIMG == 'case3')
			        	caseObject = unitObject.case3;
			        if (selIMG == 'case4')
			        	caseObject = unitObject.case4;
			        
			     //   $("#shape_volume").text(unitObject.volume + " cubic" + u);
				//	$("#shape_length").text(unitObject.case1.max_length + " "+ u );
				//	$("#shape_breadth").text(unitObject.case1.max_length + " "+ u );
				//	$("#shape_height").text(unitObject.case1.max_length + " "+ u );
				
				 	$("#shape_volume").text(unitObject.volume + " cubic-" + u);
					if(selShape =='Cube'){
				 		$("#shape_length").text(caseObject.max_length + " "+ u );
						$("#shape_breadth").text(caseObject.max_length + " "+ u );
						$("#shape_height").text(caseObject.max_length + " "+ u );
					}else{
						$("#pyramid_base").text(unitObject.case1.max_length + " "+ u );
						$("#pyramid_slant").text(unitObject.case1.max_length + " "+ u );
						$("#pyramid_height").text(unitObject.pyramid_height + " "+ u );
					}
			    });
			
		
		
		$('#changeIt').click(function(event) {
			$('#ajax').hide();
			$('#input_images').show();
			$('#input_div').show();
			
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
							
							//show options
							showOption();
							
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
							
							$('#ajax .selectedIMG').removeClass('selectedIMG');
							$("img[name='case1']").addClass('selectedIMG');
							selIMG = "case1";
							
							$("#shape_volume").text(unitObject.volume + " cubic-" + selunit);
							if(selShape == "Cube"){
								$('.cube').show();
								$('.pyramid').hide();
								$("#shape_length").text(unitObject.case1.max_length + " "+ selunit );
								$("#shape_breadth").text(unitObject.case1.max_length + " "+ selunit );
								$("#shape_height").text(unitObject.case1.max_length + " "+ selunit );
							}
							else{
								$('.cube').hide();
								$('.pyramid').show();
								$("#pyramid_base").text(unitObject.case1.max_length + " "+ selunit );
								$("#pyramid_slant").text(unitObject.case1.max_length + " "+ selunit );
								$("#pyramid_height").text(unitObject.pyramid_height + " "+ selunit );
							}
							
						} );
					}
			})
		
		function showOption(){
			var unitObject = null;
			
			if( selunit == "meters")
				unitObject = Obj.meters;
			if( selunit == "centimeters")
					unitObject = Obj.centimeters;
			if( selunit == "yards")
					unitObject = Obj.yards;
			if( selunit == "inches")
					unitObject = Obj.inches;
			
			$(".output_images img").hide();
			
			if(unitObject.case1 != null){
				$('img[name="case1"]').show();
			}
			if(unitObject.case2 != null){
				$('img[name="case2"]').show();
			}
			if(unitObject.case3 != null){
				$('img[name="case3"]').show();
			}
			if(unitObject.case4 != null){
				$('img[name="case4"]').show();
			}
		}
		
		function validateInput() {
			
			var length = parseFloat($('#length').val());
			var breadth = parseFloat($('#breadth').val());
			var height = parseFloat($('#height').val());
			selunit = $('input[name="measure"]:checked').val();
			
			if (isNaN(length) || isNaN(breadth) || isNaN(height)) {
				//alert("Please provide values")
				$('#errorMessage').text("Please provide values");
				return false;
			}
			
			if (length <= 0 || breadth <= 0 || height <= 0) {
				
				//alert("There is some problem with Input\
				//		\n1. One of your dimension is Zero\
				//		\nPlease re enter correct values.");
				$('#errorMessage').text("One of your dimension is Zero");
				
				return false;
			}
			if (length <= breadth || length <= height) {
				
				//alert("There is some problem with Input\
				//		\n1. Length of wood cannot be less than its Breadth or Height\
				//		\nPlease re enter correct values.");
				
				$('#errorMessage').text("Length of wood cannot be less than its Breadth or Height");
				
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
</div></center>

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
 <div class="form-group row" id="errorMessage">
    
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
   		<input type="text" id="breadth" class="form-control" placeholder="Enter Breadth of Wood">
   </div>
 </div>
 
 <div class="form-group row">
    <label class="control-label col-md-1 col-sm-offset-3" for="height">Height:</label>
 	<div class="col-md-3">
 		<input type="text" id="height" class="form-control" placeholder="Enter Height of Wood">
  	</div>
 </div>  
 
 	<center><button type="button" id="submitIt" class="btn btn-primary">Submit</button></center>
 </form>
</div>
 
<div id="ajax">
		<div class="row">
		<div id="Shape_Select">
			<p><center><H4>Showing Results:</H4></center></p>
		</div></div>
		
		<center>
		<div class="row">
       	  	<div class="output_images">
			<img src="images/cube_image.jpg" width="200" height="167" class = "img-rounded" name="case1">
			<img src="images/cube_image.jpg" width="200" height="167" class = "img-rounded" name="case2">
			<!-- Dynamic load images as per ajax response -->
			</div>
		</div>
		<div class="row">
       	  <div class="output_images">
		  <!-- Dynamic load images as per ajax response -->
		  <img src="images/cube_image.jpg" width="200" height="167" class = "img-rounded" name="case3">
		  <img src="images/cube_image.jpg" width="200" height="167" class = "img-rounded" name="case4">
		  </div>
		</div> 
		
		<div class="row">
				<button type="button" id="changeIt" class="btn btn-primary">Change Dimension</button>
		</div>
		</center>
		
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
	 <div class="form-group row cube">
	    <label class="control-label col-md-1 col-sm-offset-4" for="shape_length">Length:</label>
	    <div class="col-md-3">
	    	<label class="control-label" id="shape_length"></label>
	  	</div>
	 </div>
	 
	 <div class="form-group row cube">
	   <label class="control-label col-md-1 col-sm-offset-4" for="shape_breadth">Breadth:</label>
	   <div class="col-md-3">
	   		<label class="control-label" id="shape_breadth"></label>
	   </div>
	 </div>
	 
	 <div class="form-group row cube">
	   <label class="control-label col-md-1 col-sm-offset-4" for="shape_height">Height:</label>
	   <div class="col-md-3">
	   		<label class="control-label" id="shape_height"></label>
	   </div>
	 </div>
	 
	 <div class="form-group row pyramid">
	    <label class="control-label col-md-1 col-sm-offset-4" for="pyramid_base">Base:</label>
	 	<div class="col-md-3">
	 		<label class="control-label" id="pyramid_base"></label>
	  	</div>
	</div>
	
	 <div class="form-group row pyramid">
	   <label class="control-label col-md-1 col-sm-offset-4" for="pyramid_slant">Slant ht:</label>
	   <div class="col-md-3">
	   		<label class="control-label" id="pyramid_slant"></label>
	   </div>
	 </div>
	 
	 <div class="form-group row pyramid">
	   <label class="control-label col-md-1 col-sm-offset-4" for="breadth">Height:</label>
	   <div class="col-md-3">
	   		<label class="control-label" id="pyramid_height"></label>
	   </div>
	 </div>
	 
	 </div>

  </div>
</div>
</body>
</html>