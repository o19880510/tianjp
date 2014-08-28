package woo.db.gen.tables.type;

import woo.db.gen.utils.NumberUtils;


public class NumberMysqlTransfer implements TypeTransfer{
	
	public static final String DB_TYPE = "INT";
	public static final String JAVA_TYPE = "Integer";
	public static final String JAVA_TYPE2 = "Double";
	
	public String getType(Object... paramObjs) {
		if(DB_TYPE.equals(paramObjs[0])){
			if(paramObjs.length > 1){
				int scale = NumberUtils.parseInt(paramObjs[1]);
				if(scale > 0){
					return JAVA_TYPE2;
				}
			}
			return JAVA_TYPE;
		}
		return UNKNOWN;
	}
	
	
}
