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

<!-- boardDetail Start -->
<section class="section">
    <div class="container">
        <div class="buttons is-right">
            <a href="${path}/board/list.do?page=${curPage}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="button"> 목록 </a>
            <c:if test="${(sid eq 'admin') or (sid eq detail.author)}">
                <a href="${path}/board/edit.do?bno=${detail.bno}" class="button"> 수정 </a>
                <a href="${path}/board/delete.do?bno=${detail.bno}" class="button"> 삭제 </a>
            </c:if>
        </div>
        <div class="columns">
            <div class="column is-one-quarter">
                <p> 카테고리 </p>
                <input type="text" value="${detail.cateName}" class="input" readonly>
            </div>
            <div class="column">
                <p> 제목 </p>
                <input type="text" value="${detail.title}" class="input" readonly>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <p> 작성자 </p>
                <input type="text" value="${detail.author}" class="input" readonly>
            </div>
            <div class="column">
                <p> 작성일 </p>
                <input type="text" value="${detail.resdate}" class="input" readonly>
            </div>
            <div class="column is-one-fifth">
                <p> 조회수 </p>
                <input type="text" value="${detail.cnt}" class="input" readonly>
            </div>
        </div>
        <div class="columns">
            <div class="column m-3 p-5" style="border: 1px solid #ddd; border-radius: 5px; min-height:500px;">
                ${detail.content}
            </div>
        </div>
    </div>
    <c:if test="${sid ne null}">
        <div class="container">
            <form action="${path}/comment/insert.do" method="post" class="columns mt-5">
                <div class="column is-four-fifths">
                    <textarea name="content" id="content" class="textarea has-fixed-size" maxlength="990" cols="30" rows="2" placeholder="댓글을 달아주세요 :)"></textarea>
                </div>
                <div class="column">
                    <input type="hidden" id="cno" name="cno" value="${detail.cno}">
                    <input type="hidden" id="page" name="page" value="${curPage}">
                    <c:if test="${!empty cate}">
                        <input type="hidden" id="cate" name="cate" value="${cate}">
                    </c:if>
                    <c:if test="${!empty keyword}">
                        <input type="hidden" id="type" name="type" value="${type}">
                        <input type="hidden" id="keyword" name="keyword" value="${keyword}">
                    </c:if>
                    <input type="submit" class="button is-fullwidth is-primary" style="height:72px" value="전송">
                </div>
            </form>
        </div>
    </c:if>

    <div class="container">
        <c:forEach var="comment" items="${commentList}">
        <c:if test="${(sid eq 'admin') or (sid eq comment.author)}">
        <div class="buttons is-right mt-5" style="margin-bottom:-10px">
            <a href="${path}/comment/delete.do?comNo=${comment.comNo}&cno=${detail.cno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty keyword}">&type=${type}&keyword=${keyword}</c:if>" class="button is-small"> 삭제 </a>
        </div>
        </c:if>
        <div class="columns">
            <div class="column">
                <p> ${comment.author} </p>
            </div>
            <div class="column">
                <p class="has-text-right"> ${comment.resdate} </p>
            </div>
        </div>
        <div class="columns">
            <div class="column">
                <textarea class="textarea has-fixed-size" readonly>${comment.content}</textarea>
            </div>
        </div>
        </c:forEach>
        <!-- pagination -->
        <nav class="pagination is-rounded is-centered mt-5 mb-6" role="navigation" aria-label="pagination">
            <c:if test="${commentPage > 5}">
                <a href="${path}/board/getBoard.do?bno=${detail.bno}&page=${curPage}&commentPage=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-previous">Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount}">
                <a href="${path}/board/getBoard.do?bno=${detail.bno}&page=${curPage}&commentPage=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-next">Next page</a>
            </c:if>

            <ul class="pagination-list">
                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                    <c:choose>
                        <c:when test="${i == commentPage}">
                            <li>
                                <a href="${path}/board/getBoard.do?bno=${detail.bno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link is-current" aria-label="Page ${i}" aria-current="page">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${path}/board/getBoard.do?bno=${detail.bno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="pagination-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>
</section>
</div>
<!-- boardDetail End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>