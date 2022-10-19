<%-- 
    Document   : doiMatKhau
    Created on : Oct 8, 2022, 10:24:12 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">THAY ĐỔI MẬT KHẨU ĐĂNG NHẬP</h1>

    <c:url value="/tai-khoan/mat-khau" var="action"/>
    <form:form method="post" action="${action}" modelAttribute="user">
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" id="username" path="username" class="form-control" placeholder="username"
                        value="${currentUser.username}" readonly="true"/>
            <label for="username">Tên đăng nhập</label>
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="password" id="oldPassword" path="oldPassword" class="form-control" placeholder="oldPassword"/>
            <label for="password">Mật khẩu hiện tại</label>
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="password" id="password" path="password" class="form-control" placeholder="password"/>
            <label for="confirmPassword">Mật khẩu mới</label>
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="password" id="confirmPassword" path="confirmPassword" class="form-control" placeholder="confirmPassword"/>
            <label for="confirmPassword">Nhập lại mật khẩu mới</label>
        </div>
        <div class="form-group mb-3 mt-3">
            <input type="submit" value="Lưu" class="btn btn-danger"/>
        </div>
    </form:form>
</div>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<script>
    <c:if test="${errMsg != null}">
        alertify.set('notifier', 'position', 'top-right');
        alertify.error('${errMsg}');
    </c:if>
</script>



