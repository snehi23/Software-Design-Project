

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

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
        
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
			Map<String, String[]> input = request.getParameterMap();
			JSONObject unit_wise_cases = new JSONObject();
		
			String length = Arrays.asList(input.get("length")).get(0);
			String breadth = Arrays.asList(input.get("breadth")).get(0);
			String height = Arrays.asList(input.get("height")).get(0);
			String unit = Arrays.asList(input.get("unit")).get(0);
			String shape = Arrays.asList(input.get("shape")).get(0);
			
			Double length_in_integer = Double.parseDouble(length);
			Double breadth_in_integer = Double.parseDouble(breadth);
			Double height_in_integer = Double.parseDouble(height);
			
			double[] Diamensions = converter(unit);	
			Map<String, Double> perUnitValues = new HashMap<String, Double>();
			perUnitValues = perUnitValuesCalculator(Diamensions, unit);	
			
			unit_wise_cases = allUnitsPerShapeCalculator(length_in_integer,breadth_in_integer,
					height_in_integer,perUnitValues,unit,shape);
						
			response.setContentType("application/json");
			response.getWriter().write(unit_wise_cases.toString());
		
	}
	
	double[] converter(String unit) {
		
		if ("meters".equals(unit))
			return new double[]{100,39.37,1.09361};
			
		if ("centimeters".equals(unit)) 
			return new double[]{0.393701,0.0109361,0.01};
			
		if ("inches".equals(unit))
			return new double[]{0.0277778,0.0254,2.54};
			
		if ("yards".equals(unit))
			return new double[]{0.9144,91.44,36};
		
		return new double[]{};	
		
	}
	
	Double roundValue(Double a) {
		return (double) Math.round( a * 100.0) / 100.0;	
	}
	
	JSONObject processCube(Double L, Double B, Double H) {
		
		Double cube_side = roundValue(( L + 8 * H + 8 * B ) / 12);
		Double cube_volume = roundValue((cube_side * cube_side * cube_side));
		return buildCubeJSON(L,B,H,cube_side,cube_volume);			
		
	}
	
	JSONObject processRP(Double L, Double B, Double H) {
		
		Double rp_side = roundValue(L / 8);
		Double rp_volume = roundValue((rp_side * rp_side * rp_side) / (3 * Math.sqrt(2)) );
		Double rp_height = roundValue(rp_side / Math.sqrt(2));
		return buildRPJSON(L,B,H,rp_side,rp_volume,rp_height);			
		
	}
	
	JSONObject processTP(Double L, Double B, Double H) {
		
		Double tp_side = roundValue(L / 6);
		Double tp_volume = roundValue((tp_side * tp_side * tp_side) / (6 * Math.sqrt(2)) );
		Double tp_height = roundValue((Math.sqrt(2) * tp_side) / Math.sqrt(3));
		return buildTPJSON(L,B,H,tp_side,tp_volume,tp_height);			
		
	}
	
	JSONObject buildCubeJSON(Double L, Double B, Double H, Double cube_side, Double cube_volume) {
		
		JSONObject cube_cases = new JSONObject();
		
		JSONArray cube_lengths = new JSONArray();
		cube_lengths.put(roundValue(cube_side));
		cube_lengths.put(roundValue(cube_side - 2*B));
		cube_lengths.put(roundValue(cube_side - 2*H));	
		
		JSONObject cube_info = new JSONObject();
		cube_info.put("max_length", cube_side);
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case1",cube_info);
		
		cube_lengths = new JSONArray();

		cube_lengths.put(roundValue(cube_side - B));
		cube_lengths.put(roundValue(cube_side - 2*H));	
		
		cube_info = new JSONObject();
		cube_info.put("max_length", cube_side);
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case2",cube_info);
		
		cube_lengths = new JSONArray();
		cube_lengths.put(roundValue(cube_side));
		cube_lengths.put(roundValue(cube_side - 2*H));
		cube_lengths.put(roundValue(cube_side - 2*B));	
		
		cube_info = new JSONObject();
		cube_info.put("max_length", cube_side);
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case3",cube_info);
		
		cube_lengths = new JSONArray();
		cube_lengths.put(roundValue(cube_side - H));
		cube_lengths.put(roundValue(cube_side - 2*B));	
		
		cube_info = new JSONObject();
		cube_info.put("max_length", cube_side);
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case4",cube_info);
		cube_cases.put("volume", cube_volume);
		
		return cube_cases;
		
	}
	
	JSONObject buildRPJSON(Double L, Double B, Double H, Double cube_side, Double cube_volume, Double rp_height) {
		
		JSONObject cube_cases = new JSONObject();
		
		JSONArray cube_lengths = new JSONArray();
		cube_lengths.put(roundValue(cube_side));
		cube_lengths.put(roundValue(cube_side - 2*B));
		
		JSONObject cube_info = new JSONObject();
		cube_info.put("max_length", cube_side);
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case1",cube_info);
		
		cube_lengths = new JSONArray();

		cube_lengths.put(roundValue(cube_side));
		cube_lengths.put(roundValue(cube_side - 2*H));	
		
		cube_info = new JSONObject();
		cube_info.put("max_length", cube_side);
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case2",cube_info);
		
		cube_lengths = new JSONArray();
		cube_lengths.put(roundValue(cube_side));
		cube_lengths.put(roundValue(cube_side - B));
		
		
		cube_info = new JSONObject();
		cube_info.put("max_length", cube_side);
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case3",cube_info);
		
		cube_lengths = new JSONArray();
		cube_lengths.put(roundValue(cube_side));
		cube_lengths.put(roundValue(cube_side - H));
		
		cube_info = new JSONObject();
		cube_info.put("max_length", cube_side);
		cube_info.put("length", cube_lengths);
		cube_info.put("breadth", B);
		cube_info.put("height", H);
					
		cube_cases.put("case4",cube_info);
		cube_cases.put("volume",cube_volume);
		cube_cases.put("pyramid_height", rp_height);
		
		return cube_cases;
		
	}
	
	JSONObject buildTPJSON(Double L, Double B, Double H, Double cube_side, Double cube_volume, Double tp_height) {
		
		JSONObject cube_cases = new JSONObject();
		cube_cases.put("max_length", cube_side);
		cube_cases.put("length",cube_side);
		cube_cases.put("breadth",B);
		cube_cases.put("height",H);
		cube_cases.put("volume",cube_volume);
		cube_cases.put("pyramid_height", tp_height);
		
		return cube_cases;
		
	}
	
	Map<String, Double> perUnitValuesCalculator(double[] Diamensions, String unit) {
	
		Map<String, Double> perUnitValues = new HashMap<String, Double>();
		
		if ("meters".equals(unit)) {
			perUnitValues.put("centimeters", Diamensions[0]);
			perUnitValues.put("inches", Diamensions[1]);
			perUnitValues.put("yards", Diamensions[2]);
		}
		
		if ("centimeters".equals(unit)) {
			perUnitValues.put("inches", Diamensions[0]);
			perUnitValues.put("yards", Diamensions[1]);
			perUnitValues.put("meters", Diamensions[2]);
		}
		
		if ("inches".equals(unit)) {
			perUnitValues.put("yards", Diamensions[0]);
			perUnitValues.put("meters", Diamensions[1]);
			perUnitValues.put("centimeters", Diamensions[2]);
		}
		
		if ("yards".equals(unit)) {
			perUnitValues.put("meters", Diamensions[0]);
			perUnitValues.put("centimeters", Diamensions[1]);
			perUnitValues.put("inches", Diamensions[2]);
		}
		
		return perUnitValues;
	}
	
	JSONObject allUnitsPerShapeCalculator(Double length_in_integer,Double breadth_in_integer,
			Double height_in_integer,Map<String, Double> perUnitValues,String unit,String shape) {
		
		JSONObject cases = new JSONObject();
		JSONObject unit_wise_cases = new JSONObject();
					
		if ("Cube".equals(shape)) {
			
			cases = processCube(length_in_integer,breadth_in_integer,height_in_integer);
			unit_wise_cases.put(unit, cases);
			
			Iterator<Entry<String, Double>> it = perUnitValues.entrySet().iterator();
			
			while(it.hasNext()) {
				
				Map.Entry pair = (Map.Entry)it.next();
				cases = processCube(length_in_integer * (Double)pair.getValue(),
						breadth_in_integer * (Double)pair.getValue(),height_in_integer * (Double)pair.getValue());
				unit_wise_cases.put((String) pair.getKey(), cases);
			}
		}
		else if("Rectangular Pyramid".equals(shape)) {
			
			cases = processRP(length_in_integer,breadth_in_integer,height_in_integer);
			unit_wise_cases.put(unit, cases);
			
			Iterator<Entry<String, Double>> it = perUnitValues.entrySet().iterator();
			
			while(it.hasNext()) {
				
				Map.Entry pair = (Map.Entry)it.next();
				cases = processRP(length_in_integer * (Double)pair.getValue(),
						breadth_in_integer * (Double)pair.getValue(),height_in_integer * (Double)pair.getValue());
				unit_wise_cases.put((String) pair.getKey(), cases);
			}
		}
		else if("Triangular Pyramid".equals(shape)) {
			
			cases = processTP(length_in_integer,breadth_in_integer,height_in_integer);
			unit_wise_cases.put(unit, cases);
			
			Iterator<Entry<String, Double>> it = perUnitValues.entrySet().iterator();
			
			while(it.hasNext()) {
				
				Map.Entry pair = (Map.Entry)it.next();
				cases = processTP(length_in_integer * (Double)pair.getValue(),
						breadth_in_integer * (Double)pair.getValue(),height_in_integer * (Double)pair.getValue());
				unit_wise_cases.put((String) pair.getKey(), cases);
			}
		}
		
		return unit_wise_cases;
	}

}
