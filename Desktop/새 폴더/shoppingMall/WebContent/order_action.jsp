<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="user" class="order.OrderDTO" />
<jsp:setProperty property="*" name="user"/>

<% 
	int price = Integer.parseInt(request.getParameter("price"));
	int count = Integer.parseInt(request.getParameter("count"));
	user.setTotal(price * count); %>

<section>
<h3>총 가격 : <fmt:formatNumber value="${user.total }" type="currency" /></h3>

<%-- <h3>${orderDAO.insert(user) != 0 ? '주문 성공' : '주문 실패' }</h3> --%>
<h3>${orderDAO.insert(user) == 1 ? '주문 해주셔서 감사합니다.' : '주문에 실패하였습니다.' }</h3>
	
<p><a href="${cpath }/orderOne.jsp?userid=${login.userid }"><button>주문 목록</button></a></p>
<p><a href="${cpath }"><button>홈으로</button></a></p>
</section>

<%@ include file="footer.jsp" %>