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

    <title>강의 상세보기</title>
    <jsp:include page="../setting/head.jsp" />
    <script src="${path}/resources/js/vdo.js"></script>
    <style>
        .player_btn {
            border: none;
            background-color: #ffffff;
        }

        #progressBar {
            width: 0px;
            height: 10px;
            background-color: #007cf0;
            transition: 1s;
            margin-top: -10px;
        }

        #btn-right {
            display: inline-block;
            float: right;
        }

        h4 {
            font-family: 'Roboto', 'sans-serif';
        }
    </style>
</head>
<body>
<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 강의 상세보기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">강의 상세보기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- lectureDetail Start-->
<section style="padding-top: 0;margin-top: 100px;">
    <div style="width: 90%; margin: 0 auto; padding-left: 20px;">
        <h2><i class="fa-solid fa-cloud"></i>&nbsp;&nbsp;${lecture.title}</h2>
    </div>
    <div style="display: flex; justify-content: center; ">
        <div class="card" style="width: 90%;">
            <div class="card-body" >
                <div style="display: flex; justify-content: center; margin-top: 30px;">
                    <div class="col-6 col-md-5" style="margin-right: 200px;">
                        <ul class="list-inline m-0">
                            <li class="py-2 border-top border-bottom">
                                <i class="fa-solid fa-book-open-reader text-primary mr-3"></i>
                                    &nbsp;&nbsp;<strong>과목</strong>&nbsp;&nbsp;${lecture.cateName}
                            </li>
                            <li class="py-2 border-bottom">
                                <i class="fa-solid fa-person-chalkboard text-primary mr-3"></i>
                                &nbsp;&nbsp;<strong>강사</strong>&nbsp;&nbsp;${lecture.tname}
                            </li>
                            <li class="py-2 border-bottom">
                                <i class="fa-solid fa-book"></i>
                                &nbsp;&nbsp;<strong>교재</strong>&nbsp;&nbsp;${lecture.bname}
                            </li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-5">
                        <ul class="list-inline m-0">
                            <li class="py-2 border-top border-bottom">
                                <i class="fa-solid fa-calendar text-primary mr-3"></i>
                                &nbsp;&nbsp;<strong>기간</strong>&nbsp;&nbsp;${lecture.sdate} ~ ${lecture.edate}(${lecture.tdate}일)
                            </li>
                            <li class="py-2 border-bottom">
                                <c:if test='${lecture.status eq "1"}'>
                                    <i class="fa-solid fa-check-to-slot text-primary mr-3"></i>
                                        &nbsp;&nbsp;<strong>현황</strong><span style="color: darkred;">&nbsp;&nbsp;모집중 (오프라인 강좌)</span>
                                </c:if>
                                <c:if test='${lecture.status eq "0"}'>
                                        &nbsp;&nbsp;<strong>현황</strong><span style="color: darkgray;">&nbsp;&nbsp; (오프라인 강좌)</span>
                                </c:if>
                            </li>
                            <li class="py-2 border-bottom">
                                <i class="fa-solid fa-paperclip text-primary mr-3"></i>
                                &nbsp;&nbsp;<strong>수강인원</strong>&nbsp;&nbsp;${lecture.amt}명
                            </li>
                        </ul>
                    </div>
                </div>
                <div style="float: right; margin-right: 50px;">
                <a href="" class="btn btn-primary mt-2 py-2 px-4" style="margin-top: 30px!important; background-color: #71A894; border: none; font-weight: bold;">수강신청</a>
                </div>
            </div>
        </div>
    </div>
    <div style="margin: 100px auto; width: 90%;">
        <div class="card box-shadow-rb my-4">
            <div class="columns is-multiline mb-40">
                <div class="column">
                    <article class="card shadow">
                        <figure class="image is-4by3" style="padding-top: 0;">
                            <div class="player" style="width:800px; margin: 0 auto;">
                                <div class="vdo_fr">
                                    <video id="video" style="width: 100%">
                                        <source src="${path}/resources/img/lecture_video03.mp4" type="video/mp4"/>
                                    </video>
                                </div>
                                <div id="progress">
                                    <div id="progressBar" class="mb-2"></div>
                                </div>
                                <div id="buttonbar" >
                                    <button id="play" class="player_btn"> <i class="fas fa-play"></i> </button>
                                    <button id="pause" style="display: none" class="player_btn"> <i class="fas fa-pause"></i> </button>
                                    <button id="stop" class="player_btn"> <i class="fas fa-stop"></i> </button>
                                    <span id="currentTime"> 00:00 / 02:11 </span>
                                    <div id="btn-right">
                                        <input id="vol" type="range" value="500" min="0" max="1000">
                                        <button id="volTxt" class="player_btn">50%</button>
                                        <button id="full" class="player_btn"><i class="fa-solid fa-expand"></i></button>
                                    </div>
                                </div>
                            </div>
                        </figure>
                        <div class="card-content has-text-centered" style="margin: 0 auto; width: 800px;">
                            <h4 class="mb-10" style="font-family:'sans-serif'; font-weight: bold;margin-bottom: 20px!important;">${lecture.title} </h4>
                            <p class="mb-10" style="font-family:'sans-serif'; font-weight: bold;">${lecture.content} </p>
                        </div>
                    </article>
                </div>
                <c:forEach var="review" items="${review}">
                <div class="name"><strong>회원 ID: </strong>${review.id}&nbsp;&nbsp;&nbsp;&nbsp;<strong>작성일시: </strong>${review.regdate}</div>
                </c:forEach>

                <div class="tab-pane" id="tabs-3" role="tabpanel">
                    <div class="product__details__tab__desc">
                        <h5 style="margin-bottom: 20px"><strong>후기</strong></h5>
                        <div>
                            <c:forEach var="review" items="${review}">
                                <div class="name"><strong>회원 ID: </strong>${review.id}&nbsp;&nbsp;&nbsp;&nbsp;<strong>작성일시: </strong>${review.regdate}</div>
                                <div class="star"><strong>별점: </strong>
                                    <c:if test="${review.star eq 5}">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </c:if>
                                    <c:if test="${review.star eq 4}">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </c:if>
                                    <c:if test="${review.star eq 3}">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </c:if>
                                    <c:if test="${review.star eq 2}">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </c:if>
                                    <c:if test="${review.star eq 1}">
                                        <i class="fa fa-star"></i>
                                    </c:if>
                                </div>
                                <div class="content">${review.content}</div>
                                <hr>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- lectureDetail End-->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>