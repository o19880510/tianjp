package woo.db.gen;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import woo.db.gen.config.ConfigConstants;
import woo.db.gen.config.ConfigFactory;
import woo.db.gen.tables.db.MysqlConnection;
import woo.db.gen.tables.reader.MysqlTableReader;
import woo.db.gen.tables.reader.TableReader;
import woo.db.gen.tables.vo.FileValue;
import woo.db.gen.tables.vo.TableValue;
import woo.db.gen.template.VelocityCore;
import woo.db.gen.utils.FileSystem;
import woo.db.gen.utils.style.CodeStyle;
import woo.db.gen.utils.style.Style;
import woo.db.gen.utils.style.XmlStyle;

public class Main {
	
	public static void main(String[] args) {
		try{
			ConfigFactory configFactory = ConfigFactory.getInstance();

			TableReader tableReader = new MysqlTableReader();
			List<TableValue> tableValueList = tableReader.getTables(new MysqlConnection(), configFactory.get(ConfigConstants.DB_NAME), configFactory.getTables());
			
			System.out.println("tableValueList:" + tableValueList);
			
			for(TableValue tableValue : tableValueList){
				for(String genType : configFactory.getGenType()){
					gen(tableValue, genType);
				}
			}
		}catch(Throwable t){
			System.out.println("Exception:" + t);
			t.printStackTrace();
		}
		
	}
	
	private static void gen(TableValue tableValue, String genType){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("__TableValue", tableValue);
	
		FileValue file = VelocityCore.gen("template/"+genType+".vm", map);
		
		boolean javaFormat = genType.endsWith("java");
		boolean xmlFormat = genType.endsWith("xml");
		Style style = new CodeStyle();
		if(xmlFormat){
			style = new XmlStyle();
		}
		String oldFileContent = file.getFileContent();
		String fileContent = style.setStyle(oldFileContent);
		
		
		
		String fileEnds = ".java";
		if(xmlFormat){
			fileEnds = ".xml";
		}
		
		FileSystem.writeTo(fileContent, "./code/"+file.getFileName() + fileEnds);
	}
}
