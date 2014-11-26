package P4_MessageBoard.model;

import java.util.List;

public interface MsgDAO_interface {
	public void insert(MsgVO msgVO);//留言
	public List<MsgVO> getAll();
	public void insert2(MsgVO msgVO); //回應留言

}
