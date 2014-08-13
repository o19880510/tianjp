package woo.framework.core.dao.query;

import java.util.Collection;

public class MainTest {
	
	public static void main(String[] args) {
		Query<Collection<String>> queryList = new ListQuery();
		
		queryList.doQuery();
		
		System.out.println(queryList.getResult());
		
	}
	
}
