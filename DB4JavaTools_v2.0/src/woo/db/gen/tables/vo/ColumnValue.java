package woo.db.gen.tables.vo;

public class ColumnValue {
	
	private String name;
	private String dbType;
	private String javaType;
	private boolean isPID;
	private boolean isAI;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDbType() {
		return dbType;
	}
	
	public void setDbType(String dbType) {
		this.dbType = dbType;
	}
	
	public String getJavaType() {
		return javaType;
	}
	
	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}
	
	public boolean isPID() {
		return isPID;
	}
	
	public void setPID(boolean isPID) {
		this.isPID = isPID;
	}
	
	
	public boolean isAI() {
		return isAI;
	}

	public void setAI(boolean isAI) {
		this.isAI = isAI;
	}

	@Override
	public String toString() {
		return "ColumnValue [name=" + name + ", dbType=" + dbType
				+ ", javaType=" + javaType + ", isPID=" + isPID + ", isAI="
				+ isAI + "]";
	}
	
}
