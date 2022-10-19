<%-- 
    Document   : base
    Created on : Jul 28, 2022, 4:10:03 PM
    Author     : anhtuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title" />
        </title>

        <!--<link rel="stylesheet" href="<c:url value="/css/style.css"/>">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
        <style>
            /*---------------------------------------
              CUSTOM PROPERTIES ( VARIABLES )             
            -----------------------------------------*/
            :root {
                --white-color:                  #FFFFFF;
                --primary-color:                #247cff;
                --section-bg-color:             #F9F9F9;
                --dark-color:                   #000000;
                --title-color:                  #565758;
                --p-color:                      #717275;
                --border-color:                 #eaeaea;

                --body-font-family:             'Open Sans', sans-serif;

                --h1-font-size:                 48px;
                --h2-font-size:                 36px;
                --h3-font-size:                 32px;
                --h4-font-size:                 28px;
                --h5-font-size:                 24px;
                --h6-font-size:                 22px;
                --p-font-size:                  18px;
                --menu-font-size:               16px;

                --font-weight-light:            300;
                --font-weight-normal:           400;
                --font-weight-semibold:         600;
                --font-weight-bold:             700;
            }

            body {
                margin: 0;
                background-color: #FFFFFF;
                color: #333;
                font-weight: 400;
                line-height: 1.2;
                text-align: left;
                /*background: var(--white-color);*/
                font-family: var(--body-font-family);
                position: relative;
            }

            /*---------------------------------------
              TYPOGRAPHY               
            -----------------------------------------*/

            h2,
            h3,
            h4,
            h5,
            h6 {
                color: var(--dark-color);
                line-height: inherit;
            }

            h1,
            h2,
            h3,
            h4,
            h5,
            h6 {
                font-weight: var(--font-weight-semibold);
            }

            h1,
            h2 {
                font-weight: var(--font-weight-bold);
            }

            h1 {
                font-size: var(--h1-font-size);
                line-height: normal;
            }

            h2 {
                font-size: var(--h2-font-size);
            }

            h3 {
                font-size: var(--h3-font-size);
            }

            h4 {
                font-size: var(--h4-font-size);
            }

            h5 {
                font-size: var(--h5-font-size);
            }

            h6 {
                font-size: var(--h6-font-size);
            }

            p {
                color: var(--p-color);
                font-size: var(--p-font-size);
                font-weight: var(--font-weight-light);
                letter-spacing: 0.5px;
            }

            a,
            button {
                touch-action: manipulation;
                transition: all 0.3s;
            }

            a {
                color: var(--p-color);
                text-decoration: none;
            }

            a:hover {
                color: var(--primary-color);
            }

            .section-padding {
                padding-top: 7rem;
                padding-bottom: 7rem;
            }

            /*---------------------------------------
              CUSTOM LINK               
            -----------------------------------------*/
            .custom-link {
                display: inline-block;
                text-decoration: none;
                border: 1px solid var(--border-color);
                color: var(--primary-color);
                pointer-events: auto;
                font-weight: var(--font-weight-semibold);
                line-height: 40px;
                position: relative;
                padding: 0 30px;
                box-sizing: border-box;
                margin: 0;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                overflow: hidden;
                border-radius: 0;
                text-transform: uppercase;
            }

            .custom-link::before {
                content: attr(data-hover);
                background-color: var(--border-color);
                color: var(--primary-color);
                position: absolute;
                top: 100%;
                bottom: 0;
                left: 0;
                transition: all 300ms cubic-bezier(0.19, 1, 0.56, 1);
                right: 0;
                text-align: center;
            }

            .custom-link:hover::before {
                top: 0;
            }

            b,
            strong {
                font-weight: var(--font-weight-bold);
            }

            /*---------------------------------------
              LIST GROUP               
            -----------------------------------------*/
            .list-group-item {
                background-color: transparent;
                color: var(--p-color);
                font-size: var(--p-font-size);
                padding: 1rem 0;
            }

            .list-group-item:first-child {
                padding-top: 0;
            }

            .list-group-item span {
                font-weight: var(--font-weight-semibold);
                margin-left: auto;
            }

            /*---------------------------------------
              ANIMATED TEXT              
            -----------------------------------------*/
            .animated {
                position: relative;
            }

            .animated-info {
                display: inline-block;
                vertical-align: top;
                min-width: 250px;
                position: relative;
            }

            .animated-item {
                color: var(--primary-color);
            }

            .animated-item {
                display: block;
                opacity: 0;
                overflow: hidden;
                position: absolute;
                top: 0;
                right: 0;
                left: 0;
                animation: BottomTotop 6s linear infinite 0s;
            }

            .animated-item:nth-child(2n+2) {
                animation-delay: 2s;
            }

            .animated-item:nth-child(3n+3) {
                animation-delay: 4s;
            }

            @keyframes BottomTotop {
                0% {
                    opacity: 0;
                }
                5% {
                    opacity: 0;
                    transform: translateY(5px);
                }
                10% {
                    opacity: 1;
                    transform: translateY(0px);
                }
                25% {
                    opacity: 1;
                    transform: translateY(0px);
                }
                30% {
                    opacity: 0;
                    transform: translateY(5px);
                }
                80% {
                    opacity: 0;
                }
                100% {
                    opacity: 0;
                }
            }

            /*---------------------------------------
              NAVIGATION              
            -----------------------------------------*/
            .navbar {
                padding-top: 20px;
                padding-bottom: 20px;
            }

            .navbar-brand {
                color: var(--primary-color);
                font-size: var(--h5-font-size);
                font-weight: var(--font-weight-bold);
                margin: 0 30px;
                padding: 0;
                text-align: center;
            }

            .navbar-brand strong {
                color: var(--p-color);
                font-size: 12px;
                position: relative;
                bottom: 5px;
            }

            .navbar-expand-lg .navbar-nav .nav-link {
                padding-right: 1.5rem;
                padding-left: 1.5rem;
            }

            .navbar-nav .nav-link {
                color: var(--p-color);
                font-weight: var(--font-weight-semibold);
                font-size: var(--menu-font-size);
                padding-top: 15px;
                padding-bottom: 15px;
            }

            .navbar-nav .nav-item.active .nav-link,
            .nav-link:focus,
            .nav-link:hover {
                color: var(--dark-color);
            }

            .nav-link:focus {
                color: var(--p-color);
            }

            .navbar-toggler {
                border: 0;
                padding: 0;
                cursor: pointer;
                margin: 0;
                width: 30px;
                height: 35px;
                outline: none;
            }

            .navbar-toggler:focus {
                outline: none;
                box-shadow: none;
            }

            .navbar-toggler[aria-expanded="true"] .navbar-toggler-icon {
                background: transparent;
            }

            .navbar-toggler[aria-expanded="true"] .navbar-toggler-icon:before,
            .navbar-toggler[aria-expanded="true"] .navbar-toggler-icon:after {
                transition: top 300ms 50ms ease, -webkit-transform 300ms 350ms ease;
                transition: top 300ms 50ms ease, transform 300ms 350ms ease;
                transition: top 300ms 50ms ease, transform 300ms 350ms ease, -webkit-transform 300ms 350ms ease;
                top: 0;
            }

            .navbar-toggler[aria-expanded="true"] .navbar-toggler-icon:before {
                transform: rotate(45deg);
            }

            .navbar-toggler[aria-expanded="true"] .navbar-toggler-icon:after {
                transform: rotate(-45deg);
            }

            .navbar-toggler .navbar-toggler-icon {
                background: var(--dark-color);
                transition: background 10ms 300ms ease;
                display: block;
                width: 30px;
                height: 2px;
                position: relative;
            }

            .navbar-toggler .navbar-toggler-icon:before,
            .navbar-toggler .navbar-toggler-icon:after {
                transition: top 300ms 350ms ease, -webkit-transform 300ms 50ms ease;
                transition: top 300ms 350ms ease, transform 300ms 50ms ease;
                transition: top 300ms 350ms ease, transform 300ms 50ms ease, -webkit-transform 300ms 50ms ease;
                position: absolute;
                right: 0;
                left: 0;
                background: var(--dark-color);
                width: 30px;
                height: 2px;
                content: '';
            }

            .navbar-toggler .navbar-toggler-icon:before {
                top: -8px;
            }

            .navbar-toggler .navbar-toggler-icon:after {
                top: 8px;
            }

            /*---------------------------------------
              FOOTER              
            -----------------------------------------*/
            .footer-mail{
                background: -webkit-gradient(linear,left top,left bottom,from(rgba(2,79,161,.9))),url(https://res.cloudinary.com/dhldfozup/image/upload/v1659090816/QLPhongMach/footer-1_utj6uf.jpg);
                background: -o-linear-gradient(rgba(2,79,161,.9)),url(https://res.cloudinary.com/dhldfozup/image/upload/v1659090816/QLPhongMach/footer-1_utj6uf.jpg);
                background: linear-gradient(rgba(2,79,161,.9)),url(https://res.cloudinary.com/dhldfozup/image/upload/v1659090816/QLPhongMach/footer-1_utj6uf.jpg);
                background-position: 50%;
                background-repeat: no-repeat;
                background-size: cover;
                padding-top: 2rem;
                padding-bottom: 2rem;
            }
            .title {
                margin-bottom: 0.5rem;
                font-size: 1.125rem;
                font-weight: 700;
                text-transform: uppercase;
            }
            .caption {
                margin-bottom: 0;
                color: #fff;
                font-size: .875rem;
            }
            .footer-btm {
                border-top: 1px solid rgba(0, 0, 0, 0.06);
            }
            .site-footer {
                background: var(--section-bg-color);
            }

            .copyright-text {
                font-size: var(--menu-font-size);
            }

            .subscribe {
                position: relative;
            }

            .subscribe .form-control {
                border-radius: 50px;
                height: 60px;
                padding-left: 25px;
                border-color: #eee;
            }

            .subscribe .btn {
                position: absolute;
                right: 6px;
                top: 6px;
            }
            .btnmail {
                display: inline-block;
                font-size: 14px;
                font-size: 0.8125rem;
                font-weight: 700;
                letter-spacing: .5px;
                padding: .75rem 2rem;
                font-family: "Exo", sans-serif;
                text-transform: uppercase;
                border-radius: 5px;
                border: 2px solid transparent;
                transition: all .35s ease;
            }
            .btn-main-2 {
                background: #6bc0e7;
                color: #fff;
                border-color: #6bc0e7;
            }

            .btn-main-2:hover {
                background: #223a66;
                color: #fff;
                border-color: #223a66;
            }

            .btn-round-full {
                border-radius: 50px;
            }
            /*---------------------------------------
              SOCIAL ICON               
            -----------------------------------------*/
            .social-icon {
                margin: 0;
                padding: 0;
            }

            .social-icon li {
                list-style: none;
                display: inline-block;
                vertical-align: top;
                transition: all 0.3s;
            }

            .social-icon:hover li:not(:hover) {
                opacity: 0.65;
            }

            .social-icon-link {
                font-size: var(--p-font-size);
                display: inline-block;
                vertical-align: top;
                margin-top: 4px;
                margin-bottom: 4px;
                margin-right: 15px;
            }

            .social-icon-link:hover {
                color: var(--primary-color);
            }

            /*---------------------------------------
              RESPONSIVE STYLES               
            -----------------------------------------*/
            @media screen and (min-width: 1600px) {
                .hero .container {
                    height: 740px;
                }
            }

            @media screen and (max-width: 991px) {
                h1 {
                    font-size: 38px;
                }

                h2 {
                    font-size: 32px;
                }

                h3 {
                    font-size: 26px;
                }

                h4 {
                    font-size: 24px;
                }

                h5 {
                    font-size: 20px;
                }

                h6 {
                    font-size: 18px;
                }

                .section-padding {
                    padding-top: 5rem;
                    padding-bottom: 5rem;
                }

                .navbar {
                    padding-top: 10px;
                    padding-bottom: 10px;
                }

                .navbar-nav .nav-link {
                    padding-top: 5px;
                    padding-bottom: 10px;
                }

                .hero .container {
                    height: inherit;
                }

                .heroText {
                    position: relative;
                    bottom: 100px;
                    left: 0;
                    width: auto;
                    margin-bottom: -100px;
                    padding: 2rem;
                }

                .featured-circle {
                    width: 320px;
                    height: 320px;
                }
            }

            @media screen and (max-width: 767px) {
                .heroText {
                    padding: 1.5rem;
                }

                .animated-info {
                    min-width: 125px;
                }

                .featured-circle {
                    margin-top: 20px;
                }

                .reviews-carousel .owl-nav {
                    position: relative;
                    width: auto !important;
                    transform: inherit;
                    top: 0;
                    bottom: 0;
                    left: 0;
                    max-width: 100px;
                    margin: 20px auto;
                }

                .reviews-carousel .owl-nav .owl-prev,
                .reviews-carousel .owl-nav .owl-next {
                    right: 0;
                    left: 0;
                }
            }

            @media screen and (max-width: 480px) {
                .heroText {
                    padding: 1rem;
                }

                .heroLinks .custom-link {
                    font-size: 12px;
                    line-height: 30px;
                    margin-right: 12px !important;
                    padding: 0 25px;
                }

                .contact-phone {
                    font-size: 12px;
                }
            }

            @media screen and (max-width: 360px) {
                .featured-number {
                    font-size: 5rem;
                }

                .featured-circle {
                    width: 235px;
                    height: 235px;
                }

                .reviews-image {
                    width: 55px !important;
                    height: 55px !important;
                }

                .reviews-thumb figcaption {
                    font-size: var(--menu-font-size);
                }

                .timeline::before {
                    left: 42px;
                }
            }
        </style>
    </head>
    <body> 
        <header>
            <tiles:insertAttribute name="header" />
        </header>
        
        <tiles:insertAttribute name="content" />
        
        <footer style="background-color: #edf9ff">
            <tiles:insertAttribute name="footer" />
        </footer>
    </body>
</html>