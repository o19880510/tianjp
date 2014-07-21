package woo.framework.core.transactional;

import java.sql.Connection;

public interface Transaction {
	
	public Connection setNewTransaction();
	
	public Connection setNoTransaction();
	
	public boolean hasConnection();
	
	public boolean withTransaction();
	
	public void commit();
	
	public void rollback();

	public void close();
}
