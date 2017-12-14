package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "Events")
public class Events {
	@Column(type = "varchar(100)" ,field = "id" ,primaryKey = true ,defaultNull = false)
	private String id;		  //primary key, use UUID
	
	@Column(field = "groupId" , type = "varchar(100)")
	private String groupId;//group id
	
	@Column(field = "groupTitle" , type = "varchar(100)")
	private String groupTitle;//group title
	
	@Column(type = "VARCHAR(100)", field = "title")
	private String title;  //title of group
	
	@Column(type = "VARCHAR(1000)", field = "description")
	private String description; //short description
	
    @Column(type = "datetime", field = "createTime")
    private String createTime;//create time
    
    @Column(type = "datetime", field = "eventTime")
    private String eventTime;//event time
    
    @Column(type = "VARCHAR(3)", field = "section")
    private String section;//AM or PM
    
    
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getGroupId() {
		return groupId;
	}
	
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	
	public String getGroupTitle() {
		return groupTitle;
	}
	
	public void setGroupTitle(String groupTitle) {
		this.groupTitle = groupTitle;
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
    
    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }
    
    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }
    
    @Override
	public String toString() {
		return "Groups [id=" + id + ", groupId=" + groupId + ", groupTitle=" + groupTitle + ", title="
				+ title + ", description=" + description + ", createTime=" 
				+ createTime + ", eventTime=" + eventTime + ", section=" + section + "]";
	}
 
}
