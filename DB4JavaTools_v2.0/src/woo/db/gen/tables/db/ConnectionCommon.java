package woo.db.gen.tables.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import woo.db.gen.config.ConfigConstants;
import woo.db.gen.config.ConfigFactory;

public abstract class ConnectionCommon implements DBConnection{
	
	public Connection getConnection() {
		
		try {
			Class.forName(getDriver());
			
		} catch (ClassNotFoundException e1) {
			System.out.println("load driver failed");
			e1.printStackTrace();
		}
		
		Connection localConnection = null;
		try {
			
			ConfigFactory config = ConfigFactory.getInstance();
			String url = config.get(ConfigConstants.DATABASE_URL);
			String userName = config.get(ConfigConstants.DATABASE_USER);
			String password = config.get(ConfigConstants.DATABASE_PASSWORD);
			
			localConnection = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return localConnection;
	}
	
	protected abstract String getDriver();
}
