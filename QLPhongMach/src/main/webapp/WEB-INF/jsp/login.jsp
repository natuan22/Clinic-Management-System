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
        <div class="form-floating mb-3 mt-3">
            <input class="form-control" type="text" id="username" name="username" placeholder="username" required/>
            <label for="username">Tên đăng nhập</label>
        </div>
        <div class="form-floating mb-3 mt-3">
            <input class="form-control" type="password" id="password" name="password"  placeholder="password" required/>
            <label for="password">Mật khẩu</label>
        </div>
        <div class="form-group mb-3 mt-3">
            <input type="submit" value="Đăng nhập" class="btn btn-danger"/>
        </div>
    </form>
</div>
