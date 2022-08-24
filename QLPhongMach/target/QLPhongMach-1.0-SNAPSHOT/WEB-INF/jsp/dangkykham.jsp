<%-- 
    Document   : dangkykham
    Created on : Aug 5, 2022, 2:27:04 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">ĐĂNG KÝ KHÁM BỆNH</h1>
    
    <c:url value="/dang-ky-kham" var="action"/>
    <form:form method="post" action="${action}" modelAttribute="lichKhamBenh">
        <form:errors path="*" element="div" cssClass="alert alert-danger" />

        <div class="form-group">
            <label for="ngayKham">Ngay kham</label>
            <form:input type="date" id="ngayKham" path="ngayKham" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="gioKham">Gio kham</label>
            <form:input type="time" id="ngayKham" path="gioKham" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="trieuChung">Trieu chung</label>
            <form:input type="text" id="trieuChung" path="trieuChung" class="form-control"/>
        </div>
        <div class="form-group">
            <input type="submit" value="Dang ky kham benh" class="btn btn-danger"/>
        </div>
    </form:form>
</div>
