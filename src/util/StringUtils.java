package util;


public class StringUtils {
	/**
	 * check whether the string is null
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		return null == str  || str.equals("")
				|| str.matches("\\s*");
	}

	/**
	 * give a defaultValue for the input data
	 * @param content
	 * @param defaultValue
	 * @return
	 */
	public static String defaultValue(String content,String defaultValue){
		if(isEmpty(content)){
			return defaultValue;
		}
		return content;
	}
	
	/**
	 * change the database to Camel-Case
	 * @param column
	 * @return
	 */
	public static String columnToProperty(String column) {
		/**if the field is empty, then return empty* */
		if(isEmpty(column)) return "";
		/**get the length of field* */
		Byte length = (byte) column.length();
		
	    StringBuilder sb = new StringBuilder(length);
	    int i = 0;
	    /**traverse* */
	    for (int j = 0; j < length; j++) {
	    	 /**find the first_* */
	        if (column.charAt(j) == '_') {
	            while (column.charAt(j + 1) == '_') {
	            	j += 1;
	            }
	            sb.append(("" + column.charAt(++j)).toUpperCase());
	            
	        } else {
	        	 /**if it is not"-", then save it* */
	                sb.append(column.charAt(j));
	            }
	        }
	 
        return sb.toString();
    }
	    
    /**
	 * change the first letter of a string to uppercase
	 * @param str
	 * @return
	 */
	public static String upperCaseFirstCharacter(String str){
		StringBuilder sb = new StringBuilder();
		char[] arr = str.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			if(i==0) sb.append((arr[i] + "").toUpperCase());
			else sb.append((arr[i]+""));
		}
		return sb.toString();
	}
    
}
