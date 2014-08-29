package woo.db.gen.utils;

import java.util.HashMap;
import java.util.Map;

public class XmlUtils {
	
	
	public static Map<String, String> subXml(String xml,String[] keys){
		
		Map<String,String> map = new HashMap<String, String>();
		for(String key : keys ){
			String value = subXml(xml, key);
			map.put(key, value);
		}
		
		return map;
	}
	
	private static String subXml(String xml,String key){
		String[] keys = key.split("\\.");
		
		String returnXml = xml;
		for(String smallKey : keys){
			returnXml = subXmlSingel(returnXml, smallKey);
			if(StringUtil.isEmpty(returnXml)){
				break;
			}
		}
		
		return returnXml;
	}
	
	private static String subXmlSingel(String xml,String key){
		String startStr = "<"+key+">";
		String endStr = "</"+key+">";
		
		int startIndex = xml.indexOf(startStr);
		int endIndex = xml.indexOf(endStr);
		
		if(startIndex != -1 && endIndex != -1 && startIndex < endIndex){
			return xml.substring(startIndex + startStr.length(), endIndex);
		}
		
		return "";
	}
	
	public static void main(String[] args){
		
	}
}
