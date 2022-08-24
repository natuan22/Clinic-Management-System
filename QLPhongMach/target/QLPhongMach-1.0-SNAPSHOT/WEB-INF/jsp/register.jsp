<%-- 
    Document   : register
    Created on : Aug 2, 2022, 9:07:09 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">ĐĂNG KÝ</h1>
    
    <c:if test="${errMsg != null}">
        <div class="alert alert-danger">
            ${errMsg}
        </div>
    </c:if>
    
    <c:url value="/register" var="action"/>
    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user">
        <div class="form-group">
            <label for="firstName">First name</label>
            <form:input type="text" id="firstName" path="firstName" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="lastName">Last name</label>
            <form:input type="text" id="lastName" path="lastName" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <form:input type="text" id="email" path="email" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <form:input type="tel" id="phone" path="phone" class="form-control"/>
        </div>
        <label for="gioiTinh">Gender</label>
        <form:select path="gioiTinh" class="form-select" id="gioiTinh">
            <option value="nam">Nam</option>
            <option value="nu">Nữ</option>
        </form:select>
        <div class="form-group">
            <label for="username">Username</label>
            <form:input type="text" id="username" path="username" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <form:input type="password" id="password" path="password" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm password</label>
            <form:input type="password" id="confirmPassword" path="confirmPassword" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="avatar">Avatar</label>
            <form:input type="file" id="avatar" path="file" class="form-control"/>
        </div>
        <div class="form-group">
            <input type="submit" value="Dang ky" class="btn btn-danger"/>
        </div>
    </form:form>
</div>