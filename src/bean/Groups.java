package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "Groups")
public class Groups {
	@Column(type = "varchar(100)" ,field = "id" ,primaryKey = true ,defaultNull = false)
	private String id;		  //primary key, use UUID
	
	@Column(field = "ownerId" , type = "varchar(100)")
	private String ownerId;//owner id
	
	@Column(field = "memberId" , type = "varchar(100)")
	private String memberId;//member id
	
	@Column(type = "VARCHAR(100)", field = "title")
	private String title;  //title of group
	
	@Column(type = "VARCHAR(1000)", field = "description")
	private String description; //short description
	
    @Column(type = "datetime", field = "createTime")
    private String createTime;//create time
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getOwnerId() {
		return ownerId;
	}
	
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Override
	public String toString() {
		return "Groups [id=" + id + ", ownerId=" + ownerId + ", memberId=" + memberId + ", title="
				+ title + ", description=" + description + ", createTime=" + createTime + "]";
	}
 
}
