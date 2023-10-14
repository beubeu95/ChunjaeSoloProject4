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

    <title>오프라인 강의</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 오프라인 강의 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">오프라인 강의</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- lectureList Start -->
<div class="content" id="content" style="margin-top: 20px;">
    <div class="container">
        <div class="container">
            <div class="container-fluid pt-5">
                <div class="container">
                    <div>
                        <c:if test="${sid eq 'admin'}">
                            <div class="button-group" style="float:right; margin-bottom: 20px;">
                                <a class="btn btn-primary px-4" href="${path}/lecture/list.do" class="button is-primary" style="width: 90px; font-size: 13px; font-weight: bold; background-color: #71A894; border:none;">글쓰기</a>
                            </div>
                        </c:if>
                    </div>
                    <div class="text-center pb-2">
                        <p class="section-title px-5">
                            <span class="px-2">최신 강의</span>
                        </p>
                        <h1 class="mb-4">오프라인 강의</h1>
                    </div>

                    <div class="row">
                        <div class="col-12 text-center mb-2">
                            <div class="btn-group btn-group-toggle mb-5" data-toggle="buttons" style="display: flex;width: 70%; justify-content: center; margin: 50px auto;">
                                <c:if test="${empty curCategory}">
                                <label class="btn btn-primary active" style=" background-color: #71A894; border: none; font-weight: bold;">
                                </c:if>
                                <c:if test="${!empty curCategory}">
                                <label class="btn btn-primary" style=" background-color: lightgray; color:#000000;  border: none; font-weight: bold;">
                                </c:if>
                                    <input type="radio" checked="checked" onclick="javascript:location.href='${path}/lecture/list.do'" style="opacity: 0;"/> 전체
                                </label>
                                <c:forEach var="cate" items="${categories}">
                                <c:if test="${cate.cate eq curCategory}">
                                <label class="btn btn-primary active" style=" background-color: #71A894; border: none; font-weight: bold;">
                                </c:if>
                                <c:if test="${cate.cate ne curCategory}">
                                <label class="btn btn-primary" style=" background-color: lightgray; color:#000000; border: none; font-weight: bold;">
                                </c:if>
                                    <input type="radio" checked="checked" onclick="javascript:location.href='${path}/lecture/list.do?cate=${cate.cate}'" style="opacity: 0;"/> ${cate.cateName}
                                </label>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <c:forEach var="item" items="${list}">
                        <div class="col-lg-4 mb-5">
                            <div class="card border-0 bg-light shadow-sm pb-2">
                                <img class="card-img-top mb-2" src="${path}/resources/img/${item.img}" alt="" />
                                <div class="card-body text-center">
                                    <h4 class="card-title">${item.title}</h4>
                                    <p class="card-text">${item.content}</p>
                                </div>
                                <div class="card-footer bg-transparent py-4 px-5">
                                    <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right">
                                            <strong style="text-align: center;">강사</strong>
                                        </div>
                                        <div class="col-6 py-1" style="text-align: center;">${item.tname}</div>
                                    </div>
                                    <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right">
                                            <strong style="text-align: center;">수강기간</strong>
                                        </div>
                                        <div class="col-6 py-1"  style="font-size: 14px; padding:0px;">${item.sdate} ~ ${item.edate}</div>
                                    </div>
                                    <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right">
                                            <strong style="text-align: center;">수강인원</strong>
                                        </div>
                                        <div class="col-6 py-1" style="text-align: center;">${item.amt}</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6 py-1 text-right border-right">
                                            <strong style="text-align: center;">현황</strong>
                                        </div>
                                        <c:if test='${item.status eq "1"}'>
                                            <div class="col-6 py-1" style="background-color: #0f74a885; width: 150px; padding: 0; text-align: center; color:#ffffff;">모집중</div>
                                        </c:if>
                                        <c:if test='${item.status eq "0"}'>
                                            &nbsp;<div class="col-6 py-1" style="background-color: #8b000080; width: 150px; padding: 0; text-align: center; color:#ffffff;">모집종료</div>
                                        </c:if>
                                    </div>
                                </div>
                                <a href="${path}/lecture/getLecture.do?lno=${item.lno}&page=${curPage}<c:if test="${!empty curCategory}">&cate=${curCategory}</c:if>" class="btn btn-primary px-4 mx-auto mb-4" style="background-color: #71A894; border:none; ">Join Now</a>
                            </div>
                        </div>
                        </c:forEach>
                    </div>

                    <nav aria-label="Page navigation example" >
                        <c:if test="${curPage > 5}">
                            <a href="${path}/lecture/list.do?page=${page.blockStartNum - 1}"
                               class="page-link">Previous</a>
                        </c:if>
                        <c:if test="${page.blockLastNum < page.totalPageCount}">
                            <a href="${path}/lecture/list.do?page=${page.blockLastNum + 1}" class="page-link">Next page</a>
                        </c:if>

                        <ul class="pagination justify-content-center">
                            <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                <c:choose>
                                    <c:when test="${i == curPage}">
                                        <li class="page-item">
                                            <a href="${path}/lecture/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                               class="page-link active" aria-label="Page ${i}"
                                               aria-current="page" style="background-color: #4F5665; color:#FFFFFF";>${i}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a href="${path}/lecture/list.do?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
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
</div>
<!-- lectureList End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>