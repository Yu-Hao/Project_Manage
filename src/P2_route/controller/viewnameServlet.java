package P2_route.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import P2_route.model.*;

/**
 * Servlet implementation class viewnameServlet
 */
@WebServlet("/P2_route/viewnameServlet")
public class viewnameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		if("GetRouteDetail".equals(action)){
			Integer routeID = Integer.parseInt(request.getParameter("routeID"));
			viewnameService vnService = new viewnameService();
			String routeName = vnService.getRouteNameByRouteID(routeID);
			String routeOrder = vnService.getRouteOrderByRouteID(routeID);
			//System.out.println(routeOrder);
			
			try {
				JSONArray routeJSONArray = new JSONArray(routeOrder);
				List<JSONObject> routeJSONObj = new ArrayList<JSONObject>();
				
				
				for(int i=0; i< routeJSONArray.length(); i++){
					routeJSONObj.add(routeJSONArray.getJSONObject(i));
				}
				String viewDetailArray ="{\"routeName\":\"" + routeName + "\",\"views\":[";
				for(int i=0; i< routeJSONObj.size(); i++){
					//System.out.println(routeJSONObj.get(i).get("RouteViewOrder"));
					//System.out.println(routeJSONObj.get(i).get("viewID"));
					String viewID = routeJSONObj.get(i).get("viewID").toString();
					String viewDetail = vnService.getViewDetailByViewID(viewID);
					//System.out.println("viewDetail= "+ viewDetail);
					if(i!= routeJSONObj.size()-1){
						viewDetail+=",";
					}
					viewDetailArray += viewDetail;
				}
				viewDetailArray += "]}";
				//System.out.println(viewDetailArray);
				//out.println(viewDetailArray);
				
				request.setAttribute("viewDetails", viewDetailArray);
				//轉頁到 會員路線
				String url = "route_memRouteDetail.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);			
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		
		if("increaseHitRate".equals(action)){
			String routeResultJSONStr = request.getParameter("routeResult");
			try {
				JSONArray routeJSONObjArray = new JSONArray(routeResultJSONStr);
				System.out.println(routeJSONObjArray);
				
				List<String> routeResultArray = new ArrayList<String>();
				for(int i=0; i< routeJSONObjArray.length(); i++){
					routeResultArray.add(routeJSONObjArray.getString(i));
				}
				
				viewnameService vnService = new viewnameService();
				
				
				for(int i=0; i < routeResultArray.size(); i++){
					String routeResultView = routeResultArray.get(i);
					int hitRate = vnService.getHitRate(routeResultView);
					//System.out.println("routeResultView= "+routeResultView +", hitRate= "+hitRate);
					hitRate++;
					//System.out.println("hitRateAfter="+hitRate);
					vnService.increaseHitRate(routeResultView, hitRate);
				}
				
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		
		if("saveRoute".equals(action)){
			String routeJSONStr = request.getParameter("routeJSONStr");
			System.out.println(routeJSONStr);
			try {
				JSONObject routeJSONObj = new JSONObject(routeJSONStr);
				String memID = routeJSONObj.get("memID").toString();
				String routeName = routeJSONObj.get("routeName").toString();
				JSONArray routeResult = (JSONArray)routeJSONObj.get("routeResult");
				
				List<String> routeResultArray = new ArrayList<String>();
				for(int i=0; i< routeResult.length(); i++){
					routeResultArray.add(routeResult.getString(i));
				}
				
				java.sql.Date buildTime = new java.sql.Date(new java.util.Date().getTime());
				
				
				viewnameService vnService = new viewnameService();
				Integer routeID = vnService.insertRouteByID(memID, routeName, buildTime);
				
				String status="";
				if(routeID!=0){
					for(int i=0; i < routeResultArray.size(); i++){
						String routeResultView = routeResultArray.get(i);
						//i -> routeResultViewOrder
						//System.out.println("routeResultView = " + routeResultView + ", routeResultViewOrder = " + i);
						status = vnService.insertRouteViewByRouteID(routeID, routeResultView, i+1);
					}
				}
				if("success".equals(status)){
					out.println("success");
				}else{
					out.println("fail");
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		
		if("GetRouteByMemID".equals(action)){
			String memID = request.getParameter("memID");
			viewnameService vnService = new viewnameService();
			String memRoute = vnService.getRouteByMemID(memID);
			//out.println(memRoute);
			request.setAttribute("memRoute", memRoute);
			//轉頁到 會員路線
			String url = "route_memberRoute.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);			
		}
		
		if("GetRouteOrderByRouteID".equals(action)){
			Integer routeID = Integer.parseInt(request.getParameter("routeID"));
			viewnameService vnService = new viewnameService();
			String routeOrder = vnService.getRouteOrderByRouteID(routeID);
			out.println(routeOrder);
		}
		
		if("DeleteRouteByRouteID".equals(action)){
			Integer routeID = Integer.parseInt(request.getParameter("routeID"));
			viewnameService vnService = new viewnameService();
			String status = vnService.deleteRouteByID(routeID);
			out.println(status);
		}
		
		if("GetRouteFisrtByRouteID".equals(action)){
			Integer routeID = Integer.parseInt(request.getParameter("routeID"));
			viewnameService vnService = new viewnameService();
			String routeFisrt = vnService.getRouteFisrtByRouteID(routeID);
			out.println(routeFisrt);
		}
		
		if("GetLatlngById".equals(action)){
			String viewID = request.getParameter("viewID");
			
			viewnameService vnService = new viewnameService();
			String viewLatlng = vnService.getViewLatlng(viewID);
			out.println(viewLatlng);
		}
		
		if("GetAllByArea".equals(action)){
			String area = request.getParameter("area");
			
			viewnameService vnService = new viewnameService();
			String viewnames = vnService.getAllJSON(area);
			out.println(viewnames);
		}
		
		if("north".equals(action)||"central".equals(action)||"south".equals(action)||"east".equals(action)){
			String weekWeather[]= request.getParameterValues("actionW");
			String path = getServletContext().getContextPath();
			switch(action){
				case "north": request.setAttribute("area", "北部");break;
				case "central": request.setAttribute("area", "中部");break;
				case "south": request.setAttribute("area", "南部");break;
				case "east": request.setAttribute("area", "東部");break;
			}
			request.setAttribute("path", path);
			request.setAttribute("listWeather", weekWeather);
			RequestDispatcher successView = request.getRequestDispatcher("/P2_route/route_dragdrop.jsp");
			successView.forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
