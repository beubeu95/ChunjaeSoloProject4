<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="Free HTML Templates" name="keywords" />
    <meta content="Free HTML Templates" name="description" />

    <title>공지사항</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 공지사항 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">공지사항</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- faqEdit Start -->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="content" id="content" style="margin-top: 60px;">
                    <div>
                        <div class="container" >
                            <form action="${path }/faq/edit.do" method="post">
                                <div >
                                    <div class="container">
                                        <div class="mb-3">
                                            <label for="title" class="form-label" style="font-weight: bold !important; font-size: 20px;">제목</label>
                                            <input type="hidden" name="fno" id="fno" value="${faq.fno }" >
                                            <input type="text" name="title" id="title" placeholder="제목 입력" value="${faq.title }" maxlength="98"  class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="content" class="form-label" style="font-weight: bold !important; font-size: 20px;">내용</label>
                                            <textarea name="content" id="content" class="form-control" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>${faq.content }</textarea>
                                        </div>
                                    </div>
                                    <div style="width: 100%; margin-top: 30px;">
                                        <button class="btn btn-light btn-lg" style="width:200px; float: right; background-color: #71a894; font-weight: bold; color: #fff;"><a href="${path }/faq/list.do" style="color: #fff;">목록</a></button>
                                        <c:if test='${sid eq "admin"}'>
                                            <input type="submit" class="btn btn-light btn-lg" value="수정" style="width:200px; float: right; background-color: #4f5665; font-weight: bold; color: #fff;" />
                                        </c:if>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- faqEdit End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->

</body>
</html>