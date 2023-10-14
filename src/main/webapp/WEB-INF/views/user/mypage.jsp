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

    <title>나의 정보 수정</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 나의정보수정 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">나의정보수정</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- myPage Start -->
<div class="page-title background-primary is-relative">
    <div style="display:flex;">
        <div style="width: 30%;">
            <div class="osahan-account-page-left shadow-sm bg-white h-100">
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
            <div class="osahan-account-page-right shadow-sm bg-white p-4 h-100">
                <div class="container" id="content">
                    <div class="row justify-content-center">
                        <div class="col-lg-9">
                            <div>
                                <div class="card-body shadow p-4">
                                    <h3 class="text-center">나의 정보 수정</h3>
                                    <hr>
                                    <form name="frm1" id="frm1" action="${path}/user/update.do" class="row" method="post" onsubmit="return updateCheck(this)">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="id">아이디</label>
                                                <input type="text" class="form-control" name="id" id="id" value="${user.id}" readonly required>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="pw">비밀번호</label>
                                                <input type="password" id="pw" name="pw" class="form-control" value="${user.pw}" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required>
                                                <p>(최소 8자리에서 최대 16자리까지, 숫자, 영문 대소문자, 특수문자가 각 1 문자 이상 포함되어야 함)</p>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="pw2">비밀번호 확인</label>
                                                <input type="password" class="form-control" value="${user.pw}" name="pw2" id="pw2" required>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="name">이름</label>
                                                <input type="text" class="form-control" name="name" id="name" value="${user.name}" required>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="email">이메일</label>
                                                <input type="email" name="email" id="email" class="form-control" value="${user.email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="tel">전화번호</label>
                                                <input type="tel" class="form-control" name="tel" id="tel" value="${user.tel}" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
                                                <p>(특수기호 포함하여 000-0000-0000으로 입력해주세요)</p>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="tel">주소</label>
                                                <input type="text" name="addr1" id="addr1" class="form-control" value="${user.addr1}">
                                                <input type="text" name="addr2" id="addr2" class="form-control mt-3" value="${user.addr2}">
                                                <div class="row mt-1" style="margin-top: 20px !important;">
                                                    <div class="col-9">
                                                        <div class="form-group">
                                                            <input type="text" id="postcode" name="postcode" value="${user.postcode}" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-3 pl-0" style=" padding-left: 0;">
                                                        <button type="button" class="btn btn-primary" onclick="findAddr()" style="height: 40px; width: 130px; font-size: 20px;padding: 0px; font-weight: bold; background-color: #71A894; border:none;">우편번호</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="tel">생년월일</label>
                                                <fmt:parseDate value="${user.birth}" var="birth" pattern="yyyy-MM-dd" />
                                                <span style="display:none"><fmt:formatDate var="br" value="${birth}" pattern="yyyy-MM-dd" /></span>
                                                <input type="birth" name="birth" id="birth" max="${minYear}-12-31" value="${br}" class="form-control">
                                            </div>
                                        </div>
                                        <div style="margin-top: 30px; display: flex; justify-content: center;">
                                            <input type="submit" class="btn btn-primary" value="회원정보수정" style="margin-right: 20px; background-color: #71A894; border: none; ">
                                            <c:if test="${sid != 'admin'}">
                                                <a href="${path}/user/delete.do?id=${sid}" class="btn btn-danger">회원 탈퇴</a>
                                            </c:if>
                                            <c:if test="${sid == 'admin'}">
                                                <a href="${path}/user/list.do" class="btn btn-primary">회원 목록</a>
                                            </c:if>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- myPage End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>