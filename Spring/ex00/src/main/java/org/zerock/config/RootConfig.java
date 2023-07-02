package org.zerock.config;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages = {"org.zerock.sample"})
@MapperScan(basePackages = {"org.zerock.mapper"})
public class RootConfig {
	
	
	@Bean
	public DataSource dataSource() {
		HikariConfig config = new HikariConfig();
		//config.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		//config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		config.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		config.setJdbcUrl("jdbc:log4jdbc:oracle:thin@localhost:1521:xe");
		config.setUsername("admin");
		config.setPassword("1234");
		
		HikariDataSource dataSource = new HikariDataSource(config);
		
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource());
		
		return (SqlSessionFactory) sqlSessionFactory.getObject();
	}
	

}
