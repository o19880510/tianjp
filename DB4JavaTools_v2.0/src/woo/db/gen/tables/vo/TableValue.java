package woo.db.gen.tables.vo;

import java.util.ArrayList;
import java.util.List;

public class TableValue {
	
	private String name;
	private List<ColumnValue> columnList;
	private List<ColumnValue> columnPIDList;

	public TableValue(String name) {
		columnList = new ArrayList<ColumnValue>();
		columnPIDList = new ArrayList<ColumnValue>();
	}

	public TableValue(String name, List<ColumnValue> columnValueList) {
		this.name = name;
		this.columnList = columnValueList;
		
		
		// 获取所有的主键字段
		columnPIDList = new ArrayList<ColumnValue>();
		for(ColumnValue columnValue : columnValueList){
			if(columnValue.isPID()){
				columnPIDList.add(columnValue);
			}
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<ColumnValue> getColumnPIDList() {
		return columnPIDList;
	}

	public void setColumnPIDList(List<ColumnValue> columnPIDList) {
		this.columnPIDList = columnPIDList;
	}
	
	public List<ColumnValue> getColumnList() {
		return columnList;
	}

	public void setColumnList(List<ColumnValue> columnList) {
		this.columnList = columnList;
	}

	@Override
	public String toString() {
		return "TableValue [name=" + name + ", columnList="
				+ columnList + "]";
	}
}
