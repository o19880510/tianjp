package woo.db.gen.tables.reader;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import woo.db.gen.tables.db.DBConnection;
import woo.db.gen.tables.type.TypeTransfer;
import woo.db.gen.tables.type.TypeTransferFactory;
import woo.db.gen.tables.vo.ColumnValue;
import woo.db.gen.tables.vo.TableValue;

public class MysqlTableReader implements TableReader{
	
	public List<TableValue> getTables(DBConnection db, String dbName, String... tables) {
		
		List<TableValue> tableValueList = new ArrayList<TableValue>();
		
		Connection connection = db.getConnection();
		for(String tableName : tables){
			try {
				TableValue tableValue = getTable(connection, dbName, tableName);
				tableValueList.add(tableValue);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tableValueList;
	}
	
	
	
	private static final String GET_COLUMN =    
			  " SELECT upper(COLUMN_NAME) as COLUMN_NAME, "
			+ "       DATA_TYPE, "
			+ "       NUMERIC_SCALE, "
			+ "       (CASE COLUMN_KEY WHEN 'PRI' THEN 'Y' ELSE 'N' END) AS PK, "
			+ "       (CASE EXTRA WHEN 'auto_increment' THEN 'Y' ELSE 'N' END) AS AI "
			+ " FROM COLUMNS "
			+ " WHERE TABLE_NAME = ? AND TABLE_SCHEMA = ? ";
	private TableValue getTable(Connection conn, String dbName, String tableName) throws Exception{
		
		PreparedStatement ps = conn.prepareStatement(GET_COLUMN);
		ps.setString(1, tableName);
		ps.setString(2, dbName);
		
		List<ColumnValue> columnValueList = new ArrayList<ColumnValue>();
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String dbType = rs.getString("DATA_TYPE");
			int scale = rs.getInt("NUMERIC_SCALE");
			
			ColumnValue column = new ColumnValue();
			
			column.setDbType(dbType);
			column.setName(rs.getString("COLUMN_NAME"));
			
			boolean isPID = rs.getString("PK").equals("Y");
			column.setPID(isPID);
			
			boolean isAI = rs.getString("AI").equals("Y");
			column.setAI(isAI);
			
			String javaType = TypeTransferFactory.getType(dbType);
			if(TypeTransfer.UNKNOWN.equals(javaType)){
				javaType = TypeTransferFactory.getType(dbType, scale);
			}
			column.setJavaType(javaType);
			
			columnValueList.add(column);
		}
		
		return  new TableValue(tableName, columnValueList);
	}
	

}
