package framework;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Created by mayufeng on  2018/2/23
 * json转换类
 * @author mayufeng
 * @version 0.1
 */
public class JsonUtils {
    /**
     * 对象转json
     * @param T
     * @param <T>
     * @return
     */
    public static <T> String objectToJson(T T){
        String json="";
        try {
            ObjectMapper jsonMapper = new ObjectMapper();
  
            json = jsonMapper.writeValueAsString(T);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    /**
     * 将json转化为实体POJO
     *
     * @param jsonStr
     * @param T
     * @return
     */
    public static <T> T JSONToObj(String jsonStr, Class<T> T) {
        T t = null;
        try {
            ObjectMapper objectMapper = new ObjectMapper();

            t = objectMapper.readValue(jsonStr, T);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    /**
     * 返回json 节点
     * @param jsonStr
     * @return
     */
    public static JsonNode getJsonNode(String jsonStr) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
       
            return objectMapper.readTree(jsonStr);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 返回json的value
     * @param node
     * @param key
     * @return
     */
    public static String getJsonValue(JsonNode node, String key) {
        JsonNode result =node.get(key);
        if(result!=null){
            if(result.getNodeType().name().equalsIgnoreCase("STRING")){
                return result.asText();
            }else {
                return result.toString();
            }
        }
        return null;
    }

    public static void  main(String[] args){
        String s = "{\"addresslist-explorer\":{\"result\":{},\"query\":{\"display-name\":\"3333\"}}}";
        JsonNode node = JsonUtils.getJsonNode(s);
        JsonNode node1 = JsonUtils.getJsonNode(JsonUtils.getJsonValue(node,"addresslist-explorer"));
        System.out.println(JsonUtils.getJsonValue(node,"addresslist-explorer"));
        System.out.println(JsonUtils.getJsonValue(node1,"result"));
    }
}
