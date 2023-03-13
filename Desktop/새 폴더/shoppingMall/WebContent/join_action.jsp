<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section>
<jsp:useBean id="user" class="user_.UserDTO"/>
<jsp:setProperty property="*" name="user"/>

<c:set var="join" value="${userDAO.join(user) }" scope="session"/>

<h3>${join == 1 ? '가입 성공':'가입 실패'}</h3>

<c:if test="${join !=1 }">
<button onclick="history.back()">이전으로</button>
</c:if>
<c:if test="${join ==1 }">
<a href="${cpath }/login.jsp"><button>로그인</button></a>
</c:if>
</section>

<%@ include file="footer.jsp" %>