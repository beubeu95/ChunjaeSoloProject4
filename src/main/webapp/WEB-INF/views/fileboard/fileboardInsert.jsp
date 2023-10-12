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
            <div class="column is-10-desktop">
                <div class="content" style="margin-top: 60px;">
                    <div>
                        <div class="container">
                            <form action="${path}/fileboard/insert.do" id="writeform" method="post" enctype="multipart/form-data">
                            <div>
                                <div class="container">
                                    <div class="mb-3">
                                        <label for="title" class="form-label" style="font-weight: bold !important; font-size: 20px;">제목</label>
                                        <input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" class="form-control" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="content" class="form-label" style="font-weight: bold !important; font-size: 20px;">내용</label>
                                        <textarea name="content" id="content" class="form-control" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required ></textarea>
                                    </div>
                                    <div class="form-group column is-8">
                                        <div class="file has-name">
                                            <label class="file-label">
                                                <input class="form-control" type="file" name="upfile" multiple="multiple">
                                                <span class="file-cta">
                                                <span class="file-icon mb-0">
                                                    <i class="fas fa-upload mb-0"></i>
                                                </span>
                                                <span class="file-label mb-0"></span>
                                                </span>
                                                <span class="file-name"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div style="margin-top: 30px; float: right; margin-right: 40px;">
                                    <button type="reset" class="btn btn-secondary">초기화</button>
                                    <button type="submit" class="btn btn-primary" style="background-color: #71a894;">작성하기</button>
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
<!-- fileboardInsert End -->

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