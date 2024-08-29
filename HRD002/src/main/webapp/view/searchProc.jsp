<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String choice = request.getParameter("choice");
	String find = request.getParameter("find").trim();
	
	MemberDao dao = new MemberDao();
	ArrayList<MemberVO> list = dao.getSearch(choice, find);
	
	request.setAttribute("list", list);
	request.setAttribute("choice", choice);
	request.setAttribute("find", find);
	
	System.out.println(request.getMethod());
	if(!list.isEmpty()){
		request.setAttribute("search", "yes");
		System.out.println(request.getAttribute("search"));
	}else{
		request.setAttribute("search", "no");
		System.out.println(request.getAttribute("search"));
	}
	RequestDispatcher rd = request.getRequestDispatcher("/view/search.jsp");
	rd.forward(request, response);
%>
<script>

</script>