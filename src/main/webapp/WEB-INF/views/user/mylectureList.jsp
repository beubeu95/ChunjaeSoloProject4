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

    <title>내 수강신청</title>
    <jsp:include page="../setting/head.jsp" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

</head>
<body>

<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 내 수강신청 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">내 수강신청</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- mylectureList Start -->
<div class="container-fluid pt-5 pb-3">
    <div class="container" style="margin-top: 30px; width: 80%;">
        <div class="row portfolio-container">
            <table class="lecture-table">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th>제목</th>
                    <th width="150">강사</th>
                    <th width="300">수강기간</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="payment" varStatus="status">
                    <tr>
                        <td class="has-text-centered">${status.count }</td>
                        <td><a href="${path}/fileboard/detail.do?articleno=${payment.title }" style="color: #000000;">${payment.title }</a></td>
                        <td>${payment.tname }</td>
                        <td class="has-text-centered">
                            ${payment.sdate} ~ ${payment.edate} (총 ${payment.tdate} 일)
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="6" class="has-text-centered"> 수강신청한 수업이 없습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(function ($) {
        $("#lecture-table").DataTable();
    })
</script>
<!-- mylectureList End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>