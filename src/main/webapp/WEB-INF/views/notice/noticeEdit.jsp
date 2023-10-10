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

    <title>공지사항 수정하기</title>
    <jsp:include page="../setting/head.jsp" />
</head>
<body>
<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid bg-primary mb-5">
        <div class="has-text-centered" style="padding-top: 60px;">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 공지사항 수정하기</h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">공지사항 수정하기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- noticeEdit Start -->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="content" id="content" style="margin-top: 100px;">
                    <div class="row column text-center">
                        <div class="container" >
                            <form action="${path }/notice/edit.do" method="post">
                                <div class="row column text-center">
                                    <div class="container">
                                            <div class="field is-horizontal" style="height: 60px; margin-bottom:0px;">
                                                <div class="field-label is-normal">
                                                    <label class="label">제목</label>
                                                </div>
                                                <div class="field-body">
                                                    <div class="field">
                                                        <p class="control">
                                                            <input type="hidden" name="seq" id="seq" value="${notice.no }" >
                                                            <input type="text" name="title" id="title" placeholder="제목 입력" value="${notice.title }" maxlength="98"  class="input" required>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="field is-horizontal">
                                                <div class="field-label is-normal">
                                                    <label class="label">내용</label>
                                                </div>
                                                <div class="field-body">
                                                    <div class="field">
                                                        <div class="control">
                                                            <textarea name="content" id="content" class="textarea is-focused" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>${notice.content }</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="button-group" style="margin-top: 30px; margin-bottom: 100px;">
                                                <c:if test='${sid eq "admin"}'>
                                                    <input type="submit" class="btn btn-sm btn-outline-primary ml-4" value="글 수정" style="float:right; margin-left:10px;" >
                                                </c:if>
                                                <a class="btn btn-sm btn-primary ml-4" href="${path }/notice/list.do" style="text-decoration:none; color:#fff; float:right;">글 목록</a>
                                            </div>
                                        </form>
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
<!-- noticeEdit End -->

<!--Footer Start-->
<jsp:include page="../setting/footer.jsp" />
<!--Footer End-->