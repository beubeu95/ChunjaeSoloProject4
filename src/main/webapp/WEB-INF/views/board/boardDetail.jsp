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

    <title>게시판 상세보기</title>
    <jsp:include page="../setting/head.jsp" />
</head>
<body>
<!-- Header Start-->
<jsp:include page="../setting/header.jsp" />
<!-- Header End -->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 게시판 상세보기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">게시판 상세보기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- boardDetail Start -->
<section style="padding-top: 0;">
    <div style="width: 95%; display: inline-block; margin-top: 100px;">
        <button class="btn btn-light btn-lg" style="width:200px; float: right; background-color: #71a894; font-weight: bold; color: #fff;"><a href="${path}/board/list.do?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" style="color: #fff;">목록</a></button>
        <c:if test="${(sid eq 'admin') or (sid eq detail.author)}">
            <button class="btn btn-light btn-lg" style="width:200px; float: right; border-color: #000000; font-weight: bold; margin-left: 10px; margin-right: 10px; "><a href="${path}/board/delete.do?bno=${detail.bno}" >삭제</a></button>
            <button class="btn btn-dark btn-lg" style="width:200px; float: right; background-color: #4f5665; font-weight: bold; "><a class="button" href="${path}/board/edit.do?bno=${detail.bno}" style="color: #fff;">수정</a></button>
        </c:if>
    </div>
    <div style="display: flex; justify-content: center; margin-top: 20px;">
        <div class="card" style="width: 90%;">
            <div class="card-body" >
                <div class="card-title" style="padding-bottom: 20px; border-bottom: 1px solid;">
                    <div class="d-flex align-items-center mt-3">
                        <div class="ms-3">
                            <p class="mb-0" style="font-weight: bold; padding-bottom: 5px;"> ${detail.cateName}</p>
                            <h3>${detail.title}</h3>
                            <p class="mb-0">작성자 | ${detail.author} 작성일 | <fmt:parseDate value="${detail.resdate}" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" /> 조회수 | ${detail.cnt}</p>
                        </div>
                    </div>
                </div>
                <div class="card-text mt-4">
                    <div class="ms-3">
                        <p style="padding-top: 30px; padding-bottom: 100px;}">${detail.content}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="margin: 100px auto; width: 90%;">
        <div class="card box-shadow-rb my-4">

        </div>
    </div>
</section>
<!-- boardDetail End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>