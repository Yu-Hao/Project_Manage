package P2_route.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class importWeatherResource {
	String resource;
	String imageFolder;

	public importWeatherResource(String resource, String imageFolder) {
		super();
		this.resource = resource;
		this.imageFolder = imageFolder;
		File dir = new File(imageFolder);
		if (!dir.exists()){
			dir.mkdirs();
		}		
	}
    public void doWork(){
    	int idx = resource.lastIndexOf("/");
		String filename = resource.substring(idx + 1);
		File file = new File(imageFolder, filename);
		//File file = new File()
		InputStream is = null;
		FileOutputStream fos = null;
		try {
			URL url = new URL(resource);
			is = url.openStream();
			fos = new FileOutputStream(file);
			byte[] b = new byte[8192];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				fos.write(b, 0, len);
			}
			System.out.println(filename + " 讀取完畢!!!");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
    }
}
