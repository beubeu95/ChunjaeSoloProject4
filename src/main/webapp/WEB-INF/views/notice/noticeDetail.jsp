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

    <title>공지사항 상세보기</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 공지사항 상세보기</h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">공지사항 상세보기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!--NoticeDetail Start -->
<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="content" id="content" style="margin-top: 100px;">
                    <div class="row column text-center">
                        <div class="container">
                            <table id="table">
                                <tbody>
                                <tr style="border-top: solid grey 1px;">
                                    <td style="font-weight: bold; font-size: 30px;">${notice.title }</td>
                                    <td style="min-width:10%; max-width: 15%; text-align: right; padding-top:30px;">
                                        작성자 | ${notice.author }
                                    </td>
                                    <td style="width: 170px; padding-right: 0px; padding-top:30px;">
                                        작성일 | <fmt:parseDate value="${notice.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                                    </td>
                                    <td style="width: 110px; padding-top:30px;">
                                        조회수 | ${notice.cnt}
                                    </td>
                                </tr>
                                <tr style="border-bottom: solid grey 1px;">
                                    <td style="padding-top: 50px; padding-bottom: 50px;"><p>${notice.content }</p></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="button-group" style="margin-top: 30px; float: right; margin-bottom: 100px;">
                                <c:if test='${sid eq "admin"}'>
                                    <a class="btn btn-sm btn-outline-primary ml-4" href="${path }/notice/delete.do?no=${notice.no}" style="text-decoration:none;">글 삭제</a>
                                    <a class="btn btn-sm btn-primary ml-4" href="${path }/notice/edit.do?no=${notice.no}" style="color:#fff; text-decoration:none;">글 수정</a>
                                </c:if>
                                <a class="btn btn-sm btn-outline-primary ml-4" href="${path }/notice/list.do" style="float:right; text-decoration:none;">글 목록</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--NoticeDetail End -->

<!-- Footer Start-->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End-->
</body>
</html>