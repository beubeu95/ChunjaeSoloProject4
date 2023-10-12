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

    <title>게시판 추가하기</title>
    <jsp:include page="../setting/head.jsp" />
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->


<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 게시판 추가하기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">게시판 추가하기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->


<!-- boardInsert Start -->
<section class="section">
    <form action="${path}/board/insert.do" method="post" class="container">
        <div class="row mb-3">
            <div class="col-md-3">
                <label for="cate" class="form-label">카테고리</label>
                <select name="cate" id="cate" class="form-select">
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.cate}">${category.cateName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col">
                <label for="title" class="form-label">제목</label>
                <input type="text" id="title" name="title" class="form-control">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label for="content" class="form-label">내용</label>
                <textarea name="content" id="content" class="form-control" placeholder="내용 입력" rows="8" maxlength="1400" required></textarea>
                <script>
                    CKEDITOR.replace('content', { filebrowserUploadUrl: '${path}/board/imageUpload.do' });
                </script>
            </div>
        </div>
        <div class="row">
            <div class="col d-flex justify-content-end mt-3">
                <button type="submit" class="btn btn-link" style="background-color: #71A894; color:#ffffff;">등록하기</button>
            </div>
        </div>
    </form>
</section>

<!-- boardInsert End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->

</body>
</html>