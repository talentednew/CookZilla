package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "GroupMember")
public class GroupMember {
	@Column(type = "varchar(100)" ,field = "id" ,primaryKey = true ,defaultNull = false)
	private String id;		  //primary key, use UUID, group member id in a group
	
	@Column(field = "memberId" , type = "varchar(100)")
	private String memberId;//member id
	
	@Column(type = "VARCHAR(100)", field = "groupId")
	private String groupId;  //title of group
	
    @Column(type = "datetime", field = "joinTime")
    private String joinTime;//join time
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

    public String getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(String joinTime) {
        this.joinTime = joinTime;
    }

    @Override
	public String toString() {
		return "Groups [id=" + id + ", memberId=" + memberId + ", groupId="
				+ groupId + ", joinTime=" + joinTime + "]";
	}
}
