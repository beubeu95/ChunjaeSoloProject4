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

    <title>마이페이지</title>
    <jsp:include page="../setting/head.jsp" />
    <link rel="stylesheet" href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css" integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv" crossorigin="anonymous">

</head>
<body>

<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 마이페이지 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">마이페이지</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- mypageIndex Start -->
<div class="page-title background-primary is-relative">
    <div style="display:flex;">
        <div style="width: 30%;">
            <div class="osahan-account-page-left bg-white h-100">
                <div class="border-bottom p-4">
                    <div class="osahan-user text-center">
                        <div class="osahan-user-media">
                            <i class="fa-solid fa-circle-user" style="font-size:100px;"></i>
                            <div class="osahan-user-media-body">
                                <h6 class="mb-2">${user.id}</h6>
                                <p class="mb-1">${user.tel}</p>
                                <p>${user.email}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="osahan-account-page-right bg-white p-4 h-100">
                <div class="container" id="content">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade  active show" id="addresses" role="tabpanel" aria-labelledby="addresses-tab">
                                        <h4 class="font-weight-bold mt-0 mb-4">${user.id}님, 어서오세요~! </h4>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="bg-white card addresses-item mb-4 border ">
                                                    <div class="gold-members p-4">
                                                        <div class="media">
                                                            <div class="mr-3"><i class="icofont-ui-home icofont-3x"></i></div>
                                                            <div class="media-body">
                                                                <p style="text-align: center;"><i class="fa-solid fa-face-smile" style="font-size:60px; color: #74A984;"></i><p></p>
                                                                <h2 class="mb-1 text-secondary" style="text-align: center;"><a href="${path}/user/userUpdate.do" style="color: #4F5665 !important;">나의 정보 수정</a></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="bg-white card addresses-item mb-4 border ">
                                                    <div class="gold-members p-4">
                                                        <div class="media">
                                                            <div class="mr-3"><i class="icofont-ui-home icofont-3x"></i></div>
                                                            <div class="media-body">
                                                                <p style="text-align: center;"><i class="fa-solid fa-school" style="font-size:60px; color: #74A984;"></i><p></p>
                                                                <h2 class="mb-1 text-secondary" style="text-align: center;"><a href="${path}/user/myLecture.do" style="color: #4F5665 !important;">내 수강신청</a></h2>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- mypageIndex End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer Endt-->

</body>
</html>