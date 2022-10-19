<%-- 
    Document   : dichvu
    Created on : Oct 8, 2022, 9:38:31 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">DỊCH VỤ</h1>
    <h4>${dichvu.ten}</h4>
    <h5>Giá <fmt:formatNumber type="number" value="${dichvu.gia}" maxFractionDigits="3" /> VNĐ</h5>
</div>
