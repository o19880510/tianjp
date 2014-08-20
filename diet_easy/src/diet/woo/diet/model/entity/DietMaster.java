package woo.diet.model.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;

@Entity
@Table(name = "D_DIET_MASTER")
public class DietMaster implements Serializable {

	private static final long	serialVersionUID	= 1L;
	
	@Id
	@GeneratedValue ( strategy = GenerationType.IDENTITY )
	@Column ( name = "ID" )
	private Integer id;
	
	@Column(name = "`DAY`")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	private LocalDate			day;

	@Column(name = "MONTH")
	private Integer				month;

	@Column(name = "YEAR")
	private Integer				year;

	@Column(name = "USER_ID")
	private String				userId;
	
	@Column(name = "CITY")
	private String				city;
	
	@Column(name = "WEATHER")
	private String				weather;
	
	@Column(name = "TEMPERATURE")
	private String				temperature;
	
	@Transient
	private List<List<DietRecord>>	dietRecordList;
	
	public DietMaster(){
		dietRecordList = new ArrayList<List<DietRecord>>();
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<List<DietRecord>> getDietRecordList() {
		return dietRecordList;
	}

	public void setDietRecordList(List<List<DietRecord>> dietRecordList) {
		this.dietRecordList = dietRecordList;
	}
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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
		DietMaster other = (DietMaster) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DietMaster [id=" + id + ", day=" + day + ", month=" + month + ", year=" + year + ", userId=" + userId
				+ ", city=" + city + ", weather=" + weather + ", temperature=" + temperature + ", dietRecordList="
				+ dietRecordList + "]";
	}
	
}
