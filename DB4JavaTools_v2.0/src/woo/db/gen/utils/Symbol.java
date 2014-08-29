package woo.db.gen.utils;

public class Symbol {
	public static final String	ENTER_WIN			= "\r\n";
	public static final String	ENTER_UNIX			= "\n";

	public static final String	TAB					= "\t";
	public static final String	PARENTHESES			= "()";
	public static final String	PARENTHESES_LEFT	= "(";
	public static final String	PARENTHESES_RIGHT	= ")";
	public static final String	SEMICOLON			= ";";
	public static final String	SPACE				= " ";
	public static final String	POINT				= ".";
	
	
	public static String TABS(int count){
		return setTimes(TAB,count);
	}
	
	public static String ENTERS(int count){
		return setTimes(getEnter(),count);
	}
	
	private static String setTimes(String str,int count){
		StringBuffer sb = new StringBuffer();
		while(count > 0){
			sb.append(str);
			count --;
		}
		return sb.toString();
		
	}
	
	public static String getEnter(){
		String os = System.getProperty("os.name");
		if( os.contains("Windows") ){
			return ENTER_WIN;
		}else if( os.contains("Linux") ){
			return ENTER_UNIX;
		}
		
		throw new RuntimeException("can not known os:" + os);
	}
}
