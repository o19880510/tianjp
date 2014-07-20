package woo.diet.vo;

import java.io.Serializable;
import java.time.LocalDateTime;

public class TestValue implements Serializable{
	
	private static final long	serialVersionUID	= 7140156073895396998L;
	
	private String name;
	private Integer age;
	private LocalDateTime date;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "TestValue [name=" + name + ", age=" + age + ", date=" + date + "]";
	}
	
	
	
}
