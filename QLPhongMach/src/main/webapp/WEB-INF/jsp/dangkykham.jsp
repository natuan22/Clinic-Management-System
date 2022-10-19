<%-- 
    Document   : dangkykham
    Created on : Aug 5, 2022, 2:27:04 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">ĐĂNG KÝ KHÁM BỆNH</h1>

    <c:url value="/dang-ky-kham" var="action"/>
    <form:form method="post" action="${action}" modelAttribute="lichKhamBenh">
        <form:errors path="*" element="div" cssClass="alert alert-danger"/>

        <div class="form-group mb-3 mt-3">
            <label for="ngayKham" style="padding-bottom: 5px;">Ngày khám</label>
            <form:input type="date" id="ngayKham" path="ngayKham" class="form-control" required="required"/>
        </div>
        <div class="form-group mb-3 mt-3">
            <label for="gioKham" style="padding-bottom: 5px;">Giờ khám</label>
            <form:input type="time" id="ngayKham" path="gioKham" class="form-control" required="required"/>
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:textarea style="height: 100px" class="form-control" path="trieuChung" id="trieuChung" placeholder="trieuChung"/>
            <label for="trieuChung">Triệu chứng</label>
        </div>
        <sec:authorize access="!isAuthenticated()">
            <div class="mb-3 mt-3">
                <em><a class="text-danger" href="<c:url value="/login"/>">Đăng nhập</a> để đăng ký khám bệnh!!!</em>
            </div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class="form-group mb-3 mt-3">
                <input type="submit" value="Đăng ký khám bệnh" class="btn btn-danger"/>
            </div>
        </sec:authorize>
    </form:form>
</div>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<script>
    <c:if test="${errMsg != null}">
        alertify.set('notifier', 'position', 'top-right');
        alertify.error('${errMsg}');
    </c:if>
</script>