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

    <title>FAQ</title>
    <jsp:include page="../setting/head.jsp" />
    <style>
        .faqlist .message-body {background-color: #f1f1f1; }
        .message-body { display:none; }
        .message-header:after { content:"▼"; padding-left: 36px;}
        .message-header.on:after { content:"▲";}
    </style>

</head>
<body>
<!--Header Start-->
<jsp:include page="../setting/header.jsp" />
<!--Header End-->

<!--Banner Start-->
<section class="page-title background-primary is-relative"  style="background-image: url('${path}/resources/img/bannerPage.jpg'); background-position: center; background-size: cover; height: 200px;">
    <div class="container-fluid mb-5">
        <div class="has-text-centered">
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> FAQ </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">FAQ</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- faqList Start -->
<div class="content" id="content" style="margin-top: 20px;">
    <div>
    <div class="container">
        <div class="table" style="display: flex; justify-content: center; ">
            <ul class="faqlist" style="list-style: none; width: 100%;">
                <c:forEach items="${faqList }" var="faq" varStatus="status">
                    <li style="margin-top :30px;">
                        <div class="message-header" style="margin-bottom: 0px; background-color: #71a894; color:#ffffff; font-weight:bold; ">
                                ${faq.title }
                                <c:if test="${sid eq 'admin'}">
                                <button type="button" class="btn btn-secondary btn-sm" style="float: right;">
                                    <a href="${path}/faq/delete.do?fno=${faq.fno}" style="text-decoration: none; color:#ffffff;">삭제</a></button>
                                <button type="button" class="btn btn-secondary btn-sm" style="float: right; margin-right: 5px;">
                                    <a href="${path}/faq/edit.do?fno=${faq.fno}" style="text-decoration: none; color:#ffffff;">수정</a></button>
                                </c:if>
                        </div>
                        <div class="message-body" style="margin-bottom: 30px; background-color: lightgray; font-weight: bold;">${faq.content }</div>
                    </li>
                </c:forEach>
                <c:if test="${empty faqList}">
                    <div class="has-text-centered"> FAQ가 없습니다. </div>
                </c:if>
            </ul>
            <script>
                $(document).ready(function(){
                    $(".faqlist li").click(function(){
                        $(this).find(".message-body").slideToggle(500);
                        $(this).find(".message-header").toggleClass("on");
                    });
                });
            </script>
        </div>
    </div>
    </div>
</div>
<!-- faqList End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>