<%-- 
    Document   : admin
    Created on : Aug 3, 2022, 4:48:59 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="container" style="margin-top: 20px;">
    <h1 class="text-danger text-center">TẦN SUẤT SỬ DỤNG THUỐC</h1>
    <div class="row">
        <div class="col-md-6 col-xs-12">
            <c:url value="/admin" var="action" />
            <form action="${action}">
                <div class="form-floating mb-3 mt-3">
                    <select class="form-control" name="quarter" id="quarter">
                        <c:forEach begin="1" end="4" var="i">
                            <option value="${i}">${i}</option>
                        </c:forEach>
                    </select>
                    <label for="quarter">Quý</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" placeholder="Nhap nam" name="year" id="year">
                    <label for="year">Năm</label>
                </div>
                <button type="submit" class="btn btn-primary form-group mb-3">Lọc dữ liệu</button>
            </form>
            <table class="table">
                <tr>
                    <th>Tên thuốc</th>
                    <th>Tần suất sử dụng</th>
                </tr>
                <c:forEach items="${thuocStats}" var="c">
                    <tr>
                        <td>${c[1]}</td>
                        <td>
                            <fmt:formatNumber type="number" value="${c[2]}" maxFractionDigits="3" />
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col-md-6 col-xs-12">
            <canvas id="myChart"></canvas>
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

        statistic(name, ctx, labels, data, 'pie');
    }
</script>

