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

    <title>QnA 상세보기</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> QnA 상세보기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">QnA 상세보기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- noticeDetail Start -->
<section style="padding-top: 0;">
    <div style="display: flex; justify-content: center; margin-top: 100px;">
        <div class="card" style="width: 90%;">
            <div class="card-body" >
                <div class="card-title" style="padding-bottom: 20px; border-bottom: 1px solid;">
                    <div class="d-flex align-items-center mt-3">
                        <div class="ms-3">
                            <h3>${dto.title}</h3>
                            <p class="mb-0">작성자 | ${dto.author } 작성일 | <fmt:parseDate value="${dto.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" /></p>
                        </div>
                    </div>
                </div>
                <div class="card-text mt-4">
                    <div class="ms-3">
                        <p style="padding-top: 30px; padding-bottom: 100px;}">${dto.content }</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="width: 95%; margin-top: 30px;">
        <button class="btn btn-light btn-lg" style="width:200px; float: right; background-color: #71a894; font-weight: bold; color: #fff;"><a href="${path }/qna/list.do" style="color: #fff;">목록</a></button>
        <c:if test='${sid eq "admin" && dto.lev == 0}'>
            <button class="btn btn-light btn-lg" style="width:200px; float: right; border-color: #000000; font-weight: bold; margin-left: 10px; margin-right: 10px; "><a class="button" href="${path }/qna/answerInsert.do?qno=${dto.qno}">답변</a></button>
        </c:if>
        <c:if test='${sid ne "admin"}'>
            <button class="btn btn-dark btn-lg" style="width:200px; float: right; background-color: #adb2bd; font-weight: bold; border:none; margin-right: 10px; margin-left:10px;"><a class="button" style="color:#ffffff;" href="${path }/qna/edit.do?qno=${dto.qno}">수정</a>
        </c:if>
        <c:if test='${(sid eq dto.author || sid eq "admin") && not empty sid}'>
            <button class="btn btn-dark btn-lg" style="width:200px; float: right; background-color: #4f5665; font-weight: bold; border :none;"><a class="button" style="color:#ffffff;" href="${path }/qna/delete.do?qno=${dto.qno}">삭제</a>
        </c:if>
    </div>
</section>
<!-- noticeDetail End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp"/>
<!-- Footer End -->
</body>
</html>