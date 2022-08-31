<%-- 
    Document   : khambenh
    Created on : Aug 10, 2022, 1:34:14 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 20px;">
    <h1 class="text-center text-danger">KHÁM BỆNH</h1>
    
    <div class="row">
        <div class="col-md-8">
            <h6>Bệnh nhân: ${lichKhamBenh.userId.firstName} ${lichKhamBenh.userId.lastName}</h6>
            <a href="<c:url value="/bacsi/lich-su-kham-benh/${lichKhamBenh.userId.id}"/>">Lịch sử khám bệnh</a>
        </div>
        <div class="col-md-4">
            <h6>Giới tính: ${lichKhamBenh.userId.gioiTinh}</h6>
        </div>
    </div>

    <c:url value="/bacsi/kham-benh/${lichKhamBenh.id}" var="action" />
    <form:form method="post" action="${action}" modelAttribute="phieuKhamBenh">
        <form:errors path="*" element="div" cssClass="alert alert-danger" />

        <div class="form-floating mb-3 mt-3">
            <form:input type="text" path="trieuChung" class="form-control" id="trieuChung" placeholder="trieuChung" name="trieuChung"
                        value="${lichKhamBenh.trieuChung}"/>
            <label for="trieuChung">Triệu chứng</label>
        </div>
        <div class="form-floating mb-3 mt-3">
            <form:textarea style="height: 100px" type="text" path="ketLuan" class="form-control" id="ketLuan" placeholder="ketLuan" name="ketLuan"/>
            <label for="ketLuan">Kết luận</label>
        </div>
        <div class="form-floating">
            <form:select path="dichVuBenhVienId" class="form-select" id="dichVuBenhVien" name="dichVuBenhVien">
                <c:forEach items="${dichVuBenhViens}" var="c">
                    <option value="${c.id}">${c.ten}</option>
                </c:forEach>
            </form:select>
            <label for="dichVuBenhVien" class="form-label">Dịch vụ bệnh viện</label>
        </div>

            <br><hr><br>
        
        <h6>Tổng số thuốc trong toa: <span id="cartCounter">${cartCounter}</span></h6>
        <h6>Tổng tiền thuốc: <span id="amountCart"><fmt:formatNumber type="number" value="${cartStats.amount}" maxFractionDigits="3" /></span> VND</h6>
        <c:if test="${carts == null}">
            <h6 class="text-danger">Không có thuốc trong toa    </h6>
        </c:if>
        <c:if test="${carts != null}">
            <table class="table">
                <tr>
                    <th>Tên thuốc</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th></th>
                </tr>
                <c:url value="/api/cart" var="u" />
                <c:forEach items="${carts}" var="c">
                    <tr id="thuocId${c.thuocId}">
                        <td>${c.thuocTen}</td>
                        <td>${c.gia}</td>
                        <td>
                            <div class="form-group">
                                <input min="0" type="number" value="${c.soLuong}" class="form-control" 
                                       onblur="updateCart('${u}', this, ${c.thuocId})"/>
                            </div>
                        </td>
                        <td>
                            <input type="button" value="Xoa" class="btn btn-danger" 
                                   onclick="deleteCartItem(${c.thuocId})"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <a class="btn btn-info mb-3" href="<c:url value="/bacsi/kham-benh/${lichKhamBenh.id}/toa-thuoc"/>">Thêm thuốc vào toa</a>
        
        <c:if test="${carts != null}">
            <div class="mb-3">
                <input type="submit" value="Xác nhận" class="btn btn-danger" />
            </div>
        </c:if>
    </form:form>
    <script src="<c:url value="/js/cart.js" />"></script>
</div>
