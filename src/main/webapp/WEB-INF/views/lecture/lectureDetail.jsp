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

            ${lecture.title}
            ${lecture.content}
        </div>
    </div>
</section>
<!-- lectureDetail End-->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>