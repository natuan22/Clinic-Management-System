<%-- 
    Document   : login
    Created on : Aug 2, 2022, 1:30:42 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">ĐĂNG NHẬP</h1>
    
    <c:if test="${param.error != null}">
        <div class="alert alert-danger">
            ĐÃ CÓ LỖI XẢY RA! Vui lòng quay lại sau!
        </div>
    </c:if>
    <c:if test="${param.accessDenied != null}">
        <div class="alert alert-danger">
            Bạn không có quyền truy cập!
        </div>
    </c:if>
    
    <c:url value="/login" var="action"/>
    <form method="post" action="${action}">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" class="form-control"/>
        </div>
        <div class="form-group">
            <input type="submit" value="Dang nhap" class="btn btn-danger"/>
        </div>
    </form>
</div>
