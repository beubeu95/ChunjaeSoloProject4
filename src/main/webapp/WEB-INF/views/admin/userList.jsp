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

    <title>회원관리</title>
    <jsp:include page="../setting/head.jsp" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap4.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap4.min.js"></script>

</head>
<body>

<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 회원관리 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">회원관리</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- userList Start -->
<div class="container-fluid pt-5 pb-3">
    <div class="container" style="margin-top: 30px; width: 80%;">
        <div class="row portfolio-container">
                <div class="button-group" style="display: flex;margin-bottom: 20px; justify-content: right; padding-right: 0;">
                    <a class="btn btn-primary px-4" href="${path}/admin/list.do" class="button is-primary" style="width: 90px; font-size: 13px; font-weight: bold; background-color: #71A894; border:none;">회원목록</a>
                </div>
                <div class="button-group" style="display: flex;margin-bottom: 20px; justify-content: right; padding-right: 0;">
                    <a class="btn btn-primary px-4" href="${path}/admin/tlist.do" class="button is-primary" style="width: 90px; font-size: 13px; font-weight: bold; background-color: #71A894; border:none;">강사목록</a>
                </div>
            <table id="user-table">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th>아이디</th>
                    <th width="150">이름</th>
                    <th width="300">강퇴</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="user" varStatus="status">
                    <tr>
                        <td class="has-text-centered">${status.count }</td>
                        <td>${user.id }</td>
                        <td>${user.name }</td>
                        <td class="has-text-centered">
                            <div class="button-group" style="align-items: center">
                                <a class="button is-danger"
                                   href="${path}/user/delete.do?id=${user.id }">강퇴</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="6" class="has-text-centered">회원 가입한 사용자가 없습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(function ($) {
        $("#user-table").DataTable();
    })
</script>
<!-- userList End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>