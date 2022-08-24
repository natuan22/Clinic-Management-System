<%-- 
    Document   : bacsi
    Created on : Aug 1, 2022, 9:20:08 AM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h2 class="text-center text-danger">Lich kham benh</h2>
    
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Ngay kham</th>
            <th>Gio kham</th>
            <th>Trieu chung</th>
            <th></th>
        </tr>
        <c:forEach items="${lichKhamBenhs}" var="c">
        <tr>
            <td>${c.id}</td>
            <td><fmt:formatDate value="${c.ngayKham}" type="date"/></td>
            <td><fmt:formatDate value="${c.gioKham}" type="time"  timeStyle="short"/></td>
            <td>${c.trieuChung}</td>
            <td><a class="btn btn-success" href="<c:url value="/bacsi/kham-benh/${c.id}"/>">Chon</a></td>
        </tr>
        </c:forEach>
    </table>
</div>