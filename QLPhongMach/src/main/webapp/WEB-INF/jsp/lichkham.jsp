<%-- 
    Document   : lichkham
    Created on : Aug 10, 2022, 5:28:33 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-danger text-center">LỊCH SỬ ĐĂNG KÝ KHÁM BỆNH</h1>
      
    <div class="spinner-border text-success" id="mySpinner"></div>
    <table class="table">
        <tr>
            <th>Ngày khám</th>
            <th>Giờ khám</th>
            <th>Triệu chứng</th>
            <th></th>
            
        </tr>
        <tbody id="myLichSuKhamBenh">

        </tbody>
    </table>
    
    <script src="<c:url value="/js/lichsukhambenh.js" />"></script>
    <script>
        <c:url value="/api/lich-su-kham/${userId}" var="u" />
        window.onload = function () {
            getLichSuKhamBenh('${u}');
        }
    </script>
</div>
