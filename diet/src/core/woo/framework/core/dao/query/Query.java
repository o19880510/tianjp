package woo.framework.core.dao.query;

public interface Query<T> {
	public void doQuery();
	public T getResult();
}
