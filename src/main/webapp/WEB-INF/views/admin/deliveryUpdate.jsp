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

    <title>배송 수정하기</title>
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 배송 수정하기 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">배송 수정하기</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- deliveryUpdate Start -->
<section>
    <div class="container-md p-5 mt-5">
        <h4 class="mb-2"> 주문 정보 </h4>
        <div class="border p-4">
            <div class="row">
                <div class="form-outline mb-4 col col-3">
                    <input type="text" name="dno" class="form-control form-control"value="${delivery.dno}" readonly />
                    <label class="form-label" for="title"> 배송번호 </label>
                </div>

                <div class="form-outline mb-4 col col-9">
                    <input type="text" id="title" name="title" class="form-control form-control" value="${delivery.title}" readonly />
                    <label class="form-label" for="title"> 상품명 </label>
                </div>
            </div>
            <div class="row">
                <div class="form-outline mb-4 col col-6">
                    <input type="text" class="form-control" id="id" name="id" value="${delivery.id}" readonly>
                    <label for="id" class="form-label"> 주문자 ID </label>
                </div>
                <div class="form-outline mb-4 col col-6">
                    <input type="text" class="form-control" id="tel" name="tel" value="${delivery.tel}" readonly>
                    <label for="tel" class="form-label"> 주문자 전화번호 </label>
                </div>
            </div>
            <div class="form-outline">
                <input class="form-control form-control" type="text" name="addr" id="addr" value="${delivery.addr}" readonly>
                <label for="addr" class="form-label"> 배송지주소 </label>
            </div>
        </div>

        <h4 class="mt-5 mb-2"> 배송 정보 </h4>
        <form name="frm1" id="frm1" action="${path}/admin/UpdateDeliveryPro.do" method="post" class="border p-4">
            <div class="row">
                <div class="form-outline mb-4 col col-4">
                    <input type="hidden" id="dno" name="dno" value="${delivery.dno}">
                    <input type="hidden" id="type" name="type" value="${param.type}">
                    <input type="date" id="resdate" name="resdate" class="form-control form-control" value="${fn:substring(delivery.resdate, 0, 10)}" readonly />
                    <label class="form-label" for="resdate"> 결제일 </label>
                </div>
                <div class="form-outline mb-4 col col-4">
                    <input type="date" id="edate" name="edate" class="form-control form-control" value="${fn:substring(delivery.edate, 0, 10)}" required />
                    <label class="form-label" for="edate"> 배송예정일 </label>
                </div>
            </div>
            <div class="row">
                <div class="form-outline mb-4 col col-4">
                    <input type="text" class="form-control" id="dcom" name="dcom" value="${delivery.dcom}" required>
                    <label for="dcom" class="form-label"> 배송사 </label>
                </div>
                <div class="form-outline mb-4 col col-8">
                    <input type="text" class="form-control" id="dtel" name="dtel" value="${delivery.dtel}" required>
                    <label for="dtel" class="form-label"> 배송기사 전화번호 </label>
                </div>
            </div>
            <div class="row">
                <div class="form-outline mb-4 col col-8">
                    <input class="form-control" type="text" name="dcode" id="dcode" value="${delivery.dcode}" required>
                    <label for="dcode" class="form-label"> 송장번호 </label>
                </div>
                <div class="form-outline mb-4 col col-4">
                    <select class="form-control" name="dstatus" id="dstatus">
                        <c:forEach var="dstatus" items="${state_list}" varStatus="status">
                            <c:if test="${delivery.current_state eq dstatus}">
                                <option value="${status.index}" selected> ${dstatus} </option>
                            </c:if>
                            <c:if test="${delivery.current_state ne dstatus}">
                                <option value="${status.index}"> ${dstatus} </option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <label for="dstatus" class="form-label"> 배송상태 </label>
                </div>
            </div>

            <div class="d-flex justify-content-center mt-4">
                <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4"> 배송정보 수정 </button>
            </div>
        </form>
    </div>
</section>
<!-- deliveryUpdate End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->
</body>
</html>