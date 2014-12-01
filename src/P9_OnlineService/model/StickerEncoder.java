package P9_OnlineService.model;

import java.io.IOException;
import java.io.Writer;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.json.spi.JsonProvider;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

public class StickerEncoder implements Encoder.TextStream<Sticker> {

  @Override
  public void encode(Sticker sticker, Writer writer) throws EncodeException, IOException {
    JsonProvider provider = JsonProvider.provider();//建立JSONProvider
    
    JsonObject jsonSticker = Json.createObjectBuilder().build();
//    System.out.println("STEP:2-ENC");
    	if("addChatSvc".equals(sticker.getAction())){
        	jsonSticker = provider.createObjectBuilder()
        	.add("action", sticker.getAction())
        	.add("chat", sticker.getChat() )
        	.build();
        }
        
    
    try (JsonWriter jsonWriter = provider.createWriter(writer)) {
      jsonWriter.write(jsonSticker);
    }
  }

  @Override
  public void init(EndpointConfig ec) {
  }

  @Override
  public void destroy() {
  }
}