package com.mystudy.model.dao;
//haeun
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.model.vo.EmployeeVO;
import com.mystudy.mybatis.DBService;

public class EmployeeDAO {

	//전체 직원 목록 조회
	public static List<EmployeeVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("hr.list");
		ss.close();
		return list;
	}
	
	//부서 직원 목록 조회
	public static List<EmployeeVO> getDeptList(String deptno) {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("hr.deptList", deptno);
		ss.close();
		return list;
	}
	
	//부서 직원 조회
	public static EmployeeVO getDept(String deptno) {
		SqlSession ss = DBService.getFactory().openSession();
		EmployeeVO list = ss.selectOne("hr.dept", deptno);
		ss.close();
		
		return list;
	}
	
	//부서 직원 이름 목록 조회
	public static List<EmployeeVO> getFullNameList(String name) {
		SqlSession ss = DBService.getFactory().openSession();
		System.out.println("DAO name : " + name);
		List<EmployeeVO> list = ss.selectList("hr.fullnameList", name);
		System.out.println("DAO name : " + name);
		ss.close();
		return list;
	}
	
	public static EmployeeVO getFullName(String name) {
		SqlSession ss = DBService.getFactory().openSession();
		EmployeeVO list = ss.selectOne("hr.fullname", name);
		ss.close();
		
		return list;
	}
	
}





