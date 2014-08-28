package woo.db.gen.utils;

public class NumberUtils {
	
	/**
	 * 将字符串转换为数字，如果转换异常，则返回-1
	 */
	public static int parseInt(String n) {

		try {
			return Integer.parseInt(n);
		} catch (java.lang.NumberFormatException nfe) {
			return -1;
		}
	}
	public static int parseInt(String n, int defaultValue) {
		
		try {
			return Integer.parseInt(n);
		} catch (java.lang.NumberFormatException nfe) {
			return defaultValue;
		}
	}
	
	/**
	 * 将字符串转换为数字，如果转换异常，则返回-1
	 * 
	 */
	public static int parseInt(Object number) {
		
		if(number == null){
			return -1;
		}
		return parseInt(number.toString());
	}
	
	public static int parseInt(Object number, int defaultValue) {
		
		if(number == null){
			return defaultValue;
		}
		return parseInt(number.toString());
	}
	
	/**
	 * 生成随机数字
	 * @param length  随机数长度
	 * @return
	 */
	public static String random(int length){
		
		StringBuilder numberBuilder = new StringBuilder();
		for(int i = 0 ; i < length ; i++){
			int randomNum = (int)(Math.random()*10 - 1);
			numberBuilder.append(randomNum);
		}
		return numberBuilder.toString();
	}
	
	
	/**
	 * 将字符串转换为数字，如果转换异常，则返回-1L
	 * 
	 */
	public static long parseLong(Object number) {
		
		if(number == null){
			return -1L;
		}
		long outLong = parseLong(number.toString());
		return outLong;
	}
	
	public static long parseLong(Object number, long defaultValue) {
		
		long outLong = parseLong(number);
		if(outLong == -1L){
			return defaultValue;
		}
		
		return outLong;
	}
	
	public static long parseLong(String number){
		try {
			return Long.valueOf(number.toString());
		} catch (java.lang.NumberFormatException nfe) {
			return -1L;
		}
	}
	
	
	public static byte[] intToByte(int i) {
		byte[] abyte0 = new byte[4];
		abyte0[0] = (byte) (0xff & i);
		abyte0[1] = (byte) ((0xff00 & i) >> 8);
		abyte0[2] = (byte) ((0xff0000 & i) >> 16);
		abyte0[3] = (byte) ((0xff000000 & i) >> 24);
		return abyte0;
	}

	public static int bytesToInt(byte[] bytes) {
		int addr = bytes[0] & 0xFF;
		addr |= ((bytes[1] << 8) & 0xFF00);
		addr |= ((bytes[2] << 16) & 0xFF0000);
		addr |= ((bytes[3] << 24) & 0xFF000000);
		return addr;
	}
}
