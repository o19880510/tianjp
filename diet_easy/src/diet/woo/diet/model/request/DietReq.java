package woo.diet.model.request;

import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

import com.lutongnet.system.model.request.CommonReq;

public class DietReq extends CommonReq{
	
	private String type;
	private String subType;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate endDate;

	
	public DietReq() {
		super(7); // init page size to 7
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getSubType() {
		return subType;
	}


	public void setSubType(String subType) {
		this.subType = subType;
	}


	public LocalDate getStartDate() {
		return startDate;
	}


	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}


	public LocalDate getEndDate() {
		return endDate;
	}


	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}


	@Override
	public String toString() {
		return "DietReq [type=" + type + ", subType=" + subType + ", startDate=" + startDate + ", endDate=" + endDate
				+ "]";
	}
	
}
