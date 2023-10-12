<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div class="container-fluid bg-light position-relative shadow">
    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0 px-lg-5">
        <div class="container-fluid align-items-center py-2" style="margin-top: 25px;">
            <a class="navbar-brand flex-center" href="${path}">
                <img class="logo" src="${path}/resources/img/logo.png" alt="open enterprise" /><span class="ms-2 d-none d-sm-block fw-bold">Open Enterprise</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav font-weight-bold mx-auto py-0" style="margin-right: 50px !important; font-weight: bold; font-size: 20px; margin-top: 25px;">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="nav-link dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false" style="border: none; font-weight: bold;">
                            Dropdown
                        </button>
                        <ul class="dropdown-menu rounded-0 m-0">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="nav-link dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false" style="border: none; font-weight: bold;">
                            Dropdown
                        </button>
                        <ul class="dropdown-menu rounded-0 m-0">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="nav-link dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false" style="border: none; font-weight: bold;">
                            게시판
                        </button>
                        <ul class="dropdown-menu rounded-0 m-0">
                            <li><a class="dropdown-item" href="${path}/board/list.do">자유게시판</a></li>
                            <li><a class="dropdown-item" href="${path}/fileboard/list.do">자료실</a></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="nav-link dropdown-toggle " data-bs-toggle="dropdown" aria-expanded="false" style="border: none; font-weight: bold;">
                            고객문의
                        </button>
                        <ul class="dropdown-menu rounded-0 m-0">
                            <li><a class="dropdown-item" href="${path}/notice/list.do">공지사항</a></li>
                            <li><a class="dropdown-item" href="${path}/qna/list.do">QNA</a></li>
                            <li><a class="dropdown-item" href="${path}/faq/list.do">FAQ</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <c:if test="${sid eq null}">
                <a href="${path}/user/term.do" class="btn btn-primary px-4" style="width: 100px; font-size: 15px; height: 40px; margin-top: 20px; padding: 8px; background: #71A894; border: none;">Sign up</a>
                <a href="${path}/user/login.do" class="btn btn-primary px-4" style="width: 100px; font-size: 15px; height: 40px; margin-top: 20px; padding: 8px; background: #4F5665; border: none; margin-left:10px;">Log in</a>
            </c:if>
            <c:if test="${sid ne null and sid ne 'admin'}">
                <a href="${path}/user/login2.do" class="btn btn-primary px-4" style="width: 100px; font-size: 15px; height: 40px; margin-top: 20px; padding: 8px; background: #71A894; border: none;">MyPage</a>
                <a href="${path}/user/logout.do" class="btn btn-primary px-4" style="width: 100px; font-size: 15px; height: 40px; margin-top: 20px; padding: 8px; background: #4F5665; border: none; margin-left:10px;">LogOut</a>
            </c:if>
            <c:if test="${sid ne null and sid eq 'admin'}">
                <a href="${path}/admin/memberlist.do" class="btn btn-primary px-4" style="width: 100px; font-size: 15px; height: 40px; margin-top: 20px; padding: 8px; background: #71A894; border: none;">Admin</a>
                <a href="${path}/user/logout.do" class="btn btn-primary px-4" style="width: 100px; font-size: 15px; height: 40px; margin-top: 20px; padding: 8px; background: #4F5665; border: none; margin-left:10px;">LogOut</a>
            </c:if>
        </div>
    </nav>
</div>
