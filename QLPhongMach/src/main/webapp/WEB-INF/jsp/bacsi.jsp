<%-- 
    Document   : bacsi
    Created on : Aug 1, 2022, 9:20:08 AM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">LỊCH KHÁM BỆNH</h1>
    
    <table class="table">
        <tr>
            <th>Ngày khám</th>
            <th>Giờ khám</th>
            <th>Triệu chứng</th>
            <th>Bệnh nhân</th>
            <th></th>
        </tr>
        <c:forEach items="${lichKhamBenhs}" var="c">
        <tr>
            <td><fmt:formatDate value="${c.ngayKham}" type="date"/></td>
            <td><fmt:formatDate value="${c.gioKham}" type="time"  timeStyle="short"/></td>
            <td>${c.trieuChung}</td>
            <td>${c.userId.firstName} ${c.userId.lastName}</td>
            <td><a class="btn btn-success" href="<c:url value="/bacsi/kham-benh/${c.id}"/>">Khám bệnh</a></td>
        </tr>
        </c:forEach>
    </table>
</div>