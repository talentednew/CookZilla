package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "Review")
public class Review {

    @Column(type = "varchar(100)" ,field = "id" ,primaryKey = true ,defaultNull = false)
    private String id;          //primary，use UUID

    @Column(type = "VARCHAR(100)", field = "user_id")
    private String userId; //user ID

    @Column(type = "VARCHAR(600)", field = "content")
    private String content; //content

    @Column(type = "VARCHAR(100)", field = "recipe_id")
    private String recipeId; //recipe ID

    @Column(type = "datetime", field = "create_time")
    private String createTime;//create time
    
    @Column(type = "VARCHAR(2)", field = "rating")
    private Integer rating;//rate of recipe

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(String recipeId) {
        this.recipeId = recipeId;
    }
    
    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

}
