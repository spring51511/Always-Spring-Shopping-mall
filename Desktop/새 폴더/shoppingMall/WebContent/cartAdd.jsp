<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
<form method="POST" action="cartAdd_action.jsp?pidx=${param.pidx }">
	<p>제품번호　<input type="number" name="pidx" value="${param.pidx }" readonly></p>
	<p>제품명　　<input type="text" name="name" value="${dao.selectOne(param.pidx).name }" readonly></p>
	<p>구매 수량　<input type="number" name="count" placeholder="구매 수량" min="0" required /></p>
	<p>개당 가격　<input type="number" name="price" value="${dao.selectOne(param.pidx).price }" readonly></p>
	<p>　　　　　 <input type="submit" value="장바구니 추가"></p>
</form>	


</section>


<%@ include file="footer.jsp" %>