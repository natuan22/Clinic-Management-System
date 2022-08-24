<%-- 
    Document   : headerAdmin
    Created on : Aug 4, 2022, 1:11:06 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/"/>">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<c:url value="/admin"/>">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/admin/thuocs"/>">Quản lý thuốc</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/admin/stats"/>">Thống kê</a>
                    </li>
                </sec:authorize>
                    
                <sec:authorize access="hasRole('ROLE_YTA')">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<c:url value="/yta"/>">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/yta/thanh-toan"/>">Quản lý hoá đơn</a>
                    </li>
                </sec:authorize>
                     
                <sec:authorize access="hasRole('ROLE_BACSI')">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<c:url value="/bacsi"/>">Home</a>
                    </li>
                </sec:authorize>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#"></a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
            <c:url value="/admin/thuocs" var="action" />
            <form method="get" action="${action}" class="d-flex">
                <input class="form-control me-2" type="search" name="kw" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
