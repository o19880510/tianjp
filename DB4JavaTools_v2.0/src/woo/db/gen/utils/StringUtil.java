package woo.db.gen.utils;

public class StringUtil {
	
	public static boolean isNotEmpty(String string){
		if(string == null){
			return false;
		}
		if("".equals(string)){
			return false;
		}
		return true;
	}
	
	public static boolean isEmpty(String string){
		return !isNotEmpty(string);
	}
	
	
	public static String firstCharToUpper(String string){
		if(isNotEmpty(string)){
			return string.substring(0,1).toUpperCase() + string.substring(1) ;
		}
		return null;
	}
	
	public static String firstCharToLower(String string){
		if(isNotEmpty(string)){
			return  string.substring(0,1).toLowerCase() + string.substring(1) ;
		}
		return null;
	}
	
	public static String noUnderLine(String string){
		String afterDeal = string.trim().toLowerCase();
		while(afterDeal.indexOf("_") > -1){
			String ch = afterDeal.substring(afterDeal.indexOf("_")+1,afterDeal.indexOf("_")+2).toUpperCase();
			afterDeal = afterDeal.replaceFirst("_[a-z0-9]{1}", ch);
		}
		return afterDeal;
	}
	
	public static void main(String[] args) {
		System.out.println(firstCharToUpper("txnDate"));
		System.out.println(noUnderLine("txn_ate"));
	}
}
