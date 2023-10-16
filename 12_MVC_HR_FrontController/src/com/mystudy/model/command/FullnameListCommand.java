package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;

public class FullnameListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// fullname 요청 처리(입력폼/직원목록)
		//0. 파라미터 값 확인(추출)
		String name = request.getParameter("name");
		
		EmployeeVO list = EmployeeDAO.getFullNameList(name);
		
		request.setAttribute("list", list);
		
		String path = null;
		if (name == null) {
			path = "fullname.jsp";
		} else {
			path = "fullnameList.jsp";
		}
		
		return path;
	}

}
