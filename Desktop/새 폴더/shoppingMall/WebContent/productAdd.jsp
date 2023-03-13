<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>

<h3>상품추가</h3>
<form enctype="multipart/form-data" action="productAdd_action.jsp" Method="POST">
	<p>상품명　　<input type="text" name="name" placeholder="상품명" required></p>
	<p>상품옵션　<select name="kind" required>
		<option value="">========= 옵션 선택 =========</option>
		<option value="상의">상의</option>
        <option value="하의">하의</option>
        <option value="신발">신발</option>	
        <option value="악세사리">악세사리</option>	
	</select></p>
	<p>가격　　　<input type="number" name="price" placeholder="가격" required></p>
	<p>이미지　　<input type="file" name="uploadFile" required></p>
	<p>상세설명</p>
	<textarea rows="30" cols="50" name="product_content" placeholder="상품 상세 설명"></textarea>
	<p><input type="submit" value="등록"></p>
	
</form>
</section>



<%@ include file="footer.jsp" %>