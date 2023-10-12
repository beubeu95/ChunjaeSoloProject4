<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="Free HTML Templates" name="keywords" />
    <meta content="Free HTML Templates" name="description" />

    <title>게시판 수정하기</title>
    <jsp:include page="../setting/head.jsp" />
</head>
<body>
<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->

<!-- boardEdit Start -->
<section class="section">
    <form action="${path}/board/edit.do" method="post" class="container">
        <div class="columns">
            <div class="column is-one-quarter">
                <label for="cate"> 카테고리 </label>
                <select name="cate" id="cate" class="input">
                    <c:forEach var="category" items="${categories}">
                        <c:if test="${detail.cateName eq category.cateName}">
                            <option value="${category.cate}" selected>${category.cateName}</option>
                        </c:if>
                        <c:if test="${detail.cateName ne category.cateName}">
                            <option value="${category.cate}">${category.cateName}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="column">
                <label for="title"> 제목 </label>
                <input type="text" id="title" name="title" class="input" value="${detail.title}">
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <label for="content"> 내용 </label>
                <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required> ${detail.content} </textarea>
                <script>
                    CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/board/imageUpload.do'});
                </script>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <input type="hidden" name="bno" id="bno" value="${detail.bno}">
                <input type="submit" class="button is-fullwidth is-link" value="등록하기"/>
            </div>
        </div>
    </form>
</section>

<!-- boardEdit End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!--- Footer End -->

</body>
</html>