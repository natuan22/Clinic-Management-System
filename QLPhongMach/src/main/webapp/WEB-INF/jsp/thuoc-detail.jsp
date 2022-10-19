<%-- 
    Document   : toa-thuoc-detail
    Created on : Aug 17, 2022, 1:20:36 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-danger text-center">CHI TIẾT THUỐC ${thuoc.ten}</h1>

    <c:url value="/admin/thuocs/${thuoc.id}" var="action" />
    <form:form method="post" action="${action}" modelAttribute="thuocEdit">
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" path="ten" class="form-control" id="ten" placeholder="ten" name="ten"
                        value="${thuoc.ten}"/>
            <label for="ten">Tên</label>
            <form:errors path="ten" element="div" cssClass="text-danger mb-2 mt-2" />
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="number" min="0" path="soLuong" class="form-control" id="soLuong" placeholder="soLuong" name="soLuong"
                        value="${thuoc.soLuong}"/>
            <label for="soLuong">Số lượng</label>
            <form:errors path="soLuong" element="div" cssClass="text-danger mb-2 mt-2" />
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="number" min="0" path="donGia" class="form-control" id="donGia" placeholder="donGia" name="donGia"
                        value="${thuoc.donGia}"/>
            <label for="donGia">Đơn giá</label>
            <form:errors path="donGia" element="div" cssClass="text-danger mb-2 mt-2" />
        </div>
        <div class="row g-2">
            <div class="col-md">
                <div class="form-floating">
                    <form:select path="donViTinhId" class="form-select" id="dvt" name="dvt">
                        <c:forEach items="${donViTinhs}" var="c">
                            <option value="${c.id}">${c.ten}</option>
                        </c:forEach>
                    </form:select>
                    <label for="dvt" class="form-label">Đơn vị tính</label>
                    <form:errors path="donViTinhId" element="div" cssClass="text-danger mb-2 mt-2" />
                </div>
            </div>
            <div class="col-md">
                <div class="form-floating">
                    <form:select path="danhMucId" class="form-select" id="cate" name="cate">
                        <c:forEach items="${danhMucThuocs}" var="c">
                            <option value="${c.id}">${c.ten}</option>
                        </c:forEach>
                    </form:select>
                    <label for="cate" class="form-label">Danh mục thuốc</label>
                    <form:errors path="danhMucId" element="div" cssClass="text-danger mb-2 mt-2" />
                </div>
            </div>
        </div>   
        <div class="form-floating mb-3 mt-3">
            <form:textarea style="height: 100px" type="text" path="ghiChu" 
                           class="form-control" id="ghiChu" placeholder="ghiChu" 
                           name="ghiChu" value="${thuoc.ghiChu}"/>
            <label for="ghiChu">Ghi chú</label>
            <form:errors path="ghiChu" element="div" cssClass="text-danger mb-2 mt-2" />
        </div>
        <div>
            <input type="submit" value="Sửa thuốc" class="btn btn-danger" />
        </div>
    </form:form>
</div>
