
package woo.diet.vo;

import java.time.LocalTime;

public class  DietDigestiveValue {
	
	private Integer id;
	private Integer seq;
	private LocalTime time;
	private String speculation;
	
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

	public void setTime(LocalTime time){
		this.time = time;
	}

	public LocalTime getTime(){
		return this.time;
	}

	public void setSpeculation(String speculation){
		this.speculation = speculation;
	}

	public String getSpeculation(){
		return this.speculation;
	}

	
	public String toString(){
		return "DietDigestiveValue [ "
		+ "id:" + id
		+ ", seq:" + seq
		+ ", time:" + time
		+ ", speculation:" + speculation
		+ " ]";
	}

}


