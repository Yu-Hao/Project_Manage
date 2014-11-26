package P1_iud.model;

import java.util.*;

public interface MemberDAO_interface {
    public void insert(MemberVO memVO);
    public void update(MemberVO memVO);
    public void delete(String member_loginID);
   
    public MemberVO findByPrimaryKey(String member_loginID);
    public List<MemberVO> getAll();
    public String memeber_Count();
}
