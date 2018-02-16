package kr.co.green;

import java.sql.Connection;


import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DataSourceTest {
	@Autowired
	//@Inject
	private DataSource ds;
	@Test
	public void testConnection() throws Exception{
		Connection con=null;
		try {
			System.out.println("***************************");
			con=ds.getConnection();
			System.out.println("***************************");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
}
