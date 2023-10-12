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

    <title>자유게시판</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 자유게시판 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">자유게시판</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- BoardList Start -->
<div class="content" id="content" style="margin-top: 20px;">
    <div class="container">
        <div class="container">
            <div>
                <c:if test="${sid ne null}">
                    <div class="button-group" style="float:right; margin-bottom: 20px;">
                        <a class="btn btn-primary px-4" href="${path}/board/insert.do" class="button is-primary" style="width: 90px; font-size: 13px; font-weight: bold; background-color: #71A894; border:none;">글쓰기</a>
                    </div>
                </c:if>
                <div class="btn-group btn-group-toggle mb-5" data-toggle="buttons" style="display: flex;width: 70%; justify-content: center; margin: 50px auto;">
                    <c:if test="${empty curCategory}">
                    <label class="btn btn-primary active" style=" background-color: #71A894; border: none; font-weight: bold;">
                        </c:if>
                        <c:if test="${!empty curCategory}">
                        <label class="btn btn-primary" style=" background-color: lightgray; color:#000000;  border: none; font-weight: bold;">
                            </c:if>
                            <input type="radio" checked="checked" onclick="javascript:location.href='${path}/board/list.do'" style="opacity: 0;"/> 전체
                        </label>
                        <c:forEach var="cate" items="${categories}">
                        <c:if test="${cate.cate eq curCategory}">
                        <label class="btn btn-primary active" style=" background-color: #71A894; border: none; font-weight: bold;">
                            </c:if>
                            <c:if test="${cate.cate ne curCategory}">
                            <label class="btn btn-primary" style=" background-color: lightgray; color:#000000; border: none; font-weight: bold;">
                                </c:if>
                                <input type="radio" checked="checked" onclick="javascript:location.href='${path}/board/list.do?cate=${cate.cate}'" style="opacity: 0;"/> ${cate.cateName}
                            </label>
                            </c:forEach>
                </div>
                <!-- 검색 엔진 시작 -->
                <form action="${path}/board/list.do" method="get" class="field has-addons has-addons-right" style="margin-top: 100px; margin-bottom: 30px;">
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
                        <th class="has-text-centered" width="100"> # </th>
                        <th class="has-text-centered" width="130"> 카테고리 </th>
                        <th class="has-text-centered"> 제목 </th>
                        <th class="has-text-centered" width="150"> 작성자 </th>
                        <th class="has-text-centered" width="150"> 작성일 </th>
                        <th class="has-text-centered" width="80"> 조회수 </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${list}">
                        <tr onclick="location.href='${path}/board/getBoard.do?bno=${item.bno}&page=${curPage}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>'" style="cursor: pointer">
                            <th class="has-text-centered">${item.bno}</th>
                            <td class="has-text-centered">${item.cateName}</td>
                            <td width="300">${item.title}</td>
                            <td class="has-text-centered">${item.author}</td>
                            <td class="has-text-centered"><fmt:parseDate value="${item.resdate}" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" /></td>
                            <td class="has-text-centered" width="80">${item.cnt}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty list}">
                        <tr>
                            <td colspan="6" class="has-text-centered"> 게시글이 없습니다. </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
                <!-- pagnation -->
                <nav aria-label="Page navigation example" >
                    <c:if test="${curPage > 5}">
                        <a href="${path}/board/list.do?page=${page.blockStartNum - 1}"
                           class="page-link">Previous</a>
                    </c:if>
                    <c:if test="${page.blockLastNum < page.totalPageCount}">
                        <a href="${path}/board/list.do?page=${page.blockLastNum + 1}" class="page-link">Next page</a>
                    </c:if>

                    <ul class="pagination justify-content-center">
                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                            <c:choose>
                                <c:when test="${i == curPage}">
                                    <li class="page-item">
                                        <a href="${path}/board/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                           class="page-link active" aria-label="Page ${i}"
                                           aria-current="page" style="background-color: #71A894; color:#FFFFFF";>${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a href="${path}/board/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
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
</div>
<!-- BoardList End -->


<!--Footer Start-->
<jsp:include page="../setting/footer.jsp" />
<!--Footer End-->
</body>
</html>