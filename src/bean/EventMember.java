package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "EventMember")
public class EventMember {
	@Column(type = "varchar(100)" ,field = "id" ,primaryKey = true ,defaultNull = false)
	private String id;		  //primary key, use UUID, member id in a event
	
	@Column(field = "memberId" , type = "varchar(100)")
	private String memberId;//member id
	
	@Column(type = "VARCHAR(100)", field = "eventId")
	private String eventId;  //title of group
	
    @Column(type = "datetime", field = "rsvpTime")
    private String rsvpTime;//RSVP time
	
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
	
	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

    public String getRsvpTime() {
        return rsvpTime;
    }

    public void setRsvpTime(String rsvpTime) {
        this.rsvpTime = rsvpTime;
    }

    @Override
	public String toString() {
		return "Groups [id=" + id + ", memberId=" + memberId + ", eventId="
				+ eventId + ", rsvpTime=" + rsvpTime + "]";
	}
}
