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
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
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
<div class="content" id="content" style="margin-top: 20px;">
    <div class="container">
        <div class="container">
            <div>
                <!-- 공지사항 관리자만 글쓰기 가능 처리 -->
                <c:if test='${sid eq "admin"}'>
                    <div class="button-group" style="float:right; margin-bottom: 20px;">
                        <a class="btn btn-primary px-4" href="${path }/notice/insert.do" style="width: 90px; font-size: 13px; font-weight: bold; background-color: #71A894; border:none;">글쓰기</a>
                    </div>
                </c:if>
                <!-- 검색 엔진 시작 -->
                <form action="${path}/notice/list.do" method="get" class="field has-addons has-addons-right" style="margin-top: 100px; margin-bottom: 30px;">
                <div class="input-group">
                    <select id="type" name="type" class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"/>
                        <option class="dropdown-item" value="T" style="background-color: #fff;"> 제목 </option>
                        <option class="dropdown-item" value="C" style="background-color: #fff;"> 내용 </option>
                        <option class="dropdown-item" value="W" style="background-color: #fff;"> 작성자 </option>
                    </select>
                    <input class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${page.keyword}" aria-label="Text input with 2 dropdown buttons" autocomplete="false">
                    <input type="submit" class="btn btn-outline-secondary" value="검색"/>
                </div>
                </form>
            <!-- 검색 엔진 끝 -->
            <table class="table">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th>제목</th>
                    <th scope="col" width="100">작성자</th>
                    <th scope="col" width="120">작성일</th>
                    <th scope="col" width="100">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${noticeList }" var="notice" varStatus="status">
                    <tr>
                        <th scope="row">${notice.no }</th>
                        <td><a href="${path}/notice/detail.do?no=${notice.no }"
                               style="color: #000000;">${notice.title }</a></td>
                        <td>${notice.author }</td>
                        <td>
                            <fmt:parseDate value="${notice.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                        </td>
                        <td style="text-align: center;">${notice.cnt }</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty noticeList}">
                    <tr>
                        <td colspan="6" class="has-text-centered"> 공지사항이 없습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <!-- pagnation -->
            <nav aria-label="Page navigation example" >
                <c:if test="${curPage > 5}">
                    <a href="${path}/notice/list.do?page=${page.blockStartNum - 1}"
                       class="page-link">Previous</a>
                </c:if>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <a href="${path}/notice/list.do?page=${page.blockLastNum + 1}" class="page-link">Next page</a>
                </c:if>

                <ul class="pagination justify-content-center">
                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                        <c:choose>
                            <c:when test="${i == curPage}">
                                <li class="page-item">
                                    <a href="${path}/notice/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                       class="page-link active" aria-label="Page ${i}"
                                       aria-current="page" style="background-color: #71A894; color:#FFFFFF";>${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a href="${path}/notice/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                       class="page-link" aria-label="Page ${i}" aria-current="page">${i}</a>
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