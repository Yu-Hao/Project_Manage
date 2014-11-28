package P1_iud.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import P1_iud.model.*;


@WebServlet("/addViewServlet")
//
//啟動檔案上傳的功能：
//1. <form>標籤的 method屬性必須是"post", 而且
//enctype屬性必須是"multipart/form-data"
//注意：enctype屬性的預是值為"application/x-www-form-urlencoded"
//2. 定義可以挑選上傳檔案的表單欄位：
//<input type='file' name='user-defined_name' />
//註: HTTP multipart request: 由Http客戶端(如瀏覽器)所建構的ㄧ種請求，用來
//   同時上傳表單資料與檔案。
//
// what-should-a-multipart-http-request-with-multiple-files-look-like?
// http://stackoverflow.com/questions/913626/what-should-a-multipart-http-request-with-multiple-files-look-like

// 在Servlet 3.0中，若要能夠處理瀏覽器送來的multipart request, Servlet必須
// 以註釋『javax.servlet.annotation.MultipartConfig』來宣告。
// 
// MultipartConfig的屬性說明:
// location: 上傳之表單資料與檔案暫時存放在Server端之路徑。此路徑必須存在。
// fileSizeThreshold: 檔案的大小臨界值，超過此臨界值，上傳檔案會用存放在硬碟，
// 否則存放在主記憶體。
// maxFileSize: 上傳單一檔案的長度限制，如果超過此數值，Container會丟出例外
// maxRequestSize: 上傳所有檔案的長度限制，如果超過此數值，Container會丟出例外
@MultipartConfig(location = "C:\\temp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)

public class addViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		request.setAttribute("ErrMsg", errorMsgs);
		session.setAttribute("successMsg", successMsgs);
		imginfoVO imgVO = new imginfoVO();
		try {
			String imagesID;
			String imagesName;
			String imgDescript;
			Blob imgSrc;
			String images_format;
			
			//
			String viewId = null;
			String viewName = null;
			String viewPlaceSel = null;
			String viewAddr = null;
			String viewLng = null;
			String viewLat = null;
			String pic1 = null;
			String pic2 = null;
			String pic3 = null;
			//
			
			long sizeInBytes1 = 0;
			InputStream is1 = null;
			long sizeInBytes2 = 0;
			InputStream is2 = null;
			long sizeInBytes3 = 0;
			InputStream is3 = null;

			Collection<Part> parts = request.getParts();
			GlobalService.exploreParts(parts, request);
			
			ArrayList img = new ArrayList();
			String pic1ViewPK = null;
			String pic1ImagesPK = null;
			String pic2ImagesPK = null;
			String pic3ImagesPK = null;
			String imgDescript1 = null;
			String imgDescript2 = null;
			String imgDescript3 = null;
			if (parts != null) {   // 如果這是一個上傳資料的表單				
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);
					if (p.getContentType() == null) {
						if (fldName.equals("viewId")) {
							viewId = value;
							if (value == null || viewId.trim().length() == 0) {
								errorMsgs.put("errViewId", "必須輸入景點代號");
							} else {
								request.setAttribute("viewId", viewId);
							}
						} else if (fldName.equals("viewName")) {
							viewName = value;
							if (viewName == null || viewName.trim().length() == 0) {
								errorMsgs.put("errViewName", "必須輸入景點名稱");
							} else {
								request.setAttribute("viewName", viewName);
							}
						} else if (fldName.equals("viewPlaceSel")) {
							viewPlaceSel = value;
							viewPlaceSel = viewPlaceSel.trim();
							if (viewPlaceSel == null || viewPlaceSel.trim().length() == 0) {
								errorMsgs.put("errViewPlaceSel", "必須選擇景點區域");
							} else {
								request.setAttribute("viewPlaceSel", viewPlaceSel);
							}
						} else if (fldName.equals("viewAddr")) {
							viewAddr = value;
							if (viewAddr == null || viewAddr.trim().length() == 0) {
								errorMsgs.put("errViewAddr", "必須輸入地址");
							} else {
								request.setAttribute("viewAddr", viewAddr);
							}
						} else if (fldName.equals("viewLng")) {
							viewLng = value;
							if (viewLng == null || viewLng.trim().length() == 0) {
								errorMsgs.put("errViewLng", "必須景點經度");
							}
							request.setAttribute("viewLng", viewLng);
						}else if (fldName.equals("viewLat")) {
							viewLat = value;
							if (viewLat == null || viewLat.trim().length() == 0) {
								errorMsgs.put("errViewLat", "必須輸入景點緯度");
							}
							request.setAttribute("viewLat", viewLat);
						}else if (fldName.equals("imgDescript1")) {
							imgDescript1 = value;
							if (imgDescript1 == null || imgDescript1.trim().length() == 0) {
								errorMsgs.put("errImgDrscript1", "必須輸入景點說明1");
							}
							request.setAttribute("imgDescript1", imgDescript1);
						}else if (fldName.equals("imgDrscript2")) {
							imgDescript2 = value;
							if (imgDescript2 == null || imgDescript2.trim().length() == 0) {
								errorMsgs.put("errImgDescript2", "必須輸入景點說明2");
							}
							request.setAttribute("imgDescript2", imgDescript2);
						}else if (fldName.equals("imgDescript3")) {
							imgDescript3 = value;
							if (imgDescript3 == null || imgDescript1.trim().length() == 0) {
								errorMsgs.put("errImgDescript3", "必須輸入景點說明3");
							}
							request.setAttribute("imgDescript3", imgDescript3);
						}
					} else {
						pic1 = GlobalService.getFileName(p); // 此為圖片檔的檔名
						pic1ViewPK = pic1.substring(0,(pic1.lastIndexOf("."))-3);
						if (pic1 != null && pic1.trim().length() > 0) {
							pic1ImagesPK = pic1.substring(0,(pic1.lastIndexOf(".")));
							sizeInBytes1 = p.getSize();
							is1 = p.getInputStream();
						} else {
							errorMsgs.put("errPicture", "必須挑選圖片檔");
						}
						pic2 = GlobalService.getFileName(p); // 此為圖片檔的檔名
						if (pic2 != null && pic2.trim().length() > 0) {
							pic2ImagesPK = pic2.substring(0,(pic2.lastIndexOf(".")));
							sizeInBytes2 = p.getSize();
							is2 = p.getInputStream();
						} else {
							errorMsgs.put("errPicture", "必須挑選圖片檔");
						}
						pic3 = GlobalService.getFileName(p); // 此為圖片檔的檔名
						if (pic3 != null && pic3.trim().length() > 0) {
							pic3ImagesPK = pic3.substring(0,(pic3.lastIndexOf(".")));
							sizeInBytes3 = p.getSize();
							is3 = p.getInputStream();
						} else {
							errorMsgs.put("errPicture", "必須挑選圖片檔");
						}
					}
				}
			} else {
				errorMsgs.put("errTitle", "此表單不是上傳檔案的表單");
			}
			
			
			 
//			viewnameService vnSvc = new viewnameService();
//			String successMsg = vnSvc.insert(viewId,viewName,viewPlaceSel,viewAddr,viewLng,viewLat);
//			System.out.println("successMsg = " + successMsg);
//			
//			System.out.println("pic1ImagesPK= "+pic1ImagesPK+","+"viewId= "+viewId);
//			imginfoService imgSvc = new imginfoService();
//			String successImagesMsg = imgSvc.insertImg(pic1ImagesPK,viewId,imgDescript1,is1,sizeInBytes1,"jpg");
//			System.out.println("pic1 = "+ successImagesMsg);
//			System.out.println("pic2ImagesPK= "+pic2ImagesPK+","+"viewId= "+viewId);
//			successImagesMsg = imgSvc.insertImg(pic2ImagesPK,viewId,imgDescript2,is2,sizeInBytes2,"jpg");
//			System.out.println("pic2 = "+ successImagesMsg);
//			System.out.println("pic3ImagesPK= "+pic3ImagesPK+","+"viewId= "+viewId);
//			successImagesMsg = imgSvc.insertImg(pic3ImagesPK,viewId,imgDescript3,is3,sizeInBytes3,"jpg");
//			System.out.println("pic3 = "+ successImagesMsg);
//			
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher rd = request
//						.getRequestDispatcher("addView.jsp");
//				rd.forward(request, response);
//				return;
//			}
			
			response.sendRedirect(response.encodeRedirectURL("addView.jsp"));
			return;
		} catch (Exception e) {
			e.printStackTrace();
			errorMsgs.put("Exception", e.getMessage());
			RequestDispatcher rd = request
					.getRequestDispatcher("addView.jsp");
			rd.forward(request, response);
		}
	}

}