<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<h3>${userDAO.delete(param.idx) != 0 ? '삭제성공' :'삭제실패' }</h3>

<%

	session.removeAttribute("login");

	session.invalidate();
	response.sendRedirect(request.getContextPath());



%>


<%@ include file="footer.jsp" %>