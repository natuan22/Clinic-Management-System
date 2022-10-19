<%-- 
    Document   : toa-thuoc-detail
    Created on : Aug 17, 2022, 1:20:36 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-danger text-center">TOA THUỐC</h1>
    <table class="table">
        <tr>
            <th>Tên</th>
            <th>Ghi chú</th>
            <th>Số lượng</th>
        </tr>
        <c:forEach items="${toathuoc}" var="c">
            <tr>
                <td>${c.thuocId.ten}</td>
                <td>${c.thuocId.ghiChu}</td>
                <td>${c.soLuong}</td>
            </tr>
        </c:forEach>
    </table>
    
    <input class="btn btn-danger mb-3" type="button" value="Quay lại" onclick="QuayLai()">
    
    <script>
        function QuayLai() {
            window.history.back();
        }
    </script>
</div>
