<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dao.selectOne(param.pidx) }"/>

<section>
<div class="detail">
	<div class="detailName">${dto.name }</div>
	<hr>
	<div class="detailImg"><img src="${cpath }/upload/${dto.imgPath }" ></div>
	
	<div class="detailKind">${dto.kind }</div>
	<div class="detailPrice"><fmt:formatNumber value="${dto.price }" type="currency" /></div>

	<div class="product_content"><pre><c:out value="${dto.product_content }" /></pre></div>
	
	
	<div class="order">
		<a href="cartAdd.jsp?pidx=${dto.pidx }"><button>장바구니 담기</button></a>
		<a href="order.jsp?pidx=${dto.pidx }"><button>구매하기</button></a>
	</div>
	
	
	<c:if test="${type == 'm' }">
		<div class="productUpdate">
			<a href="productModify_form.jsp?pidx=${dto.pidx }"><button>수정</button></a>
			<a href="productDelete_action.jsp?pidx=${dto.pidx }"><button>삭제</button></a>
		</div>
	</c:if>		
</div>
</section>


<%@ include file="footer.jsp" %>