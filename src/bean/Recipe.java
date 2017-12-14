package bean;

import java.util.Date;

import annotation.Column;
import annotation.Table;

@Table(tableName = "Recipe")
public class Recipe {
	
	@Column(field = "id" , type = "varchar(100)" , primaryKey = true, defaultNull = false)
	private String id; //primary key
	
	@Column(field = "header" , type = "varchar(100)")
	private String header; //title
	
	@Column(field = "name" , type = "varchar(200)")
	private String name; //description
	
	@Column(field = "content" , type = "text")
	private String content; //content
	 
	@Column(field = "author" , type = "varchar(30)")
	private String author; //username1
	
	@Column(field = "create_time" , type = "datetime")
	private Date createTime;//create time
	
	@Column(field = "user_id" , type = "varchar(100)" , defaultNull = false)
	private String userId;//author id
	
	@Column(field = "category_id" , type = "int(2)" , defaultNull = false)
	private Integer categoryId;//tag id
	
	@Column(field = "ingredient1" , type = "varchar(100)")
	private String ingredient1;//ingredient1
	
	@Column(field = "ingredient2" , type = "varchar(200)")
	private String ingredient2;//ingredient2

	@Column(type = "VARCHAR(60)", field = "pic")
	private String pic; //portrait

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
	public String getIngredient1() {
		return ingredient1;
	}

	public void setIngredient1(String ingredient1) {
		this.ingredient1 = ingredient1;
	}
	
	public String getIngredient2() {
		return ingredient2;
	}

	public void setIngredient2(String ingredient2) {
		this.ingredient2 = ingredient2;
	}
	
	public String getPic() {
		return pic;
	}
	
	public void setPic(String pic) {
		this.pic = pic;
	}


	@Override
	public String toString() {
		return "Recipe [id=" + id + ", header=" + header + ", name=" + name + ", content=" + content + ", author="
				+ author + ", createTime=" + createTime + ", userId=" + userId + ", categoryId=" + categoryId + ", ingredient1="
				+ ingredient1 + ", ingredient2=" + ingredient2 + ", pic=" + pic + "]";
	}
}