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

<!-- lectureListAdmin Start -->
<div class="container-fluid pt-5 pb-3">
    <div class="container" style="margin-top: 30px; width: 80%;">
        <div class="row portfolio-container">

            <div class="row">
                <div class="col-12 text-center mb-2">
                    <div class="btn-group btn-group-toggle mb-5" data-toggle="buttons" style="display: flex;width: 70%; justify-content: center; margin: 50px auto;">
                        <c:if test="${empty curCategory}">
                        <label class="btn btn-primary active" style=" background-color: #71A894; border: none; font-weight: bold;">
                            </c:if>
                            <c:if test="${!empty curCategory}">
                            <label class="btn btn-primary" style=" background-color: lightgray; color:#000000;  border: none; font-weight: bold;">
                                </c:if>
                                <input type="radio" checked="checked" onclick="javascript:location.href='${path}/admin/lecList.do'" style="opacity: 0;"/> 전체
                            </label>
                            <c:forEach var="cate" items="${categories}">
                            <c:if test="${cate.cate eq curCategory}">
                            <label class="btn btn-primary active" style=" background-color: #71A894; border: none; font-weight: bold;">
                                </c:if>
                                <c:if test="${cate.cate ne curCategory}">
                                <label class="btn btn-primary" style=" background-color: lightgray; color:#000000; border: none; font-weight: bold;">
                                    </c:if>
                                    <input type="radio" checked="checked" onclick="javascript:location.href='${path}/admin/Leclist.do?cate=${cate.cate}'" style="opacity: 0;"/> ${cate.cateName}
                                </label>
                                </c:forEach>
                    </div>
                </div>
            </div>

            <table id="lecture-table">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th>과목</th>
                    <th>제목</th>
                    <th width="150">수강인원</th>
                    <th width="300">수강기간</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="lecture" varStatus="status">
                    <tr>
                        <td class="has-text-centered">${status.count }</td>
                        <td>${lecture.cateName}</td>
                        <td>${lecture.title }</td>
                        <td>${lecture.amt }</td>
                        <td>${lecture.sdate }~ ${lecture.edate} (총 ${lecture.tdate} 일)</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="6" class="has-text-centered">강의가 없습니다.</td>
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
<!-- lectureListAdmin End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>