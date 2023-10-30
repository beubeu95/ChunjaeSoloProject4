<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

    <title>Haebeop</title>
    <jsp:include page="setting/head.jsp" />
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar">
<!--    Main Content-->
<main class="main" id="top">
    <!-- header begin -->
    <jsp:include page="setting/header.jsp" />
    <!-- header end -->

    <!-- <section> begin-->
    <section class="pt-8 py-lg-0" id="hero">
        <div class="container-xxl">
            <div class="row align-items-center min-vh-lg-100">
                <div class="col-lg order-lg-1 text-center"><img class="img-fluid" src="${path}/resources/img/illustrations/hero.png" alt="" /></div>
                <div class="col-lg mt-5 mt-lg-0">
                    <h1 class="lh-sm font-cursive fw-medium fs-6 fs-sm-8 fs-md-11 fs-lg-9 fs-xl-11 fs-xxl-12">미래를 위한 선택 <br class="d.none d-xl-block" /> </h1>
                    <p class="mt-4 fs-2 fs-md-4 lh-sm">실력을 키우고 미래를 준비하세요, 해법이 도와드립니다</p><button class="btn btn-success mt-4">수강신청</button>
                </div>
            </div>
        </div><!-- end of .container-->
    </section>
    <!-- <section> close-->

    <!-- <section> begin-->
    <section class="latest-albums-area section-padding-100" id="popular">
        <div class="container">
            <div class="section-heading style-2">
                <p style="text-align: center;"> 수강생들이 추천하는 </p>
                <h2 style="text-align: center;"> 인기 강의 </h2>
            </div>
            <div style="display:flex;">
            <c:forEach var="lecture" items="${popularLectures}">
            <div class="col-5" style="margin:30px;">
                <div class="card">
                    <img src="${path}/resources/upload/lecture/${lecture.img}" alt="${lecture.title} 커버 이미지">
                    <div class="card-body">
                        <h5 class="card-title">${lecture.title}</h5>
                        <p class="card-text">${lecture.tname} 선생님</p></div>
                </div>
            </div>
            </c:forEach>
            </div>
        </div>
    </section>
    <!-- ##### Popular Lecture Area End ##### -->
    <!-- <section> close-->


    <!-- footer begin -->
    <jsp:include page="setting/footer.jsp" />
    <!-- footer end -->

</main>
</body>
</html>
