<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Haebeop</title>
    <jsp:include page="setting/head.jsp" />
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar">
<!--    Main Content-->
<main class="main" id="top">
    <!-- header begin -->
    <jsp:include page="setting/header.jsp" />
    <!-- header end -->

    <!-- <section> begin-->
    <section class="pt-8 py-lg-0" id="hero">
        <div class="container-xxl">
            <div class="row align-items-center min-vh-lg-100">
                <div class="col-lg order-lg-1 text-center"><img class="img-fluid" src="${path}/resources/img/illustrations/hero.png" alt="" /></div>
                <div class="col-lg mt-5 mt-lg-0">
                    <h1 class="lh-sm font-cursive fw-medium fs-6 fs-sm-8 fs-md-11 fs-lg-9 fs-xl-11 fs-xxl-12">A new model for <br class="d.none d-xl-block" /> open collaboration</h1>
                    <p class="mt-4 fs-2 fs-md-4 lh-sm">Run an organization where members get rewarded for their contributions with fractional ownership.</p><button class="btn btn-success mt-4">Request early access</button>
                </div>
            </div>
        </div><!-- end of .container-->
    </section>
    <!-- <section> close-->

    <!-- <section> begin-->
    <section class="pt-xxl-0" id="features">
        <div class="container-xxl">
            <div class="row justify-content-center text-center">
                <div class="col-lg-10 col-xl-8">
                    <h1 class="display-6 font-cursive">Reimagining what it means to work</h1>
                    <p class="fs-md-1 mt-4">Teams and communities using Open Enterprise fundamentally unlock a reality of work that reimagines how people engage in economic opportunity, meeting the demands and expectations of a modern organization.</p>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-xl-3 g-4 mt-3 text-center">
                <div class="col-12 col-md-6">
                    <div class="card py-md-6 px-md-4 mt-3 h-100 box-shadow-all border-0">
                        <div class="card-body"><img src="${path}/resources/img/icons/icon1.png" alt="" />
                            <h3 class="py-3">Modern workforce</h3>
                            <p class="lead mb-0">Multistakeholder governance aligns employees with the organization’s wider community.</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="card py-md-6 px-md-4 mt-3 h-100 box-shadow-all border-0">
                        <div class="card-body"><img src=""${path}/resources/img/icons/icon2.png" alt="" />
                            <h3 class="py-3">Meritocratic by design</h3>
                            <p class="lead mb-0">Tokenized ownership aligns deeply committed individuals with the organization’s success.</p>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card py-md-6 px-md-4 mt-3 h-100 box-shadow-all border-0">
                        <div class="card-body"><img src="${path}/resources/img/icons/icon3.png" alt="" />
                            <h3 class="py-3">Engineered for resilience</h3>
                            <p class="lead mb-0">Open Enterprise supports best practices in sociocratic management.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- end of .container-->
    </section>
    <!-- <section> close-->

    <!-- <section> begin-->
    <section id="contribute">
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-md-6"><img src="${path}/resources/img/icons/icon1.png" alt="" />
                    <h1 class="display-5 lh-sm my-4 font-cursive">Kickstart an organization with your co-founders</h1>
                    <p class="fs-1">It’s the early days, you just had a long conversation with two friends about a meaningful challenge that you’re all passionate about and have a potential solution for. You’re ready to embark the startup journey.</p>
                </div>
                <div class="col-md-6 col-xl-4 offset-xl-1">
                    <div class="card box-shadow-rb my-4">
                        <div class="card-body my-3 mx-4">
                            <h1 class="mb-4 pb-2">Members</h1>
                            <div class="d-flex align-items-center mt-3"><img class="rounded-circle" src="${path}/resources/img/gallery/user1.png" alt="" height="70" />
                                <div class="ms-3">
                                    <h3>Dillon Kydd</h3>
                                    <p class="mb-0">100 SHARES</p>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mt-3"><img class="rounded-circle" src="${path}/resources/img/gallery/user2.png" alt="" height="70" />
                                <div class="ms-3">
                                    <h3>Anna Olsen</h3>
                                    <p class="mb-0">100 SHARES</p>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mt-3"><img class="rounded-circle" src="${path}/resources/img/gallery/user3.png" alt="" height="70" />
                                <div class="ms-3">
                                    <h3>Kas Moss</h3>
                                    <p class="mb-0">100 SHARES</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- end of .container-->
    </section>
    <!-- <section> close -->

    <!-- <section> begin -->
    <section>
        <div class="container-xxl">
            <div class="row flex-between-center">
                <div class="col-md-6 order-md-1"><img src="${path}/resources/img/icons/icon2.png" alt="" />
                    <h1 class="display-5 lh-sm my-4 font-cursive">Onboard users, investors and advisors as you grow</h1>
                    <p class="fs-1">You’ve bootstrapped and delivered an MVP, and some investors and advisors are interested in having a chat with you. As an Open Enterprise, you can onboard them seamlessly into your digital organization and align them with your success.</p>
                </div>
                <div class="col-md-6 col-xl-5">
                    <div class="card my-4">
                        <div class="card-body p-0 p-lg-3 my-3 mx-4">
                            <div class="card-title">
                                <div class="d-flex align-items-center mt-3"><img class="rounded-circle" src="${path}/resources/img/gallery/user4.png" alt="" height="70" />
                                    <div class="ms-3">
                                        <h3>Jassir Jonis</h3>
                                        <p class="mb-0">Pre-seed angel investor</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-text mt-4">
                                <p>Hey guys, love what you’re doing and I’m convinced that together we’ll achieve amazing things.</p>
                            </div>
                            <div class="card-text mt-4">
                                <div class="row gx-4">
                                    <div class="col">
                                        <p class="mb-1">COMMIT</p>
                                        <h3>10,000 DAI</h3>
                                    </div>
                                    <div class="col">
                                        <p class="mb-1">SHARES</p>
                                        <h3>20</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-3 pt-2"><button class="btn btn-dark btn-lg w-100">Go to vote</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- end of .container-->
    </section>
    <!-- <section> close-->

    <!-- <section> begin -->
    <section>
        <div class="container-xxl">
            <div class="row align-items-center gx-1">
                <div class="col-xl-6"><img src="${path}/resources/img/icons/icon3.png" alt="" />
                    <h1 class="display-5 lh-sm my-4 font-cursive">Engage highly committed contributors</h1>
                    <p class="fs-1">You need talented people on-demand across various tasks that your full-time workforce can’t prioritize at the moment. As an Open Enterprise, you can easily fund tasks and have people apply to work on them in return for funds or shares.</p>
                </div>
                <div class="col-xl-6">
                    <div class="row justify-content-center gx-4">
                        <div class="col-md-10">
                            <div class="card box-shadow-b p-2 p-md-3">
                                <div class="card-body flex-between-center pb-0">
                                    <h5 class="mb-0">Write a how-to on Open Enterprise</h5><span class="badge rounded-pill bg-success p-2 fs-0">1 SHARE</span>
                                </div>
                                <div class="card-body">
                                    <p class="mb-0">Looking for an amazing copywriter using Open Enterprise to help us write an article on how to get started.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 mt-4">
                            <div class="card px-3 py-4 bg-warning">
                                <div class="card-body">
                                    <h2>3 applicants</h2>
                                    <div class="applicant d-flex justify-content-between text-1000">
                                        <div class="d-flex align-items-center"><img class="rounded-circle my-2 me-2 me-md-3" src="${path}/resources/img/gallery/user5.png" alt="" height="40" />
                                            <p class="fs-1 fs-md-2 mb-0 fw-semi-bold">Jason Kwon</p>
                                        </div>
                                        <div class="d-flex align-items-center"><img class="star" src="${path}/resources/img/icons/star.svg" alt="" />
                                            <p class="mb-0 mx-2 fw-medium">4.8</p>
                                        </div>
                                    </div>
                                    <div class="applicant d-flex justify-content-between text-1000">
                                        <div class="d-flex align-items-center"><img class="rounded-circle my-2 me-2 me-md-3" src="${path}/resources/img/gallery/user6.png" alt="" height="40" />
                                            <p class="fs-1 fs-md-2 mb-0 fw-semi-bold">Alex Rose</p>
                                        </div>
                                        <div class="d-flex align-items-center"><img class="star" src="${path}/resources/img/icons/star.svg" alt="" />
                                            <p class="mb-0 mx-2 fw-medium">4.8</p>
                                        </div>
                                    </div>
                                    <div class="applicant d-flex justify-content-between text-1000">
                                        <div class="d-flex align-items-center"><img class="rounded-circle my-2 me-2 me-md-3" src="${path}/resources/img/gallery/user7.png" alt="" height="40" />
                                            <p class="fs-1 fs-md-2 mb-0 fw-semi-bold">Lizzie Ulrich</p>
                                        </div>
                                        <div class="d-flex align-items-center"><img class="star" src="${path}/resources/img/icons/star.svg" alt="" />
                                            <p class="mb-0 mx-2 fw-medium">4.8</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-5">
                            <div class="card p-2 mt-4 mt-md-5 border-success">
                                <div class="card-body">
                                    <div class="card-text text-center"><img class="rounded-circle" src="${path}/resources/img/gallery/axel.png" alt="" height="70" />
                                        <h4 class="mt-2 mb-1">Axel Rose </h4>
                                        <p class="text-secondary">UX Designer</p>
                                    </div>
                                    <div class="d-flex text-1000">
                                        <p class="mb-0 flex-1">4 COMMITS</p>
                                        <div class="d-flex align-items-center"><img class="star" src="${path}/resources/img/icons/star.svg" alt="" />
                                            <p class="mb-0 mx-2 fw-medium">4.8</p>
                                        </div>
                                    </div><button class="btn btn-lg btn-dark w-100 mt-3">View Profile</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- end of .container-->
    </section>
    <!-- <section> close -->

    <!-- <section> begin-->
    <section>
        <div class="container-xxl">
            <div class="row justify-content-center text-center">
                <div class="col-lg-10 col-xl-8">
                    <h1 class="display-6 font-cursive">Help us improve Open Enterprise</h1>
                    <p class="fs-md-1 mt-4">As an Open Enterprise ourselves, we are actively looking for new talent to join our mission of improving and delivering the Open Enterprise model to the world. Apply for open tasks and earn a stake in our success.</p>
                </div>
            </div>
            <div class="mt-4">
                <div class="swiper-container pb-4" data-pagination-target="pagination1">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide h-auto">
                            <div class="card py-3 px-4 mt-3 h-100 box-shadow-all border-0">
                                <div class="card-body">
                                    <h5 class="font-base lh-base">Ideate a list of features based on the Sociocracy model</h5>
                                    <p class="mb-0">We’re looking for someone interested in business theory and research that’ll help us bridge the gap between our s...</p>
                                </div>
                                <div class="card-footer d-flex flex-between-center border-0 bg-transparent pt-0"><span class="badge rounded-pill bg-success p-2 fs-0">5 AUT</span>
                                    <p class="mb-0 fw-bold text-1000">Apply by May 15</p>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide h-auto">
                            <div class="card py-3 px-4 mt-3 h-100 box-shadow-all border-0">
                                <div class="card-body">
                                    <h5 class="font-base lh-base">Update documentation with FAQs</h5>
                                    <p class="mb-0">Review our community chat for the most frequently asked questions and document answers for our product docs.</p>
                                </div>
                                <div class="card-footer d-flex flex-between-center border-0 bg-transparent pt-0"><span class="badge rounded-pill bg-success p-2 fs-0">5 AUT</span>
                                    <p class="mb-0 fw-bold text-1000">Apply by May 15</p>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide h-auto">
                            <div class="card py-3 px-4 mt-3 h-100 box-shadow-all border-0">
                                <div class="card-body">
                                    <h5 class="font-base lh-base">Tutorial video series</h5>
                                    <p class="mb-0">Create a series of video tutorials that cover everything from start to finish on using Open Enterprise.</p>
                                </div>
                                <div class="card-footer d-flex flex-between-center border-0 bg-transparent pt-0"><span class="badge rounded-pill bg-success p-2 fs-0">5 AUT</span>
                                    <p class="mb-0 fw-bold text-1000">Apply by May 15</p>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide h-auto">
                            <div class="card py-3 px-4 mt-3 h-100 box-shadow-all border-0">
                                <div class="card-body">
                                    <h5 class="font-base lh-base">Ideate a list of features based on the Sociocracy model</h5>
                                    <p class="mb-0">We’re looking for someone interested in business theory and research that’ll help us bridge the gap between our s...</p>
                                </div>
                                <div class="card-footer d-flex flex-between-center border-0 bg-transparent pt-0"><span class="badge rounded-pill bg-success p-2 fs-0">5 AUT</span>
                                    <p class="mb-0 fw-bold text-1000">Apply by May 15</p>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide h-auto">
                            <div class="card py-3 px-4 mt-3 h-100 box-shadow-all border-0">
                                <div class="card-body">
                                    <h5 class="font-base lh-base">Update documentation with FAQs</h5>
                                    <p class="mb-0">Review our community chat for the most frequently asked questions and document answers for our product docs.</p>
                                </div>
                                <div class="card-footer d-flex flex-between-center border-0 bg-transparent pt-0"><span class="badge rounded-pill bg-success p-2 fs-0">5 AUT</span>
                                    <p class="mb-0 fw-bold text-1000">Apply by May 15</p>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide h-auto">
                            <div class="card py-3 px-4 mt-3 h-100 box-shadow-all border-0">
                                <div class="card-body">
                                    <h5 class="font-base lh-base">Tutorial video series</h5>
                                    <p class="mb-0">Create a series of video tutorials that cover everything from start to finish on using Open Enterprise.</p>
                                </div>
                                <div class="card-footer d-flex flex-between-center border-0 bg-transparent pt-0"><span class="badge rounded-pill bg-success p-2 fs-0">5 AUT</span>
                                    <p class="mb-0 fw-bold text-1000">Apply by May 15</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination" id="pagination1"></div>
            </div>
        </div><!-- end of .container-->
    </section>
    <!-- <section> close-->

    <!-- <section> begin -->
    <section id="rea">
        <div class="container-xxl">
            <div class="row align-items-center">
                <div class="col-lg order-lg-1 text-center"><img class="img-fluid" src="${path}/resources/img/illustrations/hero2.png" alt="" /></div>
                <div class="col-lg mt-5 mt-lg-0">
                    <h1 class="lh-sm font-cursive fw-medium display-5">Start an Open Enterprise</h1>
                    <p class="mt-4 fs-1">If you can’t wait to run a new or existing organization on Open Enterprise and are willing to explore and navigate the beta, we’d love to get you started.</p><button class="btn btn-success mt-4">Request early access</button>
                </div>
            </div>
        </div><!-- end of .container-->
    </section>
    <!-- <section> close -->

    <!-- footer begin -->
    <jsp:include page="setting/footer.jsp" />
    <!-- footer end -->

</main>
</body>
</html>
