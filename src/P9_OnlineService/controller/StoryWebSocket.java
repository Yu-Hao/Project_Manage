package P9_OnlineService.controller;


import java.io.*; 
import java.util.*; 

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;

import P4_MessageBoard.model.FrdService;
import P9_OnlineService.model.OnlineServiceService;
import P9_OnlineService.model.Sticker;
import P9_OnlineService.model.StickerDecoder;
import P9_OnlineService.model.StickerEncoder;


@ServerEndpoint(
	    value = "/P9_OnlineService/service/notifications/{username}", 
	    encoders = {P9_OnlineService.model.StickerEncoder.class}, 
	    decoders = {P9_OnlineService.model.StickerDecoder.class}) 
	 



public class StoryWebSocket {
	//此WebSocket，僅開放3個協作平台。
	private static final List<Sticker> stickers1 = Collections.synchronizedList(new LinkedList<Sticker>()); 
	private static final List<Sticker> stickers2 = Collections.synchronizedList(new LinkedList<Sticker>()); 	
	private static final List<Sticker> stickers3 = Collections.synchronizedList(new LinkedList<Sticker>()); 	
	
	private static final Set<Session> sessions1 = Collections.synchronizedSet(new HashSet<Session>()); 
	private static final Set<Session> sessions2 = Collections.synchronizedSet(new HashSet<Session>());
	private static final Set<Session> sessions3 = Collections.synchronizedSet(new HashSet<Session>());
	
	
	private static final HashMap<String, Set<Session>> sessionMap = new HashMap<String, Set<Session>>();
	private static final HashMap<String, List<Sticker>> stickerMap = new HashMap<String, List<Sticker>>();

	Set<Session> sessionSet = Collections.synchronizedSet(new HashSet<Session>());
	List<Sticker> stickerSet = Collections.synchronizedList(new LinkedList<Sticker>()); 
	
	
	@OnMessage
	   public void onMessage(Session session, Sticker sticker) {
		System.out.println("in Message"); 
		
		stickerSet.add(sticker); 
	      for (Session openSession : sessionSet) { 
	         try { 
	            openSession.getBasicRemote().sendObject(sticker); //廣播出去
	         } catch (IOException | EncodeException ex) { 
	        	 sessionSet.remove(openSession); 
	         } 
	      } 
	   } 
	   
	
	 @OnOpen
	   public void onOpen(Session session, @PathParam("username") String userName) throws IOException, EncodeException { 
	     //System.out.println("in Open");
		 System.out.println("user = "+userName);
	     if(!sessionMap.containsKey(userName)){
	    	 //此會員沒有開過協做平台
	    	 allocateResource(userName); 
	     }else{
	    	//此會員已開放協做平台，其他會員好友登入此平台
	    	 //System.out.println("Key already exist");
	    	 sessionSet = sessionMap.get(userName);
	    	 stickerSet = stickerMap.get(userName);
	     }	     	     
	      sessionSet.add(session); 
	      for (Sticker sticker : stickerSet) { 
	         session.getBasicRemote().sendObject(sticker); 
	      } 
	    } 

	 	
	 
	   @OnClose
	   public void onClose(Session session, @PathParam("username") String userName) throws IOException, EncodeException { 
		   System.out.println("in close"); 
		   System.out.println("userName"+userName);
		   sessionSet.remove(session);
		   
		   //判別size因為客服一次就是2個人，若小於2個人就是有人離開了，就去做資料庫欄位改成"null"
		  if(sessionSet.size()<2){
			  
			  stickerSet.clear();
			  sessionMap.remove(userName);
			  stickerMap.remove(userName);
			  OnlineServiceService onlineServiceSvc =new OnlineServiceService();
			  onlineServiceSvc.updateNull(userName);
			  
		  }
		   
		   
		   
		   if(sessionSet.isEmpty()){
			   //Clear all message when sessions has no connections.
			   stickerSet.clear();
			   sessionMap.remove(userName);
			   stickerMap.remove(userName);
			   //Clear cooperation_friend state which was userName.
//			   FrdService frdSrv = new FrdService();
//			   frdSrv.clearCoNotify(userName);
		   }
	   } 

	   public void allocateResource(String userName){
			//System.out.println("in allocateResource");
		if(sessions1.isEmpty()){
			System.out.println("sessions1 isEmpty");
			sessionMap.put(userName, sessions1);
			stickerMap.put(userName, stickers1);
			sessionSet = sessions1;
			stickerSet = stickers1;
		}else if(sessions2.isEmpty()){
			System.out.println("sessions2 isEmpty");
			sessionMap.put(userName, sessions2);
			stickerMap.put(userName, stickers2);
			sessionSet = sessions2;
			stickerSet = stickers2;
		}else if(sessions3.isEmpty()){
			System.out.println("sessions3 isEmpty");
			sessionMap.put(userName, sessions3);
			stickerMap.put(userName, stickers3);
			sessionSet = sessions3;
			stickerSet = stickers3;
		}else{
			System.out.println("No resource!");
		}
	}
}

