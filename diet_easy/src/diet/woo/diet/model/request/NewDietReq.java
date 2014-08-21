package woo.diet.model.request;

import java.util.ArrayList;
import java.util.List;

import org.joda.time.LocalDate;
import org.joda.time.LocalTime;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class NewDietReq {
	
	private Integer			id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate		day;
	private String			city;
	private String			weather;
	private String			temperature;
	private List<Record>	items;
	
	public NewDietReq(){
		items = new ArrayList<NewDietReq.Record>();
	}
	
	public static class Record{
		private Integer		id;
		private String		type;
		private String		subType;
		@DateTimeFormat(pattern = "HH:mm")
		private LocalTime	timeStart;
		@DateTimeFormat(pattern = "HH:mm")
		private LocalTime	timeEnd;

		private String		desc;

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

		public String getDesc() {
			return desc;
		}

		public void setDesc(String desc) {
			this.desc = desc;
		}
		
		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		@Override
		public String toString() {
			return "Record [id=" + id + ", type=" + type + ", subType=" + subType + ", timeStart=" + timeStart
					+ ", timeEnd=" + timeEnd + ", desc=" + desc + "]";
		}
		
	}


	public LocalDate getDay() {
		return day;
	}


	public void setDay(LocalDate day) {
		this.day = day;
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

	public List<Record> getItems() {
		return items;
	}

	public void setItems(List<Record> items) {
		this.items = items;
	}

	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "NewDietReq [id=" + id + ", day=" + day + ", city=" + city + ", weather=" + weather + ", temperature="
				+ temperature + ", items=" + items + "]";
	}
	
}
