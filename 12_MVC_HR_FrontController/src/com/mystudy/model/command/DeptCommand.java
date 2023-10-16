package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;

public class DeptCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getRequestDispatcher("dept.jsp").forward(request, response);
		
		String deptno = request.getParameter("deptno");
		
		EmployeeVO list = EmployeeDAO.getDept(deptno);
		
		request.setAttribute("list", list);
		
		return "dept.jsp";
	}

}
