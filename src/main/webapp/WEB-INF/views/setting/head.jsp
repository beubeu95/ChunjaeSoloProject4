<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />

<!-- favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${path1}/resources/img/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${path1}/resources/img/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${path1}/resources/img/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon" href="${path1}/resources/img/favicons/favicon.ico">
<link rel="manifest" href="${path1}/resources/img/favicons/manifest.json">
<meta name="msapplication-TileImage" content="${path1}/resources/img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">

<!-- Stylesheets -->
<link href="${path1}/resources/css/theme.min.css" rel="stylesheet" />
<link href="${path1}/resources/vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
<style> .nav-link { background-color: #FFFFFF; } </style>

<!-- javascript -->
<script src="${path1}/resources/vendors/@popperjs/popper.min.js"></script>
<script src="${path1}/resources/vendors/bootstrap/bootstrap.min.js"></script>
<script src="${path1}/resources/vendors/is/is.min.js"></script>
<script src="${path1}/resources/vendors/swiper/swiper-bundle.min.js"> </script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="${path1}/resources/js/theme.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&amp;family=Roboto:wght@400;500;600;700;900&amp;display=swap" rel="stylesheet">