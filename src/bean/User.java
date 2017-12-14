package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "User")
public class User{
	
	@Column(type = "varchar(100)" ,field = "id" ,primaryKey = true ,defaultNull = false)
	private String id;		  //primary key，useUUID
	
	@Column(type = "VARCHAR(20)", field = "username")
	private String username;  //login name
	
	@Column(type = "VARCHAR(20)", field = "username1")
	private String username1;  //user name
	
	@Column(type = "VARCHAR(20)", field = "password")
	private String password;  //password
	
	@Column(type = "VARCHAR(60)", field = "headerPic")
	private String headerPic; //head portrait
	
    @Column(type = "datetime", field = "createTime")
    private String createTime;//create time
	
	@Column(type = "VARCHAR(2)", field = "sex")
	private Integer sex;	  //gender 0male 1female 3private
	
	@Column(type = "VARCHAR(100)", field = "shortProfile")
	private String shortProfile;	 
	
	@Column(type = "VARCHAR(100)", field = "groupId")
	private String groupId;	  //group joined
	
	@Column(type = "VARCHAR(100)", field = "eventId")
	private String eventId;	  //event attended
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUsername1() {
		return username1;
	}
	public void setUsername1(String username1) {
		this.username1 = username1;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHeaderPic() {
		return headerPic;
	}
	public void setHeaderPic(String headerPic) {
		this.headerPic = headerPic;
	}

	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    
    public String getShortProfile() {
        return shortProfile;
    }

    public void setShortProfile(String shortProfile) {
        this.shortProfile = shortProfile;
    }
    
    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }
    
    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }
    

	@Override
	public String toString() {
		return "User [id=" + id + ", Login name=" + username + ", username1=" + username1 + ", password="
				+ password + ", headerPic=" + headerPic + ", sex=" + sex + ", createTime=" + createTime + ", shortProfile=" 
				+ shortProfile + ", groupId=" + groupId + ", eventId=" + eventId + "]";
	}
	
	
}
