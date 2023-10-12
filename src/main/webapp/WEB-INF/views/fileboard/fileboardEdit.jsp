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

    <title>자료실 수정하기</title>
    <jsp:include page="../setting/head.jsp" />
</head>
<body>
<!-- Header Start-->
<jsp:include page="../setting/header.jsp" />
<!-- Header End -->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 자료실 수정하기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">자료실 수정하기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- fileboardEdit Start -->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="content" style="margin-top: 60px;">
                    <div>
                        <div class="container">
                            <form action="${path}/fileboard/edit.do" id="writeform" method="post" enctype="multipart/form-data">
                                <div>
                                    <div class="container">
                                        <div class="mb-3">
                                            <label for="title" class="form-label" style="font-weight: bold !important; font-size: 20px;">제목</label>
                                            <input type="hidden" id="articleno" name="articleno" value="${dto.articleno}">
                                            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" autocomplete="off" value="${dto.title}" autofocus required>
                                        </div></div>
                                        <div class="mb-3" style="width: 92%; margin: 0 auto;">
                                            <label for="content" class="form-label" style="font-weight: bold !important; font-size: 20px;">내용</label>
                                            <textarea name="content" id="content" class="form-control" rows="5" placeholder="내용을 입력해주세요" required>${dto.content}</textarea>
                                        </div>
                                        <div class="form-group col-8" style="margin-left: 41px;">
                                            <div class="custom-file">
                                                <input type="file" class="form-control" id="upfile" name="upfile" multiple="multiple">
                                                <label class="file-label" for="upfile"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="margin-top: 30px; float: right; margin-right: 40px;">
                                        <button type="reset" class="btn btn-secondary">초기화</button>
                                        <button type="submit" class="btn btn-primary" style="background-color: #71a894;">수정</button>
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- fileboardEdit End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->

<script>
    $(".file-input").on("change", () => {
        let fileName = '';
        let fileLength = $(".file-input")[0].files.length;
        if(fileLength > 1) {
            fileName = fileLength + "개의 파일";
        } else {
            fileName = $(".file-input").val().split("\\").pop();
        }
        $(".file-name").text("\t 선택한 파일 : " + fileName);
    });
</script>
</body>
</html>