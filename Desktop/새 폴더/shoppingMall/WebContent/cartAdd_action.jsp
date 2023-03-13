<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<jsp:useBean id="ca" class="cart.Cart"/>
<jsp:setProperty property="*" name="ca"/>





<c:choose>
<c:when test="${empty list }" >
<c:set var="list" value="<%=new ArrayList<Cart>() %>" scope="session" />
${list.add(ca) ? '' : '실패' }
</c:when>


<c:when test="${not empty list }">
${list.add(ca) ? '' : '실패' }
</c:when>
</c:choose>

	
<section>
<h3>${ca != null ? '장바구니 추가 성공' : '장바구니 추가 실패' }</h3>
<p><a href="cartList.jsp"><button>장바구니 목록 보기</button></a></p>
<p><a href="${cpath }"><button>홈으로</button></a></p>
</section>



<%@ include file="footer.jsp" %>