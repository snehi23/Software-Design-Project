         function startDemo() {
            canvas = document.getElementById("thecanvas");
            side = document.getElementById("cube_side").value;
            unit = document.getElementById("cube_side_unit").value;
            
            projectX = 100;
            projectY = 100;
            projectZ = 100;
            
                ctx = canvas.getContext("2d");
                ctx.rect(projectX,projectY,projectZ,100);
                ctx.stroke();
                ctx.moveTo(100,100);
                ctx.lineTo(140,70);
                ctx.stroke();
                ctx.moveTo(200,100);
                ctx.lineTo(240,70);
                ctx.stroke();
                ctx.moveTo(140,70);
                ctx.lineTo(240,70);
                ctx.stroke();
                ctx.moveTo(200,200);
                ctx.lineTo(240,160);
                ctx.stroke();
                ctx.moveTo(240,70);
                ctx.lineTo(240,160);
                ctx.stroke();
                ctx.fillText(side+' '+unit,130,220); 
        }
        
        function changeUnit() {
        	
        	var x = document.getElementById("units").value;	
        	startDemo();
        }