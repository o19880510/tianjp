
package woo.diet.vo;

public class  UserValue {
	
	private String id;
	private String userName;
	private String password;
	
	public void setId(String id){
		this.id = id;
	}

	public String getId(){
		return this.id;
	}

	public void setUserName(String userName){
		this.userName = userName;
	}

	public String getUserName(){
		return this.userName;
	}

	public void setPassword(String password){
		this.password = password;
	}

	public String getPassword(){
		return this.password;
	}

	
	public String toString(){
		return "UserValue [ "
		+ "id:" + id
		+ ", userName:" + userName
		+ ", password:" + password
		+ " ]";
	}

}


