package woo.db.gen.tables.reader;

import java.util.List;

import woo.db.gen.tables.db.DBConnection;
import woo.db.gen.tables.vo.TableValue;

public interface TableReader {
	public List<TableValue> getTables(DBConnection db, String dbName, String... tables);
}
