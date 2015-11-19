

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CalController")
public class CalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = null;
		
			String length = request.getParameter("given_length");
			String breadth = request.getParameter("given_breadth");
			String height = request.getParameter("given_height");
			
			String unit = request.getParameter("units");
			
			Double length_in_integer = Double.parseDouble(length);
			Double breadth_in_integer = Double.parseDouble(breadth);
			Double height_in_integer = Double.parseDouble(height);
			
			Double L = convert(length_in_integer,unit);
			Double B = convert(breadth_in_integer,unit);
			Double H = convert(height_in_integer,unit);
			
			Double cube_side = ( L + 8 * H + 8 * B ) / 12 ;
				
			Double cube_volume = (cube_side * cube_side * cube_side) ;
				
			request.setAttribute("cube_side",cube_side);
				
			request.setAttribute("cube_side_unit",unit);
				
			request.setAttribute("cube_volume",cube_volume);	
		
		rd = request.getRequestDispatcher("/display.jsp");
		
		rd.forward(request, response);
		
	}
	
	Double convert(Double length,String unit) {
		
		if(unit.equals("centimeters"))
			length = length / 100;
		
		if(unit.equals("inches"))
			length = length / 39.37;
		
		if(unit.equals("yards"))
			length = length / 1.09361;	
		
		return length;
	}

}
