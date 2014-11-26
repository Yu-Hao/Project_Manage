package P2_route.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class importWeatherServlet
 */
@WebServlet("/importWeatherServlet")
public class importWeatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public importWeatherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}
	
	public void init() throws ServletException{
		String resource[] ={ "http://opendata.cwb.gov.tw/opendata/MFC/F-C0032-003.xml","http://opendata.cwb.gov.tw/opendata/MFC/F-C0032-005.xml"};
		//http://opendata.cwb.gov.tw/opendata/MFC/F-C0032-005.xml
		for (int i = 0; i < 2; i++) {
			
			try {
				Thread.sleep(50000);
			} catch (InterruptedException e) {
				
				e.printStackTrace();
			}
			
			P2_route.controller.importWeatherResource gr = new P2_route.controller.importWeatherResource(resource[i],
					"C:\\Project\\Project_workspace\\Project_1\\WebContent\\P2_route\\xml");
			gr.doWork();
		}
		
		
	}
	
	public void destroy(){
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
