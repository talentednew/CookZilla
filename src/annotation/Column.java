package annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD) 		//target of annotation
@Retention(RetentionPolicy.RUNTIME)
public @interface Column {
	
	public String field() ;	//field name
	public boolean primaryKey() default false;//whether it is primary key
	public String type() default "VARCHAR(80)";//type of field
	public boolean defaultNull() default true; //whether it is null
	
}
