<%-- 
    Document   : yta
    Created on : Aug 8, 2022, 10:00:32 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">XÁC NHẬN LỊCH KHÁM BỆNH</h1>
    
    <div class="row">
        <div class="col-lg-6 col-md-12">
            <div class="spinner-border text-success" id="mySpinner"></div>
            <table class="table">
                <tr>
                    <th>Ngày khám</th>
                    <th>Giờ khám</th>
                    <th>Triệu chứng</th>
                </tr>
                <tbody id="myLichKhamBenhTrue">

                </tbody>
            </table>
        </div>
        
        <div class="col-lg-6 col-md-12">
            <div class="spinner-border text-success" id="mySpinner2"></div>
            <table class="table">
                <tr>
                    <th>Ngày khám</th>
                    <th>Giờ khám</th>
                    <th>Triệu chứng</th>
                    <th></th>
                </tr>
                <tbody id="myLichKhamBenh">

                </tbody>
            </table>
        </div>
    </div>


</div>

<script src="<c:url value="/js/lichkhambenh.js" />"></script>
<script>
    <c:url value="/api/lich-kham-benh-false" var="u" />
    <c:url value="/api/lich-kham-benh-true" var="t" />
    window.onload = function () {
        getLichKhamBenhsTrue('${t}');
        getLichKhamBenhs('${u}');
    }
</script>
</div>

