package com.mystudy.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjuk")
public class Ex05 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
				//(실습) 전달받은 데이터를 연산처리 후 결과를 응답처리
				//1. 전달받은 데이터(파라미터) 값 추출(확인)
				//2. 계산처리 - 총점, 평균
				//3. 응답처리(출력) - 브라우저(사용자)쪽으로 HTML태그 작성
		System.out.println("> Ex05.doGet() 실행~~~");

		String name = req.getParameter("name");
		int kor = Integer.parseInt(req.getParameter("kor"));
		int eng = Integer.parseInt(req.getParameter("eng"));
		int math = Integer.parseInt(req.getParameter("math"));
		
		int tot = kor + eng + math;
		int avg = tot / 3;
		
		System.out.println(name + ", " + kor + ", " + eng  + ", " + math);
		System.out.println("총점 : " + tot + ", 평균 : " + avg);
		
		// 브라우저에 출력해보기
		resp.getWriter().println("<h1>" + name + ", " + kor + ", " + eng  + ", " + math + "</h1>");
		resp.getWriter().println("<h2>" + "총점 : " + tot + ", 평균 : " + avg + "</h2>");

		
	}

}
