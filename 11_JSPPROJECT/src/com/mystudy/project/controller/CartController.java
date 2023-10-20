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
import com.mystudy.project.VO.CartVO;

@WebServlet("/cart")
public class CartController extends HttpServlet {
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
		System.out.println("> ListController doGet() 시작");
		System.out.println(">>> doGet 업무처리 ~~~~");

		String type = request.getParameter("type");
		System.out.println("> type : " + type);

		if ("list".equals(type)) {
			
		} 
		if ("insert".equals(type)) {
			productNum = Integer.parseInt(request.getParameter("productNum"));
			id = request.getParameter("id");
			productName = request.getParameter("productName");
			cCount = Integer.parseInt(request.getParameter("cCount"));
			price = Integer.parseInt(request.getParameter("price"));
			saleprice = Integer.parseInt(request.getParameter("saleprice"));
			image = request.getParameter("image");
			
			System.out.println(productNum);
			CartVO list = CartDAO.selectOne(productNum);
			System.out.println(list);
			
			if (list != null && list.getProductNum() == productNum) {
				CartVO cart = new CartVO();
				cart.setcNum(list.getcNum());
				cart.setcCount(cCount+list.getcCount());
				System.out.println(list.getcNum());
				System.out.println(cCount);
				
			    CartDAO.updateCart(cart);

			} else {
				//리스트랑 다르게 일단 전달받은 파라미터값으로 set 먼저 하기
				CartVO cart = new CartVO();
			    cart.setProductNum(productNum); // 예시: 상품 번호
			    cart.setId(id); // 예시: 사용자 아이디
			    cart.setProductName(productName); // 예시: 상품명
			    cart.setcCount(cCount); // 예시: 수량
			    cart.setPrice(price); // 예시: 상품 가격
			    cart.setSaleprice(saleprice); // 예시: 할인 가격
			    cart.setImage(image); // 예시: 상품 이미지 경로
			   		    
			    CartDAO.insertCart(cart);
			}
		}
		if ("update".equals(type)) {
			String[] cartupdate = request.getParameterValues("cCount");
			String[] cartupdate1 = request.getParameterValues("cNum");
			
			for (int i = 0; i < cartupdate.length; i++) {
				System.out.println(cartupdate[i]);
				System.out.println(cartupdate1[i]);
				
				cNum = Integer.parseInt(cartupdate1[i]);
				cCount = Integer.parseInt(cartupdate[i]);
	
				CartVO cart = new CartVO();
				cart.setcNum(cNum); 
			    cart.setcCount(cCount); 
			   		    
			    CartDAO.updateCart(cart);
			}
		}
		if ("delete".equals(type)) {
			String[] selectedItems = request.getParameterValues("selectedItems");

			for (int i = 0; i < selectedItems.length; i++) {
				productNum = Integer.parseInt(selectedItems[i]);
				
				CartVO cart = new CartVO();
				cart.setProductNum(productNum);
			   		    
			    CartDAO.deleteCart(cart);
			}
		}
		//DB에서 데이터 가져와서 list.jsp 페이지에서 사용토록 전달
		//1. DB연결하고 데이터 가져오기
		List<CartVO> list = CartDAO.getList();
		
		//2. 응답페이지(list.jsp)에 전달
		request.setAttribute("list", list);
		
		//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
		request.getRequestDispatcher("cart.jsp").forward(request, response);
		
		System.out.println("> ListController doGet() 끝");	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ListController doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		System.out.println("> ListController doPost() 끝");
	}

}
