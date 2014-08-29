package woo.db.gen.utils.style;

import woo.db.gen.utils.Symbol;


public class XmlStyle implements Style{
	static final String START = "[\\s\\S]*<[^/]*>[\\s\\S]*";
	static final String END = "[\\s\\S]*</[\\s\\S]*>[\\s\\S]*";
	
	public String setStyle(String xmlString){
		String classStrs[] = xmlString.split(Symbol.ENTER_UNIX + "|" + Symbol.ENTER_WIN);
		StringBuffer newClassStr = new StringBuffer();
		
		int i = 0;//没有被大括号包围的 不缩进，被一个包围的缩进\t,被两个包围的缩进2*\t,...
		for(String str : classStrs){
			String temp = str.trim();
			
			//System.out.println(temp+" : start->"+temp.matches(START) + ",\t  end->"+temp.matches(END));

			if(temp.matches(END) && temp.matches(START)){
			}else{
				if( temp.matches(END) && i > 0 ){
					--i;
				}
			}
			
			newClassStr.append(Symbol.TABS(i));
			newClassStr.append(temp);
			newClassStr.append(Symbol.getEnter());
			
			if(temp.matches(END) && temp.matches(START)){
			}else{
				if(temp.matches(START) ){
					++i;
				}
			}
		}
		
		return newClassStr.toString();
	}
}
