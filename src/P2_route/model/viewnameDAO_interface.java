package P2_route.model;

import java.util.List;

public interface viewnameDAO_interface {
	public void insert(viewnameVO vnVO);
    public void update(viewnameVO vnVO);
    public void delete(Integer empno);
    public viewnameVO findByPrimaryKey(Integer viewID);
    public List<viewnameVO> getAll();
    public String getAllJSON(String viewArea);
    public Integer insertRouteByID(String memID, String routeName, java.sql.Date buildTime);
    public String insertRouteViewByRouteID(Integer routeID, String routeResultView, Integer routeResultViewOrder);
    public String getImgTop6();
    public String getImgCount();
    public String getViewLatlng(String viewID);
    public String getRouteByMemID(String memID);
    public String getRouteOrderByRouteID(Integer routeID);
    public String getRouteFisrtByRouteID(Integer routeID);
    public String deleteRouteByID(Integer routeID);
    public String getRouteNameByRouteID(Integer routeID);
    public Integer increaseHitRate(String routeResultView, Integer hitRate);
    public Integer getHitRate(String routeResultView);
    public String getViewDetailByViewID(String viewID);
   
}
