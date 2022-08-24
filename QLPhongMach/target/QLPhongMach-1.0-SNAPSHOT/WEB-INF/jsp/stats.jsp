<%-- 
    Document   : stats
    Created on : Aug 8, 2022, 1:21:27 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <h1 class="text-center text-info">THONG KE BAO CAO</h1>

    <div class="row">
        <div class="col-md-6 col-xs-12">
            <table class="table">
                <tr>
                    <th>Id</th>
                    <th>Ten thuoc</th>
                    <th>So lan su dung</th>
                </tr>
                <c:forEach items="${thuocStats}" var="c">
                    <tr>
                        <td>${c[0]}</td>
                        <td>${c[1]}</td>
                        <td>
                            <fmt:formatNumber type="number" value="${c[2]}" maxFractionDigits="3" />
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col-md-6 col-xs-12">
            <c:url value="/admin/stats" var="action" />
            <form action="${action}">
                <div class="mb-3 mt-3">
                    <select class="form-control" name="quarter">
                        <c:forEach begin="1" end="4" var="i">
                            <option value="${i}">${i}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">

                    <input type="number" class="form-control" placeholder="Nhap nam" name="year">
                </div>
                <button type="submit" class="btn btn-primary">Loc du lieu</button>
            </form>
            <canvas id="myChart"></canvas>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 col-xs-12">
            <table class="table">
                <tr>
                    <th>Thang</th>
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
            <c:url value="/admin/stats" var="action" />
            <form action="${action}">
                <div class="mb-3">
                    <input type="number" class="form-control" placeholder="Nhap nam" name="year2">
                </div>
                <button type="submit" class="btn btn-primary">Loc du lieu</button>
            </form>
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
        let name = 'Tần suất sử dụng của thuốc';
        const ctx = document.getElementById('myChart').getContext('2d');

    <c:forEach items="${thuocStats}" var="c">
        data.push(${c[2]});
        labels.push('${c[1]}');
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
        
        statistic(name2, ctx2, labels2, data2, 'bar');
    };
</script>