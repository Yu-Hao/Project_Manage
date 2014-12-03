package P5_index.model;

import java.sql.Date;
import java.util.List;


public class newsService {

	private newsDAO_interface dao;

	public newsService() {
		dao = new newsDAO();
	}
	
	public String getAllNewsJSON() {
		return dao.getAllNewsJSON();
	}
	
	public newsVO getOne(String newsID) {
		return dao.getOne(newsID);
	}
	
	public List<newsVO> getAll() {
		return dao.getAll();
	}
	public void deleteNews(String news_identity) {
		dao.deleteNews(news_identity);
	}
	public int insertNews(Date news_date,String news_title,
								String news_image, String news_Content) {
		newsVO nsVO = new newsVO();
		nsVO.setNews_date(news_date);
		nsVO.setNews_title(news_title);
		nsVO.setNews_image(news_image);
		nsVO.setNews_Content(news_Content);
		return  dao.insertNews(nsVO);
	}

	public int updateNews(Date news_date,String news_title,
			String news_image, String news_Content ,String newsIdendity) {
		
			newsVO nsVO = new newsVO();
			nsVO.setNews_date(news_date);
			nsVO.setNews_title(news_title);
			nsVO.setNews_image(news_image);
			nsVO.setNews_Content(news_Content);
			nsVO.setNews_identity(newsIdendity);
			return  dao.updateNews(nsVO);
	};
}
