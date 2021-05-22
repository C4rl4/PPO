package conection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class BDconeccao {
	
	private static Connection connection = null;
	//PreparedStatement sql = null;
	
	public static Connection getConnection() {
		if(connection!=null) 
			return connection;
		else {
			try {
				Properties prop = new Properties();
				String user = "root";
                String password = "07081981";
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_ppo?useTimezone=true&serverTimezone=UTC", user, password);
                
			}
			catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return connection;
		}
		
		
	}
	
	

}
