
package woo.diet.vo;

import java.sql.Timestamp;
import java.time.LocalTime;

public class  DietRecordValue {
	
	private Integer id;
	private Integer seq;
	private String type;
	private LocalTime time;
	private String foods;
	
	private String desc;
	
	public void setId(Integer id){
		this.id = id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setSeq(Integer seq){
		this.seq = seq;
	}

	public Integer getSeq(){
		return this.seq;
	}

	public void setType(String type){
		this.type = type;
	}

	public String getType(){
		return this.type;
	}

	public void setTime(LocalTime time){
		this.time = time;
	}

	public LocalTime getTime(){
		return this.time;
	}

	public void setFoods(String foods){
		this.foods = foods;
	}

	public String getFoods(){
		return this.foods;
	}

	public void setDesc(String desc){
		this.desc = desc;
	}

	public String getDesc(){
		return this.desc;
	}

	
	public String toString(){
		return "DietRecordValue [ "
		+ "id:" + id
		+ ", seq:" + seq
		+ ", type:" + type
		+ ", time:" + time
		+ ", foods:" + foods
		+ ", desc:" + desc
		+ " ]";
	}

}


