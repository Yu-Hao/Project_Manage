package P1_iud.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import P1_iud.model.*;

/**
 * Servlet implementation class updateServlet
 */
@WebServlet("/P1_iud/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		
		if("updateViewName".equals(name)){
			HttpSession sion = request.getSession();
			String id = request.getParameter("id");
			viewnameService vnSvc = new viewnameService();
			viewnameVO vnVO = vnSvc.getOne(id);
			sion.setAttribute("vnVO", vnVO);
			response.sendRedirect("updateView.jsp");
			return;
		}
		
		if("updateKnowledge".equals(name)){
			HttpSession sion = request.getSession();
			String id = request.getParameter("id");
			sion.setAttribute("id", id);
			response.sendRedirect("knowledge_Manage/updateKnowledge.jsp");
			return;
		}
		
		if("updateNews".equals(name)){
			HttpSession sion = request.getSession();
			String id = request.getParameter("id");
			sion.setAttribute("id", id);
			response.sendRedirect("news_Manage/updateNews.jsp");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
