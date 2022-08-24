<%-- 
    Document   : toa-thuoc-detail
    Created on : Aug 17, 2022, 1:20:36 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <h1>TOA THUOC</h1>
    <table class="table">
        <tr>
            <th>Ten</th>
            <th>Ghi chu</th>
            <th>So luong</th>
            
        </tr>
        
        <c:forEach items="${toathuoc}" var="c">
            <tr>
                <td>${c.thuocId.ten}</td>
                <td>${c.thuocId.ghiChu}</td>
                <td>${c.soLuong}</td>
            </tr>
        </c:forEach>
    </table>
</div>
