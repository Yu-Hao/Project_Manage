package P4_MessageBoard.model;

import java.util.List;

public interface MemDAO_interface {
	public List<MemVO> getAll(String query_string);
	public String getAllJSON(String query_string);

}
