<%-- 
    Document   : stats
    Created on : Aug 8, 2022, 1:21:27 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-info">THỐNG KÊ BÁO CÁO</h1>

    <div class="row">
        <div class="col-md-6 col-xs-12">
            <c:url value="/admin/stats" var="action" />
            <form action="${action}">
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" placeholder="Nhap nam" name="year" id="year">
                    <label for="year3">Năm</label>
                </div>
                <button type="submit" class="btn btn-primary">Lọc dữ liệu</button>
            </form>
            <table class="table">
                <tr>
                    <th>Tháng</th>
                    <th>Số lượng bệnh nhân đến khám</th>
                </tr>
                <c:forEach items="${countBenhNhan}" var="c">
                    <tr>
                        <td>${c[0]}</td>
                        <td>
                            <fmt:formatNumber type="number" value="${c[1]}" maxFractionDigits="3" />
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col-md-6 col-xs-12">
            <canvas id="myChart"></canvas>
        </div>
    </div>

    <br><br><hr><br><br>

    <div class="row">
        <div class="col-md-6 col-xs-12">
            <c:url value="/admin/stats" var="action" />
            <form action="${action}">
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" placeholder="Nhap nam" name="year2" id="year2">
                    <label for="year2">Năm</label>
                </div>
                <button type="submit" class="btn btn-primary">Lọc dữ liệu</button>
            </form>
            <table class="table">
                <tr>
                    <th>Tháng</th>
                    <th>Doanh thu</th>
                </tr>
                <c:forEach items="${revenueStats}" var="c">
                    <tr>
                        <td>${c[0]}</td>
                        <td>
                            <fmt:formatNumber type="number" value="${c[1]}" maxFractionDigits="3" /> VND
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col-md-6 col-xs-12">
            <canvas id="myChart2"></canvas>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    window.onload = function () {
        let data = [];
        let labels = [];
        let name = 'Số lượng bệnh nhân đến khám';
        const ctx = document.getElementById('myChart').getContext('2d');

    <c:forEach items="${countBenhNhan}" var="c">
        data.push(${c[1]});
        labels.push('${c[0]}');
    </c:forEach>

        statistic(name, ctx, labels, data, 'bar');

        let data2 = [];
        let labels2 = [];
        let name2 = 'Doanh thu';
        const ctx2 = document.getElementById('myChart2').getContext('2d');

    <c:forEach items="${revenueStats}" var="c">
        data2.push(${c[1]});
        labels2.push('${c[0]}');
    </c:forEach>

        statistic(name2, ctx2, labels2, data2, 'line');
    };
</script>