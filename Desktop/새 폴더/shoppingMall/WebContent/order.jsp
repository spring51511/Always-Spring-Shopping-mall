<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
<div class="h3Form"><h3>주문서</h3></div>
<form method="POST" action="order_action.jsp?pidx=${param.pidx }">
	<p>주문자아이디　<input type="text" name="userid" placeholder="${login.userid == null ? '비회원' : login.userid }" value="${login.userid }" readonly ></p>
	<p>제품번호　　　<input type="number" name="pidx" value="${param.pidx }" readonly ></p>
	<p>제품명　　　　<input type="text" name="productName" value="${dao.selectOne(param.pidx).name }" readonly ></p>
	<p>주문자이름　　<input type="text" name="userName" value="${login.name }" required ></p>
	<p>배송주소　　　<input type="text" name="address" value="${login.address }" required ></p>
	<p>전화번호　　　<input type="text" name="phone" value="${login.phone }" required /></p>
	<p>구매수량　　　<input type="number" name="count" placeholder="구매 수량" min="0" required /></p>
	<p>개당가격　　　<input type="number" name="price" value="${dao.selectOne(param.pidx).price }" readonly></p>
	<p>　　　　　　　<input type="submit" value="구매"></p>
</form>	
</section>
	

<%@ include file="footer.jsp" %>