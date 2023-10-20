package com.mystudy.project.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.OrderListDAO;
import com.mystudy.project.VO.OrderListVO;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {
	int oNum = 0;
	int productNum = 0;
	String id;
	int cCount = 0;
	Date oDate;
	String payment;
	String productName;
	int price = 0;
	int saleprice = 0;
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
	
		if ("list".equals(type)) {
			
		} 
		if ("insert".equals(type)) {
//			String[] selectedItems = request.getParameterValues("productNum");
//
//			for (int i = 0; i < selectedItems.length; i++) {
//				System.out.println(selectedItems[i]);
//				
//				productNum = Integer.parseInt(request.getParameter("productNum"));
//				id = "test";
//				productName = request.getParameter("productName");
//				cCount = Integer.parseInt(request.getParameter("cCount"));
//				price = Integer.parseInt(request.getParameter("price"));
//				saleprice = Integer.parseInt(request.getParameter("saleprice"));
//				
//				//리스트랑 다르게 일단 전달받은 파라미터값으로 set 먼저 하기
//				OrderListVO cart = new OrderListVO();
//			    cart.setProductNum(productNum); // 예시: 상품 번호
//			    cart.setId(id); // 예시: 사용자 아이디
//			    cart.setProductName(productName); // 예시: 상품명
//			    cart.setcCount(cCount); // 예시: 수량
//			    cart.setPrice(price);
//			    cart.setSaleprice(saleprice);
//			   		    
//			    System.out.println(cart);
//			    OrderListDAO.insertOrderList(cart);
//			}
			
		}
		List<OrderListVO> list = OrderListDAO.getList();
		
		//2. 응답페이지(list.jsp)에 전달
		request.setAttribute("list", list);
		
		//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
		request.getRequestDispatcher("payment.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ListController doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		System.out.println("> ListController doPost() 끝");
	}
}
