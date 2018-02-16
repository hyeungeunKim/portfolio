package kr.co.green;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MyBatisTest {
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory() throws Exception{
		System.out.println("######################");
		System.out.println(sqlFactory);
		System.out.println("######################");
	}
	@Test
	public void testSession() throws Exception{
		SqlSession session = null;
		try {
			System.out.println("@@@@@@@@@@@@@@@");
			session=sqlFactory.openSession();
			System.out.println(session);
			System.out.println("@@@@@@@@@@@@@@@");
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			try {
				if(session!=null)session.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
