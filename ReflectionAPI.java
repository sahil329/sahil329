// Oracle doc : https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html

import java.lang.reflect.Field;
import java.lang.reflect.Method;

class Example{
    int id;
    String name;
    
    public Example(int id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public String getMagicString() {
        return Integer.toString(this.id)+" "+this.name;
    }
    
    public String getReverseName() {
        var temp = new StringBuilder(this.name);
        return temp.reverse().toString();
    }
}

public class ReflectionAPI
{
	public static void main(String[] args) {
		var e = new Example(23, "Sahil");
		
		var ob = e.getClass();
		
		System.out.println("\n> Example obj's attributes");
		for(Field field : ob.getDeclaredFields()) {
           //you can also use .toGenericString() instead of .getName(). This will
           //give you the type information as well.
    
           System.out.println(field.getName());
        }
       
       System.out.println("\n> Example obj's methods");
       for(Method method : ob.getDeclaredMethods()) {
           System.out.println(method.getName());
       }
	}
}

/*  Output:

> Example obj's attributes
id
name

> Example obj's methods
getMagicString
getReverseName

*/
