package kr.co.green;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class ConnectionTest {
	
	@Test
	public void testConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=null;
		
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "green","green");
		
		conn.close();
		
	}

}
