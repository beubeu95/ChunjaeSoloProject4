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
            <div class="card-body my-3 mx-4">
                <c:if test="${sid ne null}">
                    <form action="${path}/comment/insert.do" method="post" >
                    <div style="display: flex;">
                       <div class="form-group" style="width: 90%">
                            <textarea name="content" id="content" class="form-control" maxlength="990" rows="2" placeholder="댓글을 달아주세요 :)"></textarea>
                        </div>
                        <div class="col" style="margin-left: 50px;">
                            <input type="hidden" id="bno" name="bno" value="${detail.bno}">
                            <input type="hidden" id="page" name="page" value="${curPage}">
                            <c:if test="${!empty cate}">
                                <input type="hidden" id="cate" name="cate" value="${cate}">
                            </c:if>
                            <c:if test="${!empty keyword}">
                                <input type="hidden" id="type" name="type" value="${type}">
                                <input type="hidden" id="keyword" name="keyword" value="${keyword}">
                            </c:if>
                                <input type="submit" class="btn btn-secondary btn-block border-0 py-3" style="height:72px; width: 150px;" value="전송">
                            </div>
                        </div>`
                    </form>
                </c:if>
            </div>
            <div class="card-body my-3 mx-4" style="width: 80%;">
                <c:forEach var="comment" items="${commentList}">
                    <div class="row">
                            <h6 style="width: 75%;" > ${comment.author} </h6>
                            <h6 class="text-right" style="margin-top: 3px; padding: 0; width: 10%;">
                                <fmt:parseDate value="${comment.resdate}" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                            </h6>
                        <c:if test="${(sid eq 'admin') or (sid eq comment.author)}">
                            <a style="width: 10%; margin-bottom: 10px;" href="${path}/comment/delete.do?comNo=${comment.comNo}&bno=${detail.bno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="btn btn-sm btn-danger">Delete</a>
                        </c:if>
                    </div>
                    <div class="row">
                        <div class="col" style=" margin-bottom: 30px;">
                            <textarea class="form-control" style="background-color: lightgray;" readonly>${comment.content}</textarea>
                        </div>
                    </div>
                </c:forEach>
                <!-- Pagination -->
                <nav class="mt-5 mb-6">
                    <ul class="pagination justify-content-center">
                        <c:if test="${commentPage > 5}">
                            <li class="page-item">
                                <a href="${path}/board/getBoard.do?bno=${detail.bno}&page=${curPage}&commentPage=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link">Previous</a>
                            </li>
                        </c:if>
                        <c:if test="${page.blockLastNum < page.totalPageCount}">
                            <li class="page-item">
                                <a href="${path}/board/getBoard.do?bno=${detail.bno}&page=${curPage}&commentPage=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link">Next page</a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                            <li class="page-item">
                                <c:choose>
                                    <c:when test="${i == commentPage}">
                                        <a href="${path}/board/getBoard.do?bno=${detail.bno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link active" style="background-color: #71A894; color:#FFFFFF;" aria-current="page">${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${path}/board/getBoard.do?bno=${detail.bno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- boardDetail End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>