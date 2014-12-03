package P5_index.model;

import java.util.List;

public interface newsDAO_interface {
	
	public String getAllNewsJSON();
	public newsVO getOne(String newsID);
	public List<newsVO> getAll();
	public int insertNews(newsVO nsVO);
	public int updateNews(newsVO nsVO);
	public void deleteNews(String news_identity);
}
