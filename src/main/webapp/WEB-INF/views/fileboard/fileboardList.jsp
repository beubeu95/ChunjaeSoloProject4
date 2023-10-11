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

    <title>자료실</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 자료실 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">자료실</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- fileboardList Start -->
<div class="container-fluid pt-5 pb-3">
    <div class="container">
        <div class="row portfolio-container">
            <table class="table">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th>제목</th>
                    <th width="100">작성자</th>
                    <th width="120">작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${fileboardList }" var="fileboard" varStatus="status">
                    <tr>
                        <td class="has-text-centered">${status.count }</td>
                        <td><a href="${path}/fileboard/detail.do?articleno=${fileboard.articleno }" style="color: #000000;">${fileboard.title }</a></td>
                        <td>${fileboard.id }</td>
                        <td class="has-text-centered">
                            <fmt:parseDate value="${fileboard.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty fileboardList}">
                    <tr>
                        <td colspan="6" class="has-text-centered"> 등록된 자료가 없습니다.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- fileboardList End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->

</body>
</html>