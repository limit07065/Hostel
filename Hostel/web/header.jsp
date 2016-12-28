<%-- 
    Document   : index
    Created on : Dec 19, 2016, 10:50:45 PM
    Author     : Ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">


    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Hostel Management System</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/logo-nav.css" rel="stylesheet">
        <script src="js/font-awesome.min.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Home">
                        <img src="http://placehold.it/150x50&text=Logo" alt="">
                    </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav ">
                        <c:if test="${not empty user}">
                            <li>
                                <a href="Profile">Welcome, <c:out value="${user.getName()}" /></a>
                            </li>
                            <li>
                                <a href="Home">Home</a>
                            </li>
                        </c:if>
                        <li>
                            <a href="Home?type=history">Application History</a>
                        </li>

                        <c:choose>
                            <c:when test="${empty user}">
                                <li>
                                    <a href="Home">Login</a>
                                </li>

                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="Logout">Logout</a>

                                </li>
                                <li>
                                    <a><img alt="x" class="profile-icon "></a>
                                </li>

                            </c:otherwise>

                        </c:choose>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->

            </div>
            <!-- /.container -->
        </nav>



