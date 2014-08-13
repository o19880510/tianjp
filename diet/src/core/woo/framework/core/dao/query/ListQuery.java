package woo.framework.core.dao.query;

import java.util.ArrayList;
import java.util.Collection;

public class ListQuery<K> implements Query<Collection<K>> {
	
	private Collection<K> collection;
	
	
	@Override
	public void doQuery() {
		collection = new ArrayList<K>();
		collection.add((K)"asd");
		collection.add((K)"asd");
		collection.add((K)"asd");
		collection.add((K)"asd");
		
	}

	@Override
	public Collection<K> getResult() {
		return collection;
	}
}
