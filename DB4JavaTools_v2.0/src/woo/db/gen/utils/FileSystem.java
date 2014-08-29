package woo.db.gen.utils;

import java.io.BufferedReader;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class FileSystem {
	
	public static void writeTo(String content,String path){
		
		writeTo(content, path, false);
	}
	
	public static void writeTo(String content,String path,boolean append){
		
		try {
			int endIndex = path.lastIndexOf("/");
			String dirPath = path.substring(0, endIndex);
			File file = new File(dirPath);
			
			if(!file.exists()){
				file.mkdirs();
			}
			
			FileWriter fileWriter = new FileWriter(path,append);
			fileWriter.write(content);
			fileWriter.flush();
			fileWriter.close();
			
		} catch (Exception e) {
			throw new RuntimeException("Write to file failure! exception is : " + e);
		}
	}
	public static void writeTo(byte[] content,String path){
		try{
			FileOutputStream fileOut = new FileOutputStream(path);
			
			fileOut.write(content);
			fileOut.flush();
			fileOut.close();
			
		}catch(Exception e){
			throw new RuntimeException("Write to file failure! exception is : " + e);
		}
	}
	
	private static final int BYTE_LENGTH_512 = 512;
	public static byte[] read(String path){
		try{
			FileInputStream fileIn = new FileInputStream(path);
			
			byte[] bytes = new byte[BYTE_LENGTH_512];
			
			int readCount  = 0,
				totlaCount = 0;
			while( (readCount = fileIn.read(bytes)) != -1){
				if(readCount != 512){
					break;
				}
			}
			
			return Arrays.copyOfRange(bytes, 0, readCount);
		}catch(Exception e){
			throw new RuntimeException("Read file failure! exception is : " + e);
		}
	}
	
	
	public static byte[] readToBytes(InputStream in){
		try {
			byte[] bytes = new byte[4096];
			int length = -1;
			length = in.read(bytes);
			
			return Arrays.copyOfRange(bytes, 0, length);
		} catch (Exception e) {
			throw new RuntimeException("FileSystem readToBytes failure: "+e);
		}
		
	}
	public static String readToString(InputStream in){
		
		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(in,"utf-8"));
			
			StringBuilder sb = new StringBuilder();
			String line = null;
			while((line = reader.readLine()) != null){
				sb.append(line);
			}
			
			return sb.toString();
			
		} catch (IOException e) {
			throw new RuntimeException("FileSystem readToString failure: "+e);
		}
		
	}
	
	public static String readToString(String path){
		
		try {
			InputStreamReader fileReader = new InputStreamReader(new FileInputStream(path), "UTF-8");
			BufferedReader reader = new BufferedReader(fileReader);
			
			StringBuilder sb = new StringBuilder();
			String line = null;
			while((line = reader.readLine()) != null){
				sb.append(line);
			}
			
			return sb.toString();
			
		} catch (IOException e) {
			throw new RuntimeException("FileSystem readToString failure: "+e);
		}
		
	}
	
	public static boolean isFileExist(String path) {

		File file = new File(path);
		return file.exists();

	}
	
	public static InputStream readToStream(String path){
		try{
			FileInputStream fileIn = new FileInputStream(path);
			
			return fileIn;
		}catch(Exception e){
			throw new RuntimeException("Read file failure! exception is : " + e);
		}
	}
		
	public static void main(String[] args) {
	}
}
