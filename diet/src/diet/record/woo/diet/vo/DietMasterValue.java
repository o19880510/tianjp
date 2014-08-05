
package woo.diet.vo;

import java.time.LocalDateTime;

public class  DietMasterValue {
	
	private Integer id;
	private String userId;
	private LocalDateTime date;
	private String summary;
	
	public void setId(Integer id){
		this.id = id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setUserId(String userId){
		this.userId = userId;
	}

	public String getUserId(){
		return this.userId;
	}

	public void setDate(LocalDateTime date){
		this.date = date;
	}

	public LocalDateTime getDate(){
		return this.date;
	}

	public void setSummary(String summary){
		this.summary = summary;
	}

	public String getSummary(){
		return this.summary;
	}

	
	public String toString(){
		return "DietMasterValue [ "
		+ "id:" + id
		+ ", userId:" + userId
		+ ", date:" + date
		+ ", summary:" + summary
		+ " ]";
	}

}


