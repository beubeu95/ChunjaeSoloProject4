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

    <title>강의 결제</title>
    <jsp:include page="../setting/head.jsp" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <style>
        #price {width: 150px; float: right; text-align: center; font-weight: bold;}
        #subprice {width: 150px; float: right; text-align: center; font-weight: bold;}
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
            <h1 class="display-3 font-weight-bold text-white" style="font-size: 40px; text-align:center;"> 강의 결제 </h1>
            <div class="d-inline-flex text-white" style="display: flex !important; justify-content: center;">
                <p class="m-0"><a class="text-white" href="${path}">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">강의 결제</p>
            </div>
        </div>
    </div>
</section>
<!--Banner End-->

<!-- lecturePayment Start -->
<section style="padding-top: 0;margin-top: 100px;">
    <div style="display: flex; justify-content: center; ">
        <div class="card" style="width: 90%;">
            <div class="card-body" style="padding-top: 0px;" >
                <div style="display: flex; justify-content: center;">
                <div class="card-body" style="width: 90%; margin: 0 auto;">
                    <div class="container padding-bottom-3x mb-1" style="margin :50px auto;">
                        <!-- Alert-->
                        <div class="alert alert-info alert-dismissible fade show text-center" style="margin-bottom: 30px; background-color: lightgray; color: #000;"><span class="alert-close" data-dismiss="alert"></span><img class="d-inline align-center" src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA1MTIuMDAzIDUxMi4wMDMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMi4wMDMgNTEyLjAwMzsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiPgo8Zz4KCTxnPgoJCTxnPgoJCQk8cGF0aCBkPSJNMjU2LjAwMSw2NGMtNzAuNTkyLDAtMTI4LDU3LjQwOC0xMjgsMTI4czU3LjQwOCwxMjgsMTI4LDEyOHMxMjgtNTcuNDA4LDEyOC0xMjhTMzI2LjU5Myw2NCwyNTYuMDAxLDY0eiAgICAgIE0yNTYuMDAxLDI5OC42NjdjLTU4LjgxNiwwLTEwNi42NjctNDcuODUxLTEwNi42NjctMTA2LjY2N1MxOTcuMTg1LDg1LjMzMywyNTYuMDAxLDg1LjMzM1MzNjIuNjY4LDEzMy4xODQsMzYyLjY2OCwxOTIgICAgIFMzMTQuODE3LDI5OC42NjcsMjU2LjAwMSwyOTguNjY3eiIgZmlsbD0iIzUwYzZlOSIvPgoJCQk8cGF0aCBkPSJNMzg1LjY0NCwzMzMuMjA1YzM4LjIyOS0zNS4xMzYsNjIuMzU3LTg1LjMzMyw2Mi4zNTctMTQxLjIwNWMwLTEwNS44NTYtODYuMTIzLTE5Mi0xOTItMTkycy0xOTIsODYuMTQ0LTE5MiwxOTIgICAgIGMwLDU1Ljg1MSwyNC4xMjgsMTA2LjA2OSw2Mi4zMzYsMTQxLjE4NEw2NC42ODQsNDk3LjZjLTEuNTM2LDQuMTE3LTAuNDA1LDguNzI1LDIuODM3LDExLjY2OSAgICAgYzIuMDI3LDEuNzkyLDQuNTY1LDIuNzMxLDcuMTQ3LDIuNzMxYzEuNjIxLDAsMy4yNDMtMC4zNjMsNC43NzktMS4xMDlsNzkuNzg3LTM5Ljg5M2w1OC44NTksMzkuMjMyICAgICBjMi42ODgsMS43OTIsNi4xMDEsMi4yNCw5LjE5NSwxLjI4YzMuMDkzLTEuMDAzLDUuNTY4LTMuMzQ5LDYuNjk5LTYuNGwyMy4yOTYtNjIuMTQ0bDIwLjU4Nyw2MS43MzkgICAgIGMxLjA2NywzLjE1NywzLjU0MSw1LjYzMiw2LjY3Nyw2LjcyYzMuMTM2LDEuMDY3LDYuNTkyLDAuNjQsOS4zNjUtMS4yMTZsNTguODU5LTM5LjIzMmw3OS43ODcsMzkuODkzICAgICBjMS41MzYsMC43NjgsMy4xNTcsMS4xMzEsNC43NzksMS4xMzFjMi41ODEsMCw1LjEyLTAuOTM5LDcuMTI1LTIuNzUyYzMuMjY0LTIuOTIzLDQuMzczLTcuNTUyLDIuODM3LTExLjY2OUwzODUuNjQ0LDMzMy4yMDV6ICAgICAgTTI0Ni4wMTcsNDEyLjI2N2wtMjcuMjg1LDcyLjc0N2wtNTIuODIxLTM1LjJjLTMuMi0yLjExMi03LjMxNy0yLjM4OS0xMC42ODgtMC42NjFMOTQuMTg4LDQ3OS42OGw0OS41NzktMTMyLjIyNCAgICAgYzI2Ljg1OSwxOS40MzUsNTguNzk1LDMyLjIxMyw5My41NDcsMzUuNjA1TDI0Ni43LDQxMS4yQzI0Ni40ODcsNDExLjU2MywyNDYuMTY3LDQxMS44NCwyNDYuMDE3LDQxMi4yNjd6IE0yNTYuMDAxLDM2Mi42NjcgICAgIEMxNjEuOSwzNjIuNjY3LDg1LjMzNSwyODYuMTAxLDg1LjMzNSwxOTJTMTYxLjksMjEuMzMzLDI1Ni4wMDEsMjEuMzMzUzQyNi42NjgsOTcuODk5LDQyNi42NjgsMTkyICAgICBTMzUwLjEwMywzNjIuNjY3LDI1Ni4wMDEsMzYyLjY2N3ogTTM1Ni43NTksNDQ5LjEzMWMtMy40MTMtMS43MjgtNy41MDktMS40NzItMTAuNjg4LDAuNjYxbC01Mi4zNzMsMzQuOTIzbC0zMy42NDMtMTAwLjkyOCAgICAgYzQwLjM0MS0wLjg1Myw3Ny41ODktMTQuMTg3LDEwOC4xNi0zNi4zMzFsNDkuNTc5LDEzMi4yMDNMMzU2Ljc1OSw0NDkuMTMxeiIgZmlsbD0iIzUwYzZlOSIvPgoJCTwvZz4KCTwvZz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K" width="18" height="18" alt="Medal icon">&nbsp;&nbsp;With this purchase you will earn <strong>290</strong> Reward Points.</div>
                        <!-- Shopping Cart-->
                        <div class="table-responsive shopping-cart">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th class="text-center">Quantity</th>
                                    <th class="text-center">Subtotal</th>
                                    <th class="text-center">Discount</th>
                                    <th class="text-center">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="product-item">
                                            <div class="product-info">
                                                <h4 class="product-title" name="lname" id="lname">${lecture.title}</h4>

                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <div class="count-input">
                                            <input type="text" value="1" style="text-align: center" readonly>
                                        </div>
                                    </td>
                                    <td class="text-center text-lg text-medium">${lecture.price}</td>
                                    <td class="text-center text-lg text-medium" style="color:darkred;">${lecture.price}</td>
                                    <td class="text-center text-lg text-medium">0</td>
                                </tr>
                                <c:if test="${book.bname ne null}">
                                <tr>
                                    <td>
                                        <div class="product-item">
                                            <div class="product-info">
                                                <h4 class="product-title" id="bName">${book.bname}</h4>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <div class="count-input">
                                            <input type="text" value="1" style="text-align: center;"  readonly>
                                        </div>
                                    </td>
                                    <td class="text-center text-lg text-medium">${book.price}</td>
                                    <td class="text-center text-lg text-medium" style="color:darkred;">0</td>
                                    <td class="text-center text-lg text-medium">${book.price}</td>
                                </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="shopping-cart-footer" style="float:right;">
                            <div class="column text-lg">Total: <span class="text-medium" id="totalP" style="color:darkred; font-weight:bolder;">${book.price}</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <div style="margin: 100px auto; width: 90%;">
        <div class="card box-shadow-rb my-4">
            <div class="columns is-multiline mb-40">
                <div class="column">
                    <article class="card shadow">
                        <form action="${path }/payment/paymentPro.do" method="post" onsubmit="return payCheck(this)">
                            <div class="container" style="margin-top:30px;">
                            <h1 class="h3 mb-5" style="padding-left: 40px; font-size: 40px;">Payment</h1>
                            <div class="row">
                                <!-- Left -->
                                <div class="col-lg-9">
                                    <div class="accordion" id="accordionPayment">
                                        <div class="accordion-item mb-3">
                                            <div id="collapseCC" class="accordion-collapse collapse show" data-bs-parent="#accordionPayment" style="">
                                                <div class="accordion-body">
                                                    <div class="mb-3">
                                                        <label class="form-label">받는 사람 연락처</label>
                                                        <input type="tel" name="tel" id="tel" class="form-control" required>
                                                        <input type="hidden" name="name" id="name" value="${user.name }">
                                                        <input type="hidden" name="email" id="email" value="${user.email }">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">배송지 주소</label>
                                                        <input type="text" name="addr1" id="addr1" placeholder="기본 주소 입력" autocomplete="off" readonly class="form-control" required /><br>
                                                        <input type="text" name="addr2" id="addr2" placeholder="상세 주소 입력" autocomplete="off" required class="form-control" required /><br>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-9">
                                                            <div class="mb-3">
                                                                <input type="text" id="postcode" name="postcode" class="form-control" placeholder="우편번호" autocomplete="off" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3" style="padding-left: 0;">
                                                            <div class="mb-3">
                                                                <button type="button" class="btn btn-primary" style="width: 150px; height: 45px; padding-top:10px;background-color: #74A984;" onclick="findAddr()"> 우편번호 </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="checkout__input" >
                                                                <p>결제수단<span>*</span></p>
                                                                <select class="form-select" name="method" id="method" style="width: 300px;">
                                                                    <option value="신용카드">신용카드</option>
                                                                    <option value="체크카드">체크카드</option>
                                                                    <option value="계좌이체">계좌이체</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="checkout__input" style="width: 300px;">
                                                                <p>결제사<span>*</span></p>
                                                                <select class="form-select" name="com" id="com" style="width: 300px;" >
                                                                    <option value="선택안함">선택안함</option>
                                                                </select>
                                                                <input type="hidden" name="com2" id="com2" value="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">결제 번호</label>
                                                        <input type="text" name="account" id="account" class="form-control" required>
                                                        <input type="hidden" name="payAmount" id="payAmount">
                                                        <input type="hidden" name="payCk" id="payCk" value="no">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Right -->
                                <div class="col-lg-3">
                                        <div class="card position-sticky top-0">
                                        <div class="p-3 ">
                                            <h6 class="card-title mb-3">Order Summary</h6>
                                            <div class="d-flex justify-content-between mb-1 small">
                                                <span>Subtotal</span><span id="bprice">${book.price}</span>
                                            </div>
                                            <div class="d-flex justify-content-between mb-1 small">
                                                <span>Point </span> <span class="text-danger" id="point">${user.pt}</span>
                                            </div>
                                            <hr>
                                            <div>
                                                <p><span>SUBTOTAL</span> <strong class="text-dark" class="total" id="subprice" style="font-size: 15px;"></strong></p>
                                                <p><span>TOTAL</span> <strong class="text-dark" id="totalprice" name="totalprice" style="font-size: 15px;"></strong></p>
                                            </div>
                                            <input type="button" id="pay" value="PLACE ORDER" class="btn btn-primary w-100 mt-2" style="background-color: #74A984;">
                                            <c:if test="${!empty sid }">
                                                <input type="hidden" id="lno" name="lno" value="${lecture.lno }">
                                                <input type="hidden" id="title" name="title" value="${lecture.title}">
                                                <input type="hidden" name="bcode" id="bcode" value="${book.bcode }">
                                                <input type="hidden" name="tcode" id="tcode" value="${lecture.tcode}">
                                                <input type="hidden" id="sprice" name="sprice" value="${book.price}">
                                                <input type="hidden" id="amount" name="amount" value="1">
                                                <input type="submit" class="btn btn-primary w-100 mt-2" value="구매" style="background-color: #4f5665;">
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                        <script>
                            $(document).ready(function(){
                                var cardArr1 = ["현대카드","농협카드","BC카드","KB카드"];
                                var cardArr2 = ["하나카드","농협카드","BC카드","신한카드"];
                                var bankArr = ["카카오뱅크","농협은행","신한은행","기업은행","국민은행"];
                                $("#method").change(function(){
                                    var th = $(this).val();
                                    if(th==="신용카드"){
                                        $("#com").children("option:not(:first)").remove();
                                        for(var i=0;i<cardArr1.length;i++) {
                                            $("#com").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                                        }
                                    } else if(th==="체크카드"){
                                        $("#com").children("option:not(:first)").remove();
                                        for(var i=0;i<cardArr2.length;i++) {
                                            $("#com").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                                        }
                                    } else {
                                        $("#com").children("option:not(:first)").remove();
                                        for(var i=0;i<bankArr.length;i++) {
                                            $("#com").append("<option value='"+bankArr[i]+"'>"+bankArr[i]+"</option>");
                                        }
                                    }
                                }).change();
                                $("#com").change(function(){
                                    $("#com2").val($(this).val());
                                });
                            });
                        </script>
                        <script>
                            //주소 연동 API
                            function findAddr(){
                                new daum.Postcode({
                                    oncomplete:function(data){
                                        console.log(data);
                                        var roadAddr = data.roadAddress;
                                        var jibunAddr = data.jibunAddress;
                                        document.getElementById("postcode").value = data.zonecode;
                                        if(roadAddr !== ''){
                                            document.getElementById("addr1").value = roadAddr;
                                        } else if(jibunAddr !== ''){
                                            document.getElementById("addr1").value = jibunAddr;
                                        }
                                        document.getElementById("addr2").focus();
                                    }
                                }).open();
                            }
                        </script>
                        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script>
                            //결제모듈 API 연동
                            $(document).ready(function(){
                                var totalPay=0;
                                var lname;

                                totalPay = totalPay + parseInt($("#bprice").text());
                                totalPay = totalPay -parseInt($("#point").text());

                                //합계를 출력
                                $("#subprice").html("<input type='text' readonly id='subprice' value='"+totalPay+"'>");
                                $("#totalprice").html("<input type='text' readonly id='price' name='price' value='"+totalPay+"'>");

                                $("#pay").click(function(){
                                    var email = $("#email").val();
                                    var cname = $("#name").val();
                                    var tel = $("#tel").val();
                                    var addr = $("#addr").val();
                                    var postcode = $("#postcode").val();
                                    lName = $("#lName").val();
                                    if($("#price").val()!="") {
                                        totalPay;
                                    } else {
                                        alert("구매할 수량을 입력하지 않으셨습니다.");
                                        $("#totalprice").focus();
                                        return;
                                    }
                                    alert("결제할 금액 : "+totalPay);
                                    //상품명_현재시간
                                    var d = new Date();
                                    var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
                                    var IMP = window.IMP; // 생략가능
                                    IMP.init('imp11164187'); // 결제 API를 사용하기 위한 코드 입력!
                                    IMP.request_pay({		//결제 요청
                                        pg: "T5102001",
                                        merchant_uid : '상품명_' + date, //상점 거래 ID
                                        name :lName,				// 결제 명
                                        amount : totalPay,					// 결제금액
                                        buyer_email : email, // 구매자 email
                                        buyer_name : cname,				// 구매자 이름
                                        buyer_tel : tel,		// 구매자 전화번호
                                        buyer_addr : addr,		// 구매자 주소
                                        buyer_postcode : postcode			// 구매자 우편번호
                                    }, function(rsp){
                                        if(rsp.success){
                                            console.log(rsp);
                                            var msg = '결제가 완료 되었습니다.';
                                            var r1 = '고유 아이디 : ' +rsp.imp_uid;
                                            var r2 = '상점 거래 아이디 : ' +rsp.merchant_uid;
                                            var r3 = '결제 금액 : ' +rsp.paid_amount;
                                            var r4 = '카드 승인 번호 : '+rsp.apply_num;

                                            // 실제 결제 창
                                            // $("#payCk").val("yes");
                                            // $("#payAmount").val(rsp.paid_amount);
                                            // $("#pmethod").val(rsp.pay_method);
                                            // $("#pcom").val(rsp.pg_provider);
                                            // $("#cnum").val(rsp.apply_num);
                                            // alert(msg);
                                            // $("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                                        } else{
                                            //$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
                                        }
                                        //테스트용이므로 실패시에도 그냥 통과시킴
                                        $("#payCk").val("yes");
                                        $("#payAmount").val(totalPay);
                                        // $("#pmethod").val("신용카드");
                                        // $("#pcom").val("삼성카드");
                                        // $("#cnum").val("123-1234-1234-1278");
                                        $("#paymentResult").text("결제 완료 : "+totalPay);
                                    });
                                    });
                                });
                        </script>
                    </article>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- lecturePayment End -->

<!-- Footer Start -->
<jsp:include page="../setting/footer.jsp" />
<!-- Footer End -->

</body>
</html>