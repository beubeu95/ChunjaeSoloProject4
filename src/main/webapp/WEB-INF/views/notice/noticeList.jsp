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

    <title>공지사항</title>
    <jsp:include page="../setting/head.jsp" />
</head>
<body>
<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid bg-primary mb-5">
        <div class="has-text-centered" style="padding-top: 60px;">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 공지사항 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">공지사항</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- Notice Start-->
<div class="container-fluid pt-5 pb-3">
    <div class="container">
        <div class="text-center pb-2">
            <p class="section-title px-5">
                <span class="px-2">공지사항</span>
            </p>
            <h1 class="mb-4">공지사항 목록</h1>
        </div>
        <div class="row portfolio-container">
                <table class="table">
                    <thead>
                    <tr>
                        <th width="80">번호</th>
                        <th>제목</th>
                        <th width="100">작성자</th>
                        <th width="120">작성일</th>
                        <th width="100">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${noticeList }" var="notice" varStatus="status">
                        <tr>
                            <td>${status.count }</td>
                            <td ><a href="${path}/notice/detail.do?no=${notice.no }" style="color: #000000; text-decoration: none;">${notice.title }</a></td>
                            <td>${notice.author }</td>
                            <td>
                                <fmt:parseDate value="${notice.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                            </td>
                            <td style="text-align: center;">${notice.cnt }</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty noticeList}">
                        <tr>
                            <td colspan="6" class="has-text-centered"> 공지사항이 없습니다. </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
                <!-- pagnation -->
                <nav class="Page navigation example" role="navigation" aria-label="pagination">
                    <c:if test="${curPage > 5}">
                        <a href="${path}/notice/list.do?page=${page.blockStartNum - 1}" class="page-link " style="background-color: #FF0043;" >Previous</a>
                    </c:if>
                    <c:if test="${page.blockLastNum < page.totalPageCount}">
                        <a href="${path}/notice/list.do?page=${page.blockLastNum + 1}" class="page-link" style="background-color: #FF0043;">Next page</a>
                    </c:if>

                    <ul class="pagination justify-content-center">
                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                            <c:choose>
                                <c:when test="${i == curPage}">
                                    <li class="page-item active">
                                        <a href="${path}/notice/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a href="${path}/notice/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </nav>
        </div>
    </div>
</div>
<!-- Notice End-->

<!--Footer Start-->
<jsp:include page="../setting/footer.jsp" />
<!--Footer End-->
</body>
</html>