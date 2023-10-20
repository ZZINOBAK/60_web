package com.mystudy.project.controller;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/purchase")
public class PurchaseController extends HttpServlet {
	int cNum = 0;
	int productNum = 0;
	String id;
	String productName;
	int cCount = 0;
	int price = 0;
	int saleprice = 0;
	String image;
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test");
		
		String[] selectedItems = request.getParameterValues("selectedItems");

		for (int i = 0; i < selectedItems.length; i++) {
			productNum = Integer.parseInt(selectedItems[i]);
			
			OrderListVO cart = new OrderListVO();
			cart.setProductNum(productNum);
			
			OrderListDAO.insertOrderList(cart);
		}
		
		List<OrderListVO> list = OrderListDAO.getList();
		
		//2. 응답페이지(list.jsp)에 전달
		request.setAttribute("list", list);
		
		//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
		request.getRequestDispatcher("purchase.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ListController doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		System.out.println("> ListController doPost() 끝");
	}
}
