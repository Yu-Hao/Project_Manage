package P9_OnlineService.model;

import java.io.IOException;
import java.io.Reader;

import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.spi.JsonProvider;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class StickerDecoder implements Decoder.TextStream<Sticker> {

 @Override
 public Sticker decode(Reader reader) throws DecodeException, IOException {
  //在java要把String的json格式 轉乘 json物件要經過下面先read再轉object
  JsonProvider provider = JsonProvider.provider();
  JsonReader jsonReader = provider.createReader(reader);
  JsonObject jsonSticker = jsonReader.readObject();
  
  System.out.println("action="+jsonSticker.getString("action"));
//  System.out.println("STEP:1-DEC");
  Sticker sticker = new Sticker();  //此時sticker為空的要用 Sticker.java裡的setter來給屬性
  //從前端GET值(action與chat內容)
  if("addChatSvc".equals(jsonSticker.getString("action"))){
//	  System.out.println("進入dec");
	  sticker.setAction(jsonSticker.getString("action"));
	  sticker.setChat(jsonSticker.getString("chat"));
	  System.out.println(jsonSticker.getString("chat"));
  }
  
  
  return sticker;
  
 }

    @Override
    public void init(EndpointConfig ec) {
    }

    @Override
    public void destroy() {
    }
}