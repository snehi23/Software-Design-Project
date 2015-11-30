		function case1_top() {
			
			var c = document.getElementById("case1_top");
			var ctx = c.getContext("2d");
			
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();
			
			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(100,20);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();
			
			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();
			
			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,20);
			ctx.moveTo(40,100);
			ctx.lineTo(40,120);
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#000000";
			ctx.fillText("Top View",130,60);
			ctx.stroke();
		}
		
		function case1_front() {
			
			var c = document.getElementById("case1_front");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(120,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(20,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.fillText("Front View",130,60);
			ctx.stroke();

		}
		
		function case1_side() {
			
			var c = document.getElementById("case1_side");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(120,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(20,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,20);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,20);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(40,120);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(100,120);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.fillText("Side View",130,60);
			ctx.stroke();

		}
		
		function case2_top() {
			
			var c = document.getElementById("case2_top");
			var ctx = c.getContext("2d");
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,20);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,20);
			ctx.moveTo(40,100);
			ctx.lineTo(40,120);
			ctx.moveTo(100,100);
			ctx.lineTo(100,120);
			ctx.strokeStyle="#000000";
			ctx.fillText("Top View",130,60);
			ctx.stroke();
		}
		
		function case2_front() {
			
			var c = document.getElementById("case2_front");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(120,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(20,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.fillText("Front View",130,60);
			ctx.stroke();

		}
		
		function case2_side() {
			
			var c = document.getElementById("case2_side");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(120,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(20,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,20);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,20);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(40,120);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(100,120);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.fillText("Side View",130,60);
			ctx.stroke();

		}
		
		function case3_top() {
			
			var c = document.getElementById("case3_top");
			var ctx = c.getContext("2d");
			
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();
			
			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(100,20);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();
			
			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();
			
			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,20);
			ctx.moveTo(40,100);
			ctx.lineTo(40,120);
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#000000";
			ctx.fillText("Top View",130,60);
			ctx.stroke();
		}
		
		function case3_front() {
			
			var c = document.getElementById("case3_front");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(120,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(20,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.fillText("Front View",130,60);
			ctx.stroke();

		}
		
		function case3_side() {
			
			var c = document.getElementById("case3_side");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(120,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(20,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,20);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,20);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(40,120);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(100,120);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.fillText("Side View",130,60);
			ctx.stroke();

		}
		
		function case4_top() {
			
			var c = document.getElementById("case4_top");
			var ctx = c.getContext("2d");
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,20);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,20);
			ctx.moveTo(40,100);
			ctx.lineTo(40,120);
			ctx.moveTo(100,100);
			ctx.lineTo(100,120);
			ctx.strokeStyle="#000000";
			ctx.fillText("Top View",130,60);
			ctx.stroke();
		}
		
		function case4_front() {
			
			var c = document.getElementById("case4_front");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(120,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(20,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.fillText("Front View",130,60);
			ctx.stroke();

		}
		
		function case4_side() {
			
			var c = document.getElementById("case4_side");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.rect(20, 20, 100, 100);
			ctx.rect(40, 40, 60, 60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(20,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(120,40);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(20,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,20);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,40);
			ctx.lineTo(100,20);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,100);
			ctx.lineTo(40,120);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(100,120);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(100,100);
			ctx.lineTo(120,100);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(40,40);
			ctx.lineTo(40,100);
			ctx.strokeStyle="#00FF00";
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(120,20);
			ctx.lineTo(120,120);
			ctx.strokeStyle="#0000FF";
			ctx.fillText("Side View",130,60);
			ctx.stroke();

		}
		
		function case9_top() {
			
			var c = document.getElementById("case9_top");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.moveTo(75,0);
			ctx.lineTo(150,100);
			ctx.lineTo(0,100);
			ctx.closePath();
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(75,20);
			ctx.lineTo(130,90);
			ctx.lineTo(20,90);
			ctx.closePath();
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(75,0);
			ctx.lineTo(75,60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(0,100);
			ctx.lineTo(75,60);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(150,100);
			ctx.lineTo(75,60);
			ctx.strokeStyle="#FF0000";
			ctx.fillText("Top View",130,60);
			ctx.stroke();
		}
		
		function case9_front() {
			
			var c = document.getElementById("case9_front");
			var ctx = c.getContext("2d");
			
			ctx.strokeStyle="#000000";
			ctx.beginPath();
			ctx.moveTo(75,0);
			ctx.lineTo(150,100);
			ctx.lineTo(0,100);
			ctx.closePath();
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(75,20);
			ctx.lineTo(130,90);
			ctx.lineTo(20,90);
			ctx.closePath();
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(75,0);
			ctx.lineTo(75,20);
			ctx.stroke();

			ctx.beginPath();
			ctx.moveTo(0,100);
			ctx.lineTo(20,90);
			ctx.stroke();
			
			ctx.beginPath();
			ctx.moveTo(150,100);
			ctx.lineTo(130,90);
			ctx.fillText("Front View",130,60);
			ctx.stroke();
			
			ctx.beginPath();
			ctx.moveTo(75,0);
			ctx.lineTo(150,100);
			ctx.strokeStyle="#FF0000";
			ctx.stroke();

		}
		