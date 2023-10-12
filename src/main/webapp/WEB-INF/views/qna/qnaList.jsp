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

    <title>QnA</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> QnA </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">QnA</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- qnaList Start-->
<div class="content" id="content" style="margin-top: 20px;">
    <div class="container" style="margin-top:100px;">
        <div class="container" >
            <div>
                <!-- 공지사항 관리자만 글쓰기 가능 처리 -->
                <c:if test="${ !empty sid }">
                    <div class="button-group" style="float:right; margin-bottom: 20px;">
                        <a class="btn btn-primary px-4" href="${path }/qna/questionInsert.do" style="width: 90px; font-size: 13px; font-weight: bold; background-color: #71A894; border:none;">글쓰기</a>
                    </div>
                </c:if>
            </div>
            <div>
                <table class="table">
                    <thead>
                    <tr>
                        <th width="80">번호</th>
                        <th>제목</th>
                        <th scope="col" width="100">작성자</th>
                        <th scope="col" width="120">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${qnaList }" var="qna" varStatus="status">
                    <tr>
                        <td class="has-text-centered">${qna.qno}</td>
                        <c:if test="${qna.lev==0}">
                            <!-- 비회원일때 -->
                            <c:if test="${empty sid}">
                            <td>${qna.title}</td>
                            </c:if>
                            <!-- 회원일때-->
                            <c:if test="${!empty sid}">
                            <td>
                                <a href="${path}/qna/detail.do?qno=${qna.qno}" style="color: #000000;">${qna.title}</a>
                            </td>
                            </c:if>
                        </c:if>
                        <c:if test="${qna.lev==1}">
                            <!-- 비회원일때 -->
                            <c:if test="${empty sid}">
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;⌞${qna.title}</td>
                            </c:if>
                            <!-- 회원일때-->
                            <c:if test="${!empty sid}">
                            <td>
                                <a href="${path}/qna/detail.do?qno=${qna.qno}" style="color: #000000;">&nbsp;&nbsp;&nbsp;&nbsp;⌞${qna.title}</a>
                            </td>
                            </c:if>
                        </c:if>
                        <td class="has-text-centered">${qna.author}</td>
                        <td class="has-text-centered">
                            <fmt:parseDate value="${qna.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    </c:forEach>
                    <c:if test="${empty qnaList}">
                        <tr>
                            <td colspan="6" class="has-text-centered"> QnA가 없습니다. </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
                <!-- pagnation -->
                <nav aria-label="Page navigation example" >
                    <c:if test="${curPage > 5}">
                        <a href="${path}/qna/list.do?page=${page.blockStartNum - 1}"
                           class="page-link">Previous</a>
                    </c:if>
                    <c:if test="${page.blockLastNum < page.totalPageCount}">
                        <a href="${path}/qna/list.do?page=${page.blockLastNum + 1}" class="page-link">Next page</a>
                    </c:if>

                    <ul class="pagination justify-content-center">
                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                            <c:choose>
                                <c:when test="${i == curPage}">
                                    <li class="page-item">
                                        <a href="${path}/qna/list.do?page=${i}"
                                           class="page-link active" aria-label="Page ${i}"
                                           aria-current="page" style="background-color: #71A894; color:#FFFFFF";>${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a href="${path}/qna/list.do?page=${i}"
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
<!-- qnaList End -->

<!-- Footer Start-->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->

</body>
</html>