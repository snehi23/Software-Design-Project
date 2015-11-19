<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cube Display</title>

<script src="show.js"> </script>
    
</head>
<body onLoad="startDemo()">

<canvas id="thecanvas" width="400" height="400">
        Your browser does not support the HTML5 canvas element.               
</canvas>

<br>
<div id="show">
	Cube Side  	 : ${cube_side}
<br>
	Cube Volume  : ${cube_volume} 
	
<input type="hidden" id="cube_side" value="${cube_side}">
<input type="hidden" id="cube_side_unit" value="${cube_side_unit}">

<a href="default.jsp">Back</a>

</div>

</body>
</html>