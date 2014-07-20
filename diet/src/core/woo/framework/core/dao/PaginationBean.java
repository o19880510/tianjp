package woo.framework.core.dao;

import java.util.List;

public class PaginationBean<T> {
	
	private int currentPage;
	private int pageSize;
	private int recordCount;
	private int totalPage;
	private int recordIndex;
	private List<T>	dataList;
	
	public PaginationBean(int currentPage, int pageSize, int recordCount) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		this.init();
	}
	
	private void init() {
		if (this.recordCount > 0) {
			totalPage = getTotalPage();
			recordIndex = (currentPage - 1) * pageSize;
		}
	}

	private int getTotalPage() {
		int totalPage = recordCount / pageSize;
		if (totalPage * pageSize < recordCount) {
			++totalPage;
		}
		return totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getRecordIndex() {
		return recordIndex;
	}

	public void setRecordIndex(int recordIndex) {
		this.recordIndex = recordIndex;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public PaginationBean<T> setDataList(List<T> dataList) {
		this.dataList = dataList;
		return this;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	@Override
	public String toString() {
		return "PaginationBean [currentPage=" + currentPage + ", pageSize=" + pageSize + ", recordCount=" + recordCount
				+ ", totalPage=" + totalPage + ", recordIndex=" + recordIndex + ", dataList=" + dataList + "]";
	}
}
