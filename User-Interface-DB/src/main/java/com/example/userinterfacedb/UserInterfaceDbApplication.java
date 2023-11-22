package com.example.userinterfacedb;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@SpringBootApplication
public class UserInterfaceDbApplication {

	public static void main(String[] args) {
		SpringApplication.run(UserInterfaceDbApplication.class, args);
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource);

		// core.io
		//여기서 mapperlocation에 넣을꺼를 mybatis config 파일이 포함안되게 조심
		Resource[] resourceArray = new PathMatchingResourcePatternResolver().getResources("classpath:/mybatis/*-Mapper.xml");
		sqlSessionFactory.setMapperLocations(resourceArray);
		sqlSessionFactory.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:/mybatis/mybatis-config.xml"));

		return sqlSessionFactory.getObject();
	}

	}
