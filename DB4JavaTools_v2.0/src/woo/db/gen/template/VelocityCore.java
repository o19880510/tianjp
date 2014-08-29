package woo.db.gen.template;


import java.io.StringWriter;
import java.util.Map;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;

import woo.db.gen.tables.vo.FileValue;
import woo.db.gen.utils.StringUtil;


public class VelocityCore {
	
	private static final VelocityEngine VELOCITY_ENGINE = new VelocityEngine();
	private static final VelocityContext CONTEXT = new VelocityContext();
	
	static {
		
		//设置velocity资源加载方式为file  
		VELOCITY_ENGINE.setProperty("resource.loader", "file");  
        //设置velocity资源加载方式为file时的处理类  
		VELOCITY_ENGINE.setProperty("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.FileResourceLoader");  
        
        
//		 //设置velocity资源加载方式为class  
//		velocityEngine.setProperty(Velocity.RESOURCE_LOADER, "class");  
//        //设置velocity资源加载方式为file时的处理类  
//		velocityEngine.setProperty("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");  
       
		// 处理中文问题
		VELOCITY_ENGINE.setProperty(Velocity.INPUT_ENCODING, "UTF-8");
		VELOCITY_ENGINE.setProperty(Velocity.OUTPUT_ENCODING, "UTF-8");
		// 初始化模板
		VELOCITY_ENGINE.init();
		
		
		CONTEXT.put("StringUtil", new StringUtil());
	}
	

	
	public static FileValue gen(String fileName, Map<String, Object> paramMap){
		
		VelocityContext peivateContext = (VelocityContext) CONTEXT.clone();
		for(Map.Entry<String, Object> entry : paramMap.entrySet()){
			peivateContext.put(entry.getKey(), entry.getValue());
		}
		
		try {
			
			StringWriter writer=new StringWriter();  
			// 得到模板文件;调用merge方法传入context
			VELOCITY_ENGINE.getTemplate(fileName).merge(peivateContext, writer);
			
			return new FileValue(String.valueOf(peivateContext.get("className")), writer.toString());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
}
