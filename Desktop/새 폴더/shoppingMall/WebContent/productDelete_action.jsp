<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section>
<c:set var="row" value="${dao.delete(param.pidx) }" />


<c:if test="${row != 0 }">
	<h3>삭제 성공</h3>
	<a href="${cpath }/productList.jsp"><button>목록으로</button></a>
</c:if>

<c:if test="${row == 0 }">
	<h3>삭제 실패</h3>
	<button onclick="history.back()">이전으로</button>
</c:if>
</section>

</body>
</html>


<%@ include file="footer.jsp" %>