package woo.diet.model.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;

@Entity
@Table(name = "D_DIET_MASTER")
public class DietMaster implements Serializable {

	private static final long	serialVersionUID	= 1L;

	@Id
	@Column(name = "`DAY`")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	private LocalDate			day;

	@Column(name = "MONTH")
	private Integer				month;

	@Column(name = "YEAR")
	private Integer				year;

	@Column(name = "USER_ID")
	private Integer				userId;

	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
	@JoinColumn ( name = "day" )
	@OrderBy("day type asc")
	private List<DietRecord>	dietRecordList;
	
	public DietMaster(){
		dietRecordList = new ArrayList<DietRecord>();
	}

	public LocalDate getDay() {
		return day;
	}

	public void setDay(LocalDate day) {
		this.day = day;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public List<DietRecord> getDietRecordList() {
		return dietRecordList;
	}

	public void setDietRecordList(List<DietRecord> dietRecordList) {
		this.dietRecordList = dietRecordList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((day == null) ? 0 : day.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DietMaster other = (DietMaster) obj;
		if (day == null) {
			if (other.day != null)
				return false;
		} else if (!day.equals(other.day))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DietMaster [day=" + day + ", month=" + month + ", year=" + year + ", userId=" + userId
				+ ", dietRecordList=" + dietRecordList + "]";
	}
	
}
