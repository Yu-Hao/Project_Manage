package P1_iud.model;

import java.util.List;

public interface viewnameDAO_interface {
	public String insert(viewnameVO vnVO);
	public List<viewnameVO> getAll();
	public viewnameVO updateOne(String id);
}
