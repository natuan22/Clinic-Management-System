<%-- 
    Document   : header
    Created on : Jul 28, 2022, 4:10:16 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg bg-light shadow-lg"> <!-- fixed-top -->
    <div class="container">
        <a class="navbar-brand mx-auto d-lg-none" href="/QLPhongMach/">
            Medic Care
            <strong class="d-block">Health Specialist</strong>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value="/"/>">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dang-ky-kham"/>">Đăng ký khám bệnh</a>
                </li>

                <a class="navbar-brand d-none d-lg-block" href="/QLPhongMach/">
                    Medic Care
                    <strong class="d-block">Health Specialist</strong>
                </a>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dịch vụ
                    </a>
                    <ul class="dropdown-menu" style="width: 359px;" aria-labelledby="navbarDropdown">
                        <c:forEach items="${dichVuBenhViens}" var="c">
                            <c:url value="/" var="cUrl">
                                <c:param name="dichVuId" value="${c.id}" />
                            </c:url>
                            <li class="nav-item">
                                <a class="nav-link" href="${cUrl}">${c.ten}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Medic Care
                        </a>
                        <ul class="dropdown-menu" style="width: 359px;" aria-labelledby="navbarDropdown">
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="<c:url value="/login"/>">Đăng nhập</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="<c:url value="/register"/>">Đăng ký</a>
                            </li>
                        </ul>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            ${pageContext.session.getAttribute("currentUser").firstName}
                            ${pageContext.session.getAttribute("currentUser").lastName}
<!--                            (<sec:authentication property="principal.username" />)-->
                        </a>

                        <ul class="dropdown-menu" style="width: 359px;" aria-labelledby="navbarDropdown">
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="<c:url value="/lich-kham"/>">Lịch sử đăng ký khám bệnh</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="<c:url value="#${pageContext.request.userPrincipal.name}"/>">Chi tiết tài khoản</a>
                            </li>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <li class="nav-item">
                                    <a class="nav-link text-danger" href="<c:url value="/admin"/>">Quản trị</a>
                                </li>
                            </sec:authorize>

                            <sec:authorize access="hasRole('ROLE_BACSI')">
                                <li class="nav-item">
                                    <a class="nav-link text-danger" href="<c:url value="/bacsi"/>">Bác sĩ</a>
                                </li>
                            </sec:authorize>

                            <sec:authorize access="hasRole('ROLE_YTA')">
                                <li class="nav-item">
                                    <a class="nav-link text-danger" href="<c:url value="/yta"/>">Y tá</a>
                                </li>
                            </sec:authorize>
                            <li><hr class="dropdown-divider"></li>
                            <li class="nav-item">
                                <a class="nav-link text-danger" href="<c:url value="/logout"/>">Đăng xuất</a>
                            </li>
                        </ul>
                    </li>
                </sec:authorize>
            </ul>
        </div>

    </div>
</nav>
