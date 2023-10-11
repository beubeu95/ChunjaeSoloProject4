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

    <title>자료실 추가하기</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 자료실 추가하기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">자료실 추가하기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- fileboardInsert Start -->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-8-desktop">
                <div class="p-6 bg-white shadow rounded content">
                    <form action="${path }/fileboard/insert.do" id="writeform" method="post" enctype="multipart/form-data">
                        <div class="columns is-multiline">
                            <div class="form-group column is-12">
                                <label for="title"> 제목 </label>
                                <input type="text" class="input" id="title" name="title" placeholder="제목을 입력해주세요" autocomplete="off" autofocus required>
                            </div>
                            <!-- 내용 입력 부분 -->
                            <div class="form-group column is-12">
                                <label for="content"> 내용 </label>
                                <textarea name="content" id="content" class="textarea has-fixed-size" cols="30" rows="20" placeholder="내용을 입력해주세요" required></textarea>
                            </div>
                            <!-- 파일 선택 부분 -->
                            <div class="form-group column is-8">
                                <div class="file has-name">
                                    <label class="file-label">
                                        <input class="file-input" type="file" name="upfile" multiple="multiple">
                                        <span class="file-cta">
                                            <span class="file-icon mb-0">
                                                <i class="fas fa-upload mb-0"></i>
                                            </span>
                                            <span class="file-label mb-0">
                                                파일 선택
                                            </span>
                                        </span>
                                        <span class="file-name">선택된 파일이 없습니다.</span>
                                    </label>
                                </div>
                            </div>
                            <div class="column is-4 has-text-right">
                                <button type="reset" class="button"> 초기화 </button>
                                <button type="submit" class="button is-primary"> 작성하기 </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- fileboardInsert End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>