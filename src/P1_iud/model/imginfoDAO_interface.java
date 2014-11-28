package P1_iud.model;

import java.io.InputStream;

public interface imginfoDAO_interface {
    public String insertImg(String imagesID,String imagesName,String imgDescript, InputStream is, long size,String images_format);
}
