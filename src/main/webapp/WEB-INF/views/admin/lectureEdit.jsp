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

    <title>강의수정</title>
    <jsp:include page="../setting/head.jsp" />
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>

</head>
<body>

<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 강의 등록 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">강의 등록</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- lectureInsert Start -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <form action="${path }/admin/edit.do" method="post">
                <div class="form-group">
                    <label for="cate" class="form-label">과목</label>
                    <select name="cate" id="cate" class="form-select">
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.cate}">${category.cateName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">강의명</label>
                    <input type="text" name="title" id="title" class="form-control" value="${lecture.title}" placeholder="제목 입력" maxlength="98" required>
                </div>
                <div class="form-group">
                    <label for="title">강사명</label>
                    <input type="text" name="tcode" id="tcode" class="form-control" value="${lecture.tcode}" placeholder="제목 입력" maxlength="98" required>
                </div>
                <div class="form-group">
                    <label for="title">교재명</label>
                    <input type="text" name="bcode" id="bcode" class="form-control" value="${lecture.bcode}" placeholder="제목 입력" maxlength="98" required>
                </div>

                <div class="form-group">
                    <label>수강신청 상태</label>
                    <div style="display:flex;">
                        <div class="form-check">
                            <input type="radio" name="status" id="now" value="1" class="form-check-input" checked>
                            <label class="form-check-label" for="now">모집중</label>
                        </div>
                        <div class="form-check">
                            <input type="radio" name="status" id="end" value="0" class="form-check-input">
                            <label class="form-check-label" for="end">마감</label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="sdate">시작일</label>
                    <input type="date" name="sdate" id="sdate" value="${lecture.sdate}" class="form-control" placeholder="시작일 지정해주세요" autocomplete="off" required>
                </div>

                <div class="form-group">
                    <label for="edate">종료일</label>
                    <input type="date" name="edate" id="edate" value="${lecture.edate}" class="form-control" placeholder="종료일 지정해주세요" autocomplete="off" required>
                </div>

                <div class="form-group">
                    <label for="content">강의소개</label>
                    <textarea name="content" id="content" value="${lecture.content}" class="form-control" placeholder="내용 입력" rows="8" maxlength="1400" required></textarea>
                    <script>
                        CKEDITOR.replace('content', { filebrowserUploadUrl: '${path}/lecture/imageUpload.do' });
                    </script>
                </div>

                <div class="form-group column is-8">
                    <div class="file has-name" style="margin-top: 30px;">
                        <label class="file-label" style="width: 100%;">
                            <input class="form-control" type="file" name="upfile" multiple="multiple" id="video" name="video">
                            <span class="file-cta">
                                                <span class="file-icon mb-0"></span>
                                                <span class="file-label mb-0"></span>
                                                </span>
                            <span class="file-name"></span>
                        </label>
                    </div>
                </div>

                <div class="col-md-8">
                    <input type="hidden" id="price" name="price" value="0">
                    <button type="submit" class="btn btn-primary" style="float:right; background-color: #74A984;">글 등록</button>
                </div>
            </form>

            <script>
                // 시작일 변경 시 종료일 처리
                $("#sdate").change(() => {
                    $("#edate").prop("min", $("#sdate").val());
                    // 종료일이 변경한 시작일보다 빠른 경우
                    if ($("#edate").val() < $("#sdate").val()) {
                        $("#edate").val($("#sdate").val());
                    }
                });
                // 종료일 변경 시 시작일 처리
                $("#edate").change(() => {
                    $("#sdate").prop("max", $("#edate").val());
                });
            </script>
        </div>
    </div>
</div>

<!-- lectureInsert End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->

</body>
</html>