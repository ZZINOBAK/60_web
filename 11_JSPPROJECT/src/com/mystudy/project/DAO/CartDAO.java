package com.mystudy.project.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.project.VO.CartVO;

public class CartDAO {

	//장바구니 조회 - 전체
	public static List<CartVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<CartVO> list = ss.selectList("haeun.clist");
		ss.close();
		return list;
	}
	
	//장바구니 조회 - 하나
		public static CartVO selectOne(int test) {
			SqlSession ss = DBService.getFactory().openSession();
			CartVO list = ss.selectOne("haeun.cSelect", test);
			ss.close();
			return list;
		}
	
	//장바구니 담기
	public static int insertCart(CartVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("haeun.cInsert", test);
	    ss.close();
	    return result; 
	}
	
	//장바구니 수정
	public static int updateCart(CartVO test) {
		SqlSession ss = DBService.getFactory().openSession(false);
		int result = ss.update("haeun.cUpdate", test);
	    if (result == 1) {
	        ss.commit();
	    } else {
	        // 예외 처리: Update가 실패한 경우 예외를 발생시키거나 처리합니다.
	        // 여기에서는 RuntimeException을 예외로 던집니다.
	        System.out.println("실패");
	    }
	    ss.close();
	    return result;
	}
	
	//장바구니 삭제
	public static int deleteCart(CartVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("haeun.cDelete", test);
	    ss.close();
	    return result; 
	}
}





