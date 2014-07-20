package woo.framework.core.dao.parameter;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.LongAdder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ParameterSetterFactory {
	
	private static Logger log	= LoggerFactory.getLogger(ParameterSetterFactory.class);
	private static ParameterSetterFactory factory = new ParameterSetterFactory();
	
	private static Map<ParameterSetter, LongAdder> map;
	
	private List<ParameterSetter> list;
	private ParameterSetterFactory(){
		
		list = new ArrayList<ParameterSetter>();
		
		list.add(new StringParameterSetter());
		list.add(new IntegerParameterSetter());
		list.add(new LongParameterSetter());

		list.add(new DateTimeParameterSetter());
		list.add(new DateParameterSetter());
		list.add(new TimeParameterSetter());
		list.add(new DoubleParameterSetter());
		
		map = new HashMap<ParameterSetter, LongAdder>();
		for(ParameterSetter setter : list){
			map.put(setter, new LongAdder());
		}
	}
	
	public static ParameterSetterFactory getInstance(){
		return factory;
	}
	
//	public void set(PreparedStatement pStatement, List params) throws SQLException{
//		try {
//			for(int i = 0; i < params.size(); ++i){
//				ParameterSetterFactory.getInstance().set(pStatement, params.get(i), i+1);
//			}
//		} catch (SQLException e) {
//		}
//	}
//	public void set(PreparedStatement pStatement, Object... params) throws SQLException{
//		try {
//			for(int i = 0; i < params.length; ++i){
//				ParameterSetterFactory.getInstance().set(pStatement, params[i], i+1);
//			}
//		} catch (SQLException e) {
//		}
//	}
	
	public void set(PreparedStatement pStatement, Object obj, int index) throws SQLException{
		
		for(ParameterSetter setter : list){
			if(setter.isSettable(obj)){
				setter.parameterSet(pStatement, obj, index);
				increment(setter);
				break;
			}
		}
	}
	
	public void addSetter(Class<ParameterSetter> clazz){
		try {
			ParameterSetter setter = clazz.newInstance();
			list.add(setter);
			map.put(setter, new LongAdder());
		} catch (InstantiationException | IllegalAccessException e) {
			log.error("Class new instance error , " + clazz, e);
		}
	}
	
	private void increment(ParameterSetter setter){
		LongAdder longAdder = map.get(setter);
		if(longAdder != null){
			longAdder.increment();
		}
	}
	
	public static String useCount(){
		StringBuilder sb = new StringBuilder();
		
		for(Map.Entry<ParameterSetter, LongAdder> entry: map.entrySet()){
			sb.append(entry.getKey()).append(":");
			sb.append(entry.getValue().longValue()).append("\r\n");
		}
		
		return sb.toString();
	}
	
}
