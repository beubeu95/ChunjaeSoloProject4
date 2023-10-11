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

    <title>로그인</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 로그인 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">로그인</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- login Start -->
<section id="contribute">
    <div class="container-xxl">
        <div style="margin: 0 auto; width: 500px; padding-left: 100px;">
            <div style="display: flex;">
                <img src="${path}/resources/img/icons/icon1.png" alt="" />
                <h1 class="display-5 lh-sm my-4 font-cursive" style="text-align: center;">LOGIN</h1>
            </div>
        </div>
        <div class="row align-items-center">
            <div style="margin:0 auto; width: 700px;">
                <div class="card box-shadow-rb my-4">
                    <div class="card-body my-3 mx-4">
                        <h1 class="mb-4 pb-2"></h1>
                        <form action="${path }/user/loginpro.do" method="post" name="login">
                            <div class="form-group">
                                <input type="text" class="form-control border-0 p-4" name="id" id="id" placeholder="아이디 입력" style="margin-bottom: 30px; background-color: lightgrey;" required />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control border-0 p-4" name="pw" id="pw" placeholder="비밀번호 입력" required style="background-color: lightgrey;" />
                            </div>
                            <div>
                                <button class="btn btn-secondary btn-block border-0 py-3" type="submit" style="width: 531px; margin-top: 30px; background-color: #71A894;">LOGIN</button>
                            </div>
                        </form>
                        <br>
                        <nav class="level" style="display: flex; justify-content: center; ">
                            <div class="level-item has-text-centered">
                                <div style=" margin-top: 5px;">
                                    <a href="${path}/user/term.do" style="color: #000000; font-weight: bold; font-size: 17px;"> 처음이신가요?&nbsp;&nbsp;회원가입 </a>
                                </div>
                            </div>
                        </nav>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- login End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->

</body>
</html>