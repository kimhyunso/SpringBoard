package org.zerock.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;


@Log4j
public class JDBCTests {
	
	static {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	@Test
	public void testConnection() {
		try (Connection con = 
				DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe",
				"admin",
				"1234"
				)){
			
			log.info(con);
		}catch(Exception e) {
			
		}
	}

}
