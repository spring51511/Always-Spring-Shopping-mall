<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${qnaDAO.delete(param.QnAidx) }" />

<section>
<c:if test="${row != 0 }">
	<h3>삭제 성공</h3>
	<a href="${cpath }/qna.jsp"><button>목록으로</button></a>
</c:if>

<c:if test="${row == 0 }">
	<h3>삭제 실패</h3>
	<button onclick="history.back()">이전으로</button>
</c:if>
</section>



<%@ include file="footer.jsp" %>