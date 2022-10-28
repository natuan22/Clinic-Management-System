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
    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user" style="width: 60%; margin: auto;">
        <div class="row g-2">
            <div class="col-md">
                <div class="form-floating mt-3">
                    <form:input type="text" id="firstName" path="firstName" class="form-control" placeholder="firstName"/>
                    <label for="firstName">Họ</label>
                    <form:errors path="firstName" element="div" cssClass="text-danger mb-2 mt-2" />
                </div>
            </div>
            <div class="col-md">
                <div class="form-floating mt-3">
                    <form:input type="text" id="lastName" path="lastName" class="form-control" placeholder="lastName"/>
                    <label for="lastName">Tên</label>
                    <form:errors path="lastName" element="div" cssClass="text-danger mb-2 mt-2" />
                </div>
            </div>
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" id="username" path="username" class="form-control" placeholder="username"/>
            <label for="username">Tên đăng nhập</label>
            <form:errors path="username" element="div" cssClass="text-danger mb-2 mt-2" />
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="password" id="password" path="password" class="form-control" placeholder="password"/>
            <label for="password">Mật khẩu</label>
            <form:errors path="password" element="div" cssClass="text-danger mb-2 mt-2" />
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="password" id="confirmPassword" path="confirmPassword" class="form-control" placeholder="confirmPassword"/>
            <label for="confirmPassword">Xác nhận mật khẩu</label>
        </div>
        <div class="row g-2">
            <div class="col-md">
                <div class="form-floating mb-3">
                    <form:input type="text" id="email" path="email" class="form-control" placeholder="email"/>
                    <label for="email">Email</label>
                    <form:errors path="email" element="div" cssClass="text-danger mb-2 mt-2" />
                </div>
            </div>
            <div class="col-md">
                <div class="form-floating mb-3">
                    <form:input type="tel" id="phone" path="phone" class="form-control" placeholder="phone"/>
                    <label for="phone">Số điện thoại</label>
                    <form:errors path="phone" element="div" cssClass="text-danger mb-2 mt-2" />
                </div>
            </div>
            <div class="col-md">
                <div class="form-floating mb-3">
                    <form:select path="gioiTinh" class="form-select" id="gioiTinh">
                        <option value="nam">Nam</option>
                        <option value="nu">Nữ</option>
                    </form:select>
                    <label for="gioiTinh" class="form-label">Giới tính</label>
                </div>
            </div>
        </div>
        <div class="form-group mb-3">
            <label for="avatar" style="padding-bottom: 5px;">Ảnh đại diện</label>
            <form:input type="file" id="avatar" path="file" class="form-control"/>
        </div>
        <div class="form-group mb-3 mt-3">
            <input type="submit" value="Đăng ký" class="btn btn-danger"/>
        </div>
    </form:form>
</div>