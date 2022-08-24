<%-- 
    Document   : thuocs
    Created on : Aug 4, 2022, 4:16:34 PM
    Author     : anhtuan
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">QUẢN LÝ THUỐC</h1>


    <c:url value="/admin/thuocs" var="action" />
    <form:form method="post" action="${action}" modelAttribute="thuoc">
        <form:errors path="*" element="div" cssClass="alert alert-danger" />

        <div class="form-floating mb-3 mt-3">
            <form:input type="text" path="ten" class="form-control" id="ten" placeholder="ten" name="ten" />
            <label for="ten">Ten thuoc</label>
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="number" min="0" path="soLuong" class="form-control" id="soLuong" placeholder="soLuong" name="soLuong" />
            <label for="soLuong">So luong</label>
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="number" min="0" path="donGia" class="form-control" id="donGia" placeholder="donGia" name="donGia" />
            <label for="donGia">Don gia</label>
        </div>
        <div class="form-floating">
            <form:select path="donViTinhId" class="form-select" id="dvt" name="dvt">
                <c:forEach items="${donViTinhs}" var="c">
                    <option value="${c.id}">${c.ten}</option>
                </c:forEach>
            </form:select>
            <label for="dvt" class="form-label">Don vi tinh</label>
        </div>
        <br>
        <div class="form-floating">
            <form:select path="danhMucId" class="form-select" id="cate" name="cate">
                <c:forEach items="${danhMucThuocs}" var="c">
                    <option value="${c.id}">${c.ten}</option>
                </c:forEach>
            </form:select>
            <label for="cate" class="form-label">Danh muc thuoc</label>
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" path="ghiChu" class="form-control" id="ghiChu" placeholder="ghiChu" name="ghiChu" />
            <label for="ghiChu">Ghi chu</label>
        </div>
        <div>
            <input type="submit" value="Them thuoc" class="btn btn-danger" />
        </div>
    </form:form>
    <hr>
    <div class="spinner-border text-success" id="mySpinner"></div>
    <table class="table">
        <tr>
            <th>Tên</th>
            <th>Đơn giá</th>
            <th>Số lượng</th>
            <th>Ghi chú</th>
            <th></th>
        </tr>
        <tbody id="myThuoc">

        </tbody>
    </table>

    <script src="<c:url value="/js/thuocs.js" />"></script>
    <script>
        <c:url value="/api/thuocs/" var="u" />
        window.onload = function () {
            getThuocs('${u}');
        }
    </script>
</div>