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

<!-- BoardList Start -->
<section class="section">
    <div class="container">
        <div class="buttons has-addons is-centered mb-5">
            <c:if test="${empty curCategory}">
                <label class="button is-primary is-active">
            </c:if>
            <c:if test="${!empty curCategory}">
                <label class="button is-primary">
            </c:if>
                    <input type="radio" checked="checked" onclick="javascript:location.href='${path}/board/list.do'"/> 전체
                </label>
            <c:forEach var="cate" items="${categories}">
                <c:if test="${cate.cate eq curCategory}">
                    <label class="button is-primary is-active">
                </c:if>
                <c:if test="${cate.cate ne curCategory}">
                    <label class="button is-primary">
                </c:if>
                        <input type="radio" checked="checked" onclick="javascript:location.href='${path}/board/list.do?cate=${cate.cate}'"/> ${cate.cateName}
                    </label>
            </c:forEach>
        </div>

        <div class="container">
            <form action="${path}/board/list.do" method="get" class="field has-addons has-addons-right">
                <p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="T"> 제목 </option>
                        <option value="C"> 내용 </option>
                        <option value="W"> 작성자 </option>
                    </select>
                </span>
                </p>
                <p class="control">
                    <c:if test="${!empty curCategory}">
                        <input type="hidden" id="cate" name="cate" value="${curCategory}">
                    </c:if>
                    <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off" value="${page.keyword}">
                </p>
                <p class="control">
                    <input type="submit" class="button is-primary" value="검색" />
                </p>
            </form>

            <table class="table is-hoverable is-fullwidth">
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
                        <td class="has-text-centered">${item.resdate}</td>
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

            <nav class="Page navigation example" role="navigation" aria-label="pagination">
                <c:if test="${curPage > 5}">
                    <a href="${path}/board/list.do?page=${page.blockStartNum - 1}" class="page-link " style="background-color: #FF0043;" >Previous</a>
                </c:if>
                <c:if test="${page.blockLastNum < page.totalPageCount}">
                    <a href="${path}/board/list.do?page=${page.blockLastNum + 1}" class="page-link" style="background-color: #FF0043;">Next page</a>
                </c:if>

                <ul class="pagination justify-content-center">
                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                        <c:choose>
                            <c:when test="${i == curPage}">
                                <li class="page-item active">
                                    <a href="${path}/board/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a href="${path}/board/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}" aria-current="page" style="background-color: #FF0043;">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </div>
</section>
<!-- BoardList End -->


<!--Footer Start-->
<jsp:include page="../setting/footer.jsp" />
<!--Footer End-->
</body>
</html>