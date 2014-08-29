package woo.db.gen.tables.type;

public interface TypeTransfer {
	public static final String UNKNOWN = "UNKNOWN";
	
	public String getType(Object... paramObjs);
}
