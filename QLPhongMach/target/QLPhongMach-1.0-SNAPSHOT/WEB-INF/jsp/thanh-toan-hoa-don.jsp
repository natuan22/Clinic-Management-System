<%-- 
    Document   : thanh-toan-hoa-don
    Created on : Aug 21, 2022, 2:34:55 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">QUẢN LÝ HOÁ ĐƠN</h1>
    
    <table class="table">
        <tr>
            <th>Ngày tạo</th>
            <th>Thành tiền</th>
            <th>Bệnh nhân</th>
            <th>Tình trạng</th>
            <th></th>
        </tr>
        <c:forEach var="t" items="${hoadons}">
            <tr>
                <td><fmt:formatDate value="${t.ngayTao}" /></td>
                <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${t.thanhTien}" /> VND</td>
                <td>${t.phieuKhamBenhId.benhNhanId.firstName} ${t.phieuKhamBenhId.benhNhanId.lastName}</td>
                <c:url value="/api/hoa-don/${t.id}" var="u" />
                <c:if test="${t.tinhTrang == false}">
                    <td class="text-danger">Chưa thanh toán</td>

                    <td><button class='btn btn-success' onclick="confirmHoaDon('${u}')">Xác nhận</button></td>
                </c:if>

                <c:if test="${t.tinhTrang == true}">
                    <td>Đã thanh toán</td>
                    <td></td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
    <script>
        function confirmHoaDon(endpoint) {
            fetch(endpoint, {
                method: 'post'
            }).then(function (res) {
                if (res.status !== 204)
                    alert("Something wrong!!!");
                location.reload();
            }).catch(function (err) {
                console.error(err);
            });
        }
    </script>
</div>
