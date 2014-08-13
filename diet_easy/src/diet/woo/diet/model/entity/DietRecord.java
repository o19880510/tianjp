
package woo.diet.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.LocalTime;

@Entity
@Table ( name = "D_DIET_RECORD" )
public class  DietRecord implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue ( strategy = GenerationType.IDENTITY )
	@Column ( name = "ID" )
	private Integer id;
	
	
	@Column ( name = "`DAY`" )
	@Type ( type = "org.joda.time.contrib.hibernate.PersistentLocalDate" )
	private LocalDate day;
	
	@Column ( name = "TYPE" )
	private String type;
	
	@Column ( name = "TIME_START" )
	@Type ( type = "org.joda.time.contrib.hibernate.PersistentLocalTimeExact" )
	private LocalTime timeStart;
	
	@Column ( name = "TIME_END" )
	@Type ( type = "org.joda.time.contrib.hibernate.PersistentLocalTimeAsTime" )
	private LocalTime timeEnd;
	
	
	@Column ( name = "SUB_TYPE" )
	private String subType;
	
	@Column ( name = "`DESC`" )
	private String desc;
	
	@Type ( type = "org.joda.time.contrib.hibernate.PersistentDateTime" )
	@Column ( name = "TXN_DATE" )
	private DateTime txnDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public LocalDate getDay() {
		return day;
	}

	public void setDay(LocalDate day) {
		this.day = day;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public LocalTime getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(LocalTime timeStart) {
		this.timeStart = timeStart;
	}

	public LocalTime getTimeEnd() {
		return timeEnd;
	}

	public void setTimeEnd(LocalTime timeEnd) {
		this.timeEnd = timeEnd;
	}

	public String getSubType() {
		return subType;
	}

	public void setSubType(String subType) {
		this.subType = subType;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public DateTime getTxnDate() {
		return txnDate;
	}

	public void setTxnDate(DateTime txnDate) {
		this.txnDate = txnDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		DietRecord other = (DietRecord) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DietRecord [id=" + id + ", day=" + day + ", type=" + type + ", timeStart=" + timeStart + ", timeEnd="
				+ timeEnd + ", subType=" + subType + ", desc=" + desc + ", txnDate=" + txnDate + "]";
	}
	
}

