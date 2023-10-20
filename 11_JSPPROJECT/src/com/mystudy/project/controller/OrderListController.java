package com.mystudy.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.CartDAO;
import com.mystudy.project.DAO.OrderListDAO;
import com.mystudy.project.VO.CartVO;
import com.mystudy.project.VO.OrderListVO;

@WebServlet("/orderlist")
public class OrderListController extends HttpServlet {
	int oNum = 0;
	int productNum = 0;
	String id;
	String productName;
	int cCount = 0;
	int price = 0;
	int saleprice = 0;
	String image;
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("주문내역 Controller doGet() 시작");

		String type = request.getParameter("type");
		System.out.println("> type : " + type);

		if ("list".equals(type)) {
			
		} 
		if ("delete".equals(type)) {
			String test = request.getParameter("oNum");
			System.out.println(test);
				oNum = Integer.parseInt(test);
				
				OrderListVO cart = new OrderListVO();
				cart.setoNum(oNum);
			   		    
				OrderListDAO.deleteOrderList(cart);
		}
		//DB에서 데이터 가져와서 list.jsp 페이지에서 사용토록 전달
		//1. DB연결하고 데이터 가져오기
		List<OrderListVO> list = OrderListDAO.getList();
		
		//2. 응답페이지(list.jsp)에 전달
		request.setAttribute("list", list);
		
		//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
		request.getRequestDispatcher("orderList.jsp").forward(request, response);
		
		System.out.println("주문내역 Controller doGet() 끝");	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ListController doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		System.out.println("> ListController doPost() 끝");
	}
}
