<%-- 
    Document   : lich-su-kham-benh
    Created on : Aug 16, 2022, 4:34:56 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" style="margin-top: 20px;">
    <h1 class="text-danger text-center">LỊCH SỬ KHÁM BỆNH</h1>

    <c:if test="${phieuKhamBenh.size() == 0}">
        <p><em>BỆNH NHÂN KHÔNG CÓ LỊCH SỬ KHÁM BỆNH NÀO!!!</em></p>
    </c:if>

    <c:if test="${phieuKhamBenh.size() != 0}">
        <table class="table">
            <tr>
                <th>Ngày khám</th>
                <th>Triệu chứng</th>
                <th>Kêt luận</th>
                <th>Bác sĩ</th>
                <th>Toa thuốc</th>
            </tr>

            <c:forEach items="${phieuKhamBenh}" var="c">
                <tr>
                    <td><fmt:formatDate value="${c.ngayKham}" type="date"/></td>
                    <td>${c.trieuChung}</td>
                    <td>${c.ketLuan}</td>
                    <td>${c.bacSiId.firstName} ${c.bacSiId.lastName}</td>
                    <td>
                        <a href="<c:url value="/bacsi/lich-su-kham-benh/${userId}/${c.toaThuocId.id}"/>">Chi tiết thuốc</a>
                    <td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
        
    <input class="btn btn-danger mb-3" type="button" value="Quay lại" onclick="QuayLai()">
    
    <script>
        function QuayLai() {
            window.history.back();
        }
    </script>
</div>

