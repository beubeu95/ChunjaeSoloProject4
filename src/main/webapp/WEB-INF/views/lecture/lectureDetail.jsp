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

    <title>강의 상세보기</title>
    <jsp:include page="../setting/head.jsp" />
    <style>
        .player_btn {
            border: none;
            background-color: #ffffff;
        }

        #progressBar {
            width: 0px;
            height: 10px;
            background-color: #007cf0;
            transition: 1s;
            margin-top: -10px;
        }

        #btn-right {
            display: inline-block;
            float: right;
        }

        h4 {
            font-family: 'Roboto', 'sans-serif';
        }
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 강의 상세보기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">강의 상세보기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- lectureDetail Start-->
<section style="padding-top: 0;margin-top: 100px;">
    <div style="width: 90%; margin: 0 auto; padding-left: 20px;">
        <h2><i class="fa-solid fa-cloud"></i>&nbsp;&nbsp;${lecture.title}</h2>
    </div>
    <div style="display: flex; justify-content: center; ">
        <div class="card" style="width: 90%;">
            <div class="card-body" >
                <div style="display: flex; justify-content: center; margin-top: 30px;">
                    <div class="col-6 col-md-5" style="margin-right: 200px;">
                        <ul class="list-inline m-0">
                            <li class="py-2 border-top border-bottom">
                                <i class="fa-solid fa-book-open-reader text-primary mr-3"></i>
                                    &nbsp;&nbsp;<strong>과목</strong>&nbsp;&nbsp;${lecture.cateName}
                            </li>
                            <li class="py-2 border-bottom">
                                <i class="fa-solid fa-person-chalkboard text-primary mr-3"></i>
                                &nbsp;&nbsp;<strong>강사</strong>&nbsp;&nbsp;${lecture.tname}
                            </li>
                            <li class="py-2 border-bottom">
                                <i class="fa-solid fa-book"></i>
                                &nbsp;&nbsp;<strong>교재</strong>&nbsp;&nbsp;${lecture.bname}
                            </li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-5">
                        <ul class="list-inline m-0">
                            <li class="py-2 border-top border-bottom">
                                <i class="fa-solid fa-calendar text-primary mr-3"></i>
                                &nbsp;&nbsp;<strong>기간</strong>&nbsp;&nbsp;${lecture.sdate} ~ ${lecture.edate}(${lecture.tdate}일)
                            </li>
                            <li class="py-2 border-bottom">
                                <c:if test='${lecture.status eq "1"}'>
                                    <i class="fa-solid fa-check-to-slot text-primary mr-3"></i>
                                        &nbsp;&nbsp;<strong>현황</strong><span style="color: darkred;">&nbsp;&nbsp;모집중 (오프라인 강좌)</span>
                                </c:if>
                                <c:if test='${lecture.status eq "0"}'>
                                    <i class="fa-solid fa-check-to-slot text-primary mr-3"></i>
                                        &nbsp;&nbsp;<strong>현황</strong><span style="color: darkgray;">&nbsp;&nbsp;마감 (오프라인 강좌)</span>
                                </c:if>
                            </li>
                            <li class="py-2 border-bottom">
                                <i class="fa-solid fa-paperclip text-primary mr-3"></i>
                                &nbsp;&nbsp;<strong>수강인원</strong>&nbsp;&nbsp;${lecture.amt}명
                                  <c:if test='${lecture.status eq "1"}'>
                                    <strong style="color:darkred";>(남은 인원 : ${canApp} 명)</strong>
                                  </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
                <div style="float: right; margin-right: 50px;">
                    <input type="hidden" name="id" id="id" value="${sid}">
                    <input type="hidden" id="lno" name="lno" value="${lecture.lno}">
                    <input type="hidden" id="bcode" name="bcode" value="${lecture.bcode}">
                    <input type="hidden" id="tcode" name="tcode" value="${lecture.tcode}">
                <button type="button" id="ck_btn" class="btn btn-primary mt-2 py-2 px-4" onclick="payCheck()" style="margin-top: 30px!important; background-color: #71A894; border: none; font-weight: bold;">수강신청</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function payCheck() {
            let id = $("#id").val();
            let lno = $("#lno").val();
            let bcode = $("#bcode").val()
            let amt = $("#amt").val();

            if (id) {
                // 수강생을 모집중인 강의만 신청 받도록 구현
                let status = ${lecture.status};

                if (status === 1) {
                    let params = { id: id, lno: lno };
                    $.ajax({
                        url: "${path}/payment/payCheck.do",
                        type: "post",
                        dataType: "json",
                        data: params,
                        success: function (data) {
                            console.log("HI");
                            let appPass = data.result;
                            let curApp = data.curApp;
                            if (curApp >= amt) {
                                alert("이미 마감되었습니다.");
                            } else if (!appPass) {
                                alert("이미 수강신청한 회원입니다.");
                            } else {
                                window.location.href = "${path}/payment/payment.do?lno=" + lno + "&bcode=" + bcode;
                            }
                        },
                        error: function (res) {
                            alert("잠시 후 다시 시도해주세요.");
                            console.log(res.responseText);
                        }
                    });
                } else {
                    alert("해당 강의는 수강신청 기간이 아닙니다.");
                }
            } else {
                alert("로그인이 필요한 서비스입니다. 로그인 후 다시 시도해주세요.");
                window.location.href = "${path}/user/login.do";
            }
        }
    </script>
    <div style="margin: 100px auto; width: 90%;">
        <div class="card box-shadow-rb my-4">
            <div class="columns is-multiline mb-40">
                <div class="column">
                    <article class="card shadow">
                        <figure class="image is-4by3" style="padding-top: 0;">
                            <div class="player" style="width:800px; margin: 0 auto;">
                                <div class="vdo_fr">
                                    <c:forEach var="item" items="${file}">
                                    <video id="video" style="width: 100%">
                                        <source src=${pageContext.request.contextPath}/resources/upload/${item.saveFolder}/${item.saveFile}" type="video/mp4"/>
                                    </video>
                                    </c:forEach>
                                </div>
                                <div id="progress">
                                    <div id="progressBar" class="mb-2"></div>
                                </div>
                                <div id="buttonbar" >
                                    <button id="play" class="player_btn"> <i class="fas fa-play"></i> </button>
                                    <button id="pause" style="display: none" class="player_btn"> <i class="fas fa-pause"></i> </button>
                                    <button id="stop" class="player_btn"> <i class="fas fa-stop"></i> </button>
                                    <span id="currentTime"> 00:00 / 02:11 </span>
                                    <div id="btn-right">
                                        <input id="vol" type="range" value="500" min="0" max="1000">
                                        <button id="volTxt" class="player_btn">50%</button>
                                        <button id="full" class="player_btn"><i class="fa-solid fa-expand"></i></button>
                                    </div>
                                    <script src="${path}/resources/js/vdo.js"></script>
                                </div>
                            </div>
                        </figure>
                        <div class="card-content has-text-centered" style="margin: 0 auto; width: 800px;">
                            <h4 class="mb-10" style="font-family:'sans-serif'; font-weight: bold;margin-bottom: 20px!important;">${lecture.title} </h4>
                            <p class="mb-10" style="font-family:'sans-serif'; font-weight: bold;">${lecture.content} </p>
                        </div>
                        <div class="card-body my-3 mx-4">
                            <c:if test="${sid ne null}">
                                <form action="${path}/comment/insertLec.do" method="post" >
                                    <div style="display: flex;">
                                        <div class="form-group" style="width: 90%">
                                            <textarea name="content" id="content" class="form-control" maxlength="990" rows="2" placeholder="댓글을 달아주세요 :)"></textarea>
                                        </div>
                                        <div class="col" style="margin-left: 50px;">
                                            <input type="hidden" id="lno" name="lno" value="${lecture.lno}">
                                            <input type="hidden" id="amt" name="amt" value="${lecture.amt}">
                                            <input type="hidden" id="page" name="page" value="${curPage}">
                                            <c:if test="${!empty cate}">
                                                <input type="hidden" id="cate" name="cate" value="${cate}">
                                            </c:if>
                                            <input type="submit" class="btn btn-secondary btn-block border-0 py-3" style="height:72px; width: 150px;" value="전송">
                                        </div>
                                    </div>`
                                </form>
                            </c:if>

                            <c:forEach var="comment" items="${commentList}">
                                <div class="row">
                                    <h6 style="width: 75%;" > ${comment.author} </h6>
                                    <h6 class="text-right" style="margin-top: 3px; padding: 0; width: 10%;">
                                        <fmt:parseDate value="${comment.resdate}" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                                    </h6>
                                    <c:if test="${(sid eq 'admin') or (sid eq comment.author)}">
                                        <a style="width: 10%; margin-bottom: 10px;" href="${path}/comment/deleteLec.do?comNo=${comment.comNo}&lno=${lecture.lno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if>" class="btn btn-sm btn-danger">Delete</a>
                                    </c:if>
                                </div>
                                <div class="row">
                                    <div class="col" style=" margin-bottom: 30px;">
                                        <textarea class="form-control" style="background-color: lightgray;" readonly>${comment.content}</textarea>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- Pagination -->
                            <nav class="mt-5 mb-6">
                                <ul class="pagination justify-content-center">
                                    <c:if test="${commentPage > 5}">
                                        <li class="page-item">
                                            <a href="${path}/lecture/getLecture.do?lno=${lecture.lno}&page=${curPage}&commentPage=${page.blockStartNum - 1}<c:if test="${!empty cate}">&cate=${cate}</c:if>" class="page-link">Previous</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${page.blockLastNum < page.totalPageCount}">
                                        <li class="page-item">
                                            <a href="${path}/lecture/getLecture.do?lno=${lecture.lno}&page=${curPage}&commentPage=${page.blockLastNum + 1}<c:if test="${!empty cate}">&cate=${cate}</c:if><c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link">Next page</a>
                                        </li>
                                    </c:if>
                                    <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                        <li class="page-item">
                                            <c:choose>
                                                <c:when test="${i == commentPage}">
                                                    <a href="${path}/lecture/getLecture.do?lno=${lecture.lno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if>" class="page-link active" style="background-color: #71A894; color:#FFFFFF;" aria-current="page">${i}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="${path}/lecture/getLecture.do?lno=${lecture.lno}&page=${curPage}&commentPage=${i}<c:if test="${!empty cate}">&cate=${cate}</c:if>" class="page-link">${i}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- lectureDetail End-->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>