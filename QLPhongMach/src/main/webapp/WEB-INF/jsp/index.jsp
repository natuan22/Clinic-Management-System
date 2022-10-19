<%-- 
    Document   : index
    Created on : Jul 19, 2022, 7:51:42 PM
    Author     : anhtuan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://res.cloudinary.com/dhldfozup/image/upload/v1661938673/QLPhongMach/Banner/Untitled-1_o2qbkl.png" 
                 class="d-block w-100" alt="img1">
        </div>
        <div class="carousel-item">
            <img src="https://res.cloudinary.com/dhldfozup/image/upload/v1661938851/QLPhongMach/Banner/Untitled-2_glkrrq.png" 
                 class="d-block w-100" alt="img2">
        </div>
        <div class="carousel-item">
            <img src="https://res.cloudinary.com/dhldfozup/image/upload/v1661939167/QLPhongMach/Banner/Untitled-3_lq4jzz.png" 
                 class="d-block w-100" alt="img3">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<script>
    <c:if test="${successMsg != null}">
        alertify.set('notifier', 'position', 'top-right');
        alertify.success('${successMsg}');
    </c:if>
</script>


