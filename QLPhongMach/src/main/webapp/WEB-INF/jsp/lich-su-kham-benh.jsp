<%-- 
    Document   : lich-su-kham-benh
    Created on : Aug 16, 2022, 4:34:56 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" style="margin-top: 20px;">
    <h1 class="text-danger text-center">LICH SU KHAM BENH</h1>

    <table class="table">
        <tr>
            <th>Ngay kham</th>
            <th>Trieu chung</th>
            <th>Ket luan</th>
            <th>Bac si</th>
            <th>Toa thuoc</th>
        </tr>

        <c:forEach items="${phieuKhamBenh}" var="c">
            <tr>
                <td>${c.ngayKham}</td>
                <td>${c.trieuChung}</td>
                <td>${c.ketLuan}</td>
                <td>${c.bacSiId.firstName} ${c.bacSiId.lastName}</td>
                <td>
                    <a href="<c:url value="/bacsi/lich-su-kham-benh/${userId}/${c.toaThuocId.id}"/>">Chi tiet thuoc</a>
                <td>
            </tr>
        </c:forEach>
    </table>
    
</div>

