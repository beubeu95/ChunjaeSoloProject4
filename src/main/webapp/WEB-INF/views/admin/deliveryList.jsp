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

    <title>배송 목록</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 배송 수정하기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">배송 목록</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- deliveryList Start -->
<div class="container-fluid pt-5 pb-3">
    <div class="container" style="margin-top: 30px; width: 80%;">
        <div class="row portfolio-container">
            <div>
            <h2>결제 목록</h2>
            </div>
            <table id="pay-table">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th>결제번호</th>
                    <th>상품명</th>
                    <th width="150">주문ID</th>
                    <th width="300">결제일</th>
                    <th width="100">배송상태</th>
                    <th>수정</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="pay" varStatus="status">
                    <tr>
                        <td class="has-text-centered">${status.count }</td>
                        <input type="hidden" id="dno" name="dno" value="${pay.dno }">
                        <td>${pay.pno}</td>
                        <td>${pay.title }</td>
                        <td>${pay.id }</td>
                        <td>${pay.resdate }</td>
                        <td>${pay.dstatus}</td>
                        <td>
                            <div class="button-group" style="align-items: center">
                                <a class="button is-danger"
                                   href="${path}/admin/delUpdate.do?dno=${del.dno }">수정</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="6" class="has-text-centered">결제완료된 상품이 없습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>

        <div class="row portfolio-container">
            <div>
                <h2>배송 목록</h2>
            </div>
            <table id="del-table">
                <thead>
                <tr>
                    <th width="80">결제번호</th>
                    <th>송장번호</th>
                    <th>상품명</th>
                    <th width="300">배송예정일</th>
                    <th width="100">배송안내</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${delList }" var="del" >
                    <tr>
                        <td class="has-text-centered">${del.pno }</td>
                        <td>${del.dcode}</td>
                        <td>${del.title }</td>
                        <td>${del.edate }</td>
                        <td>${del.dstatus }</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty delList}">
                    <tr>
                        <td colspan="6" class="has-text-centered">배송 예정중인 상품이 없습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(function ($) {
        $("#pay-table").DataTable();
    })
</script>
<script type="text/javascript">
    jQuery(function ($) {
        $("#del-table").DataTable();
    })
</script>
<!-- deliveryList End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>