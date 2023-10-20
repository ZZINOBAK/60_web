package com.mystudy.project.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.project.VO.CartVO;
import com.mystudy.project.VO.OrderListVO;

public class OrderListDAO {

	//주문내역 조회
	public static List<OrderListVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("haeun.olist");
		ss.close();
		return list;
	}
	
	//주문내역 추가
	public static int insertOrderList(OrderListVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("haeun.oInsert2", test);
	    ss.close();
	    return result; 
	}
	
	//주문내역 삭제
	public static int deleteOrderList(OrderListVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("haeun.oDelete", test);
	    ss.close();
	    return result; 
	}

}
