<%-- 
    Document   : toathuoc
    Created on : Aug 11, 2022, 2:37:54 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <h1 class="text-center text-danger">Toa Thuoc</h1>
    <div class="alert alert-info">
        <h5>Tổng so luong thuoc: <span id="cartCounter">${cartCounter}</span></h5>
    </div>
    <c:url value="/bacsi/kham-benh/${lichKhamBenhId}/toa-thuoc" var="action" />
    <form method="get" action="${action}" class="d-flex">
        <input class="form-control me-2" type="search" name="kw" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
    <table class="table">
        <tr>
            <th>Tên</th>
            <th>Đơn giá</th>
            <th>Số lượng</th>
            <th>Ghi chú</th>
            <th>Danh muc thuoc</th>
            <th>Don vi tinh</th>
            <th></th>
        </tr>
        <c:url value="/api/cart" var="u" />
        <c:forEach var="t" items="${thuocs}">
            <tr>
                <td>${t.ten}</td>
                <td>${t.donGia}</td>
                <td>${t.soLuong}</td>
                <td>${t.ghiChu}</td>
                <td>${t.danhMucId.ten}</td>
                <td>${t.donViTinhId.ten}</td>
                <td>
                    <a class="btn btn-primary" onclick="addToCart('${u}', ${t.id}, '${t.ten}', ${t.donGia})">Them</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <script src="<c:url value="/js/cart.js" />"></script>
</div>
