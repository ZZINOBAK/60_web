package com.mystudy.mybatis;


import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// MyBatis 사용해서 작업할 SqlSession 을 만들어 줄
// SqlSessionFactory 객체 생성을 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	// static 초기화 구문
	static {
		try {
			/*
			 코드 풀면 이렇게 쓰는거고
			SqlSessionFactoryBuilder factoryBuilder = new SqlSessionFactoryBuilder();
			Reader reader = Resources.getResourceAsReader("com/mystudy/mybatis/config.xml");
			factory = factoryBuilder.build(reader);
			*/ 
			// 코드 간략히 쓰면 이 아래처럼 쓰는건가봄.
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/mystudy/mybatis/config.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}






