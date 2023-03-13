<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
<c:set var="dto" value="${dao.selectOne(param.pidx) }"/>

<h3>수정하기</h3>

<form Method="POST" enctype="multipart/form-data" action="productModify_action.jsp?pidx=${dto.pidx }"> 
	<p><input type="number" name="pidx" value="${dto.pidx }" readonly></p>
	<p><input type="text" name="name" placeholder="상품명" value="${dto.name }" required></p>
	<p><select name="kind" required>
		<option value="">=== 옵션 선택 ===</option>
		<option value="상의" ${dto.kind == '상의' ? 'selected' : '' }>상의</option>
        <option value="하의" ${dto.kind == '하의' ? 'selected' : '' }>하의</option>
        <option value="신발" ${dto.kind == '신발' ? 'selected' : '' }>신발</option>	
        <option value="악세사리" ${dto.kind == '악세사리' ? 'selected' : '' }>악세사리</option>	
	</select></p>
	<p><input type="number" name="price" placeholder="가격" value="${dto.price }" required></p>
	<p><input type="file" name="uploadFile" required></p>
	<p><textarea rows="30" cols="50" name="product_content" placeholder="상품 설명">${dto.product_content }</textarea></p>
	<p><input type="submit" value="수정"></p>

</form>
</section>

<%@ include file="footer.jsp" %>