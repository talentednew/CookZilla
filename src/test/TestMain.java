package test;

import bean.EventMember;
import bean.Events;
import bean.GroupMember;
import bean.Groups;
import bean.Recipe;
import bean.Review;
import bean.User;
import util.TableUtils;

public class TestMain {
	public static void main(String[] args) {
		String sql = TableUtils.getCreateTableSQl(EventMember.class);
		System.out.println(sql);
	}	
}
