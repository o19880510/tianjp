package woo.db.gen.tables.db;

public class MysqlConnection extends ConnectionCommon{
	
	@Override
	protected String getDriver() {
		return "com.mysql.jdbc.Driver";
	}

}
