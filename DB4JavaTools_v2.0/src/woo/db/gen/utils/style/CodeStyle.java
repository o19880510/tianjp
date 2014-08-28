package woo.db.gen.utils.style;

import woo.db.gen.utils.Symbol;

public class CodeStyle implements Style{
	
	public String setStyle(String classString){
		String classStrs[] = classString.split(Symbol.ENTER_UNIX + "|" + Symbol.ENTER_WIN);
		StringBuffer newClassStr = new StringBuffer();
		
		int i = 0;//没有被大括号包围的 不缩进，被一个包围的缩进2*\t,被两个包围的缩进4*\t,...
		for(String str : classStrs){
			String temp = str.trim();
			
			if(temp.indexOf("}") > -1 && i > 0){
				--i;
				temp += Symbol.getEnter();
			}
			newClassStr.append(Symbol.TABS(i));
			newClassStr.append(temp);
			newClassStr.append(Symbol.getEnter());
			if(temp.indexOf("{") > -1){
				++i;
			}
		}
		//System.out.println(newClassStr.toString());
		return newClassStr.toString();
	}
	
	public static void main(String[] args) {
		String test = "asdf\r\n";
		System.out.println(test.trim()+1);
	}
	
}
