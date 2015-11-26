

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;


@WebServlet("/VolCalController")
public class VolCalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Map<String, String[]> input = request.getParameterMap();
		
			String length = Arrays.asList(input.get("length")).get(0);
			String breadth = Arrays.asList(input.get("breadth")).get(0);
			String height = Arrays.asList(input.get("height")).get(0);
			String unit = Arrays.asList(input.get("unit")).get(0);
			String shape = Arrays.asList(input.get("shape")).get(0);
			
			Double length_in_integer = Double.parseDouble(length);
			Double breadth_in_integer = Double.parseDouble(breadth);
			Double height_in_integer = Double.parseDouble(height);
			
			Double L = convert(length_in_integer,unit);
			Double B = convert(breadth_in_integer,unit);
			Double H = convert(height_in_integer,unit);
			
			JSONObject cube_cases = new JSONObject();
			
			if ("Cube".equals(shape))
				cube_cases = processCube(L,B,H);
			
			response.setContentType("application/json");
			response.getWriter().write(cube_cases.toString());
		
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
	
	Double roundValue(Double a) {
		return (double) Math.round( a * 100.0) / 100.0;	
	}
	
	JSONObject buildCubeJSON(Double L, Double B, Double H, Double cube_side, Double cube_volume) {
		
		JSONObject cube_cases = new JSONObject();
		
		JSONArray cube_lengths = new JSONArray();
		cube_lengths.put(cube_side);
		cube_lengths.put(cube_side - 2*B);
		cube_lengths.put(cube_side - 2*H);	
		
		JSONObject cube_info = new JSONObject();
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case1",cube_info);
		
		cube_lengths = new JSONArray();

		cube_lengths.put(cube_side - B);
		cube_lengths.put(cube_side - 2*H);	
		
		cube_info = new JSONObject();
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case2",cube_info);
		
		cube_lengths = new JSONArray();
		cube_lengths.put(cube_side);
		cube_lengths.put(cube_side - 2*H);
		cube_lengths.put(cube_side - 2*B);	
		
		cube_info = new JSONObject();
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case3",cube_info);
		
		cube_lengths = new JSONArray();
		cube_lengths.put(cube_side - H);
		cube_lengths.put(cube_side - 2*B);	
		
		cube_info = new JSONObject();
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case4",cube_info);
		cube_cases.put("volume", cube_volume);
		
		return cube_cases;
		
	}
	
	JSONObject processCube(Double L, Double B, Double H) {
		
		Double cube_side = roundValue(( L + 8 * H + 8 * B ) / 12);
		Double cube_volume = roundValue((cube_side * cube_side * cube_side));
		return buildCubeJSON(L,B,H,cube_side,cube_volume);			
		
	}

}
