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

    <title>QnA 추가하기</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;">QnA 추가하기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">QnA 추가하기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- noticeInsert Start-->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="content" style="margin-top: 60px;">
                    <div>
                        <div class="container">
                            <form action="${path }/qna/questionInsert.do" method="post">
                                <div >
                                    <div class="container">
                                        <div class="mb-3">
                                            <label for="title" class="form-label" style="font-weight: bold !important; font-size: 20px;">제목</label>
                                            <input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" class="form-control" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="content" class="form-label" style="font-weight: bold !important; font-size: 20px;">내용</label>
                                            <textarea name="content" id="content" class="form-control" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required ></textarea>
                                        </div>
                                    </div>
                                    <div style="width: 97%; margin-top: 30px;">
                                        <button class="btn btn-light btn-lg" style="width:200px; float: right; background-color: #71a894; font-weight: bold; color: #fff;"><a href="${path }/qna/list.do" style="color: #fff;">목록</a></button>
                                        <input type="submit" class="btn btn-sm btn-outline-primary ml-4" value="등록" style="width:200px; float: right; background-color: #4f5665; font-weight: bold; color: #fff; height: 50px; border-radius: 15px; margin-right: 10px; font-size: 20px;" />
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
<!-- noticeInsert End-->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>