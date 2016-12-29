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
        <link href="css/hostel.css" rel="stylesheet">

        <!-- Font Awesome  -->
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
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div id="navbar" class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Login">
                        <img class="nav-logo img-responsive" src="img/logo.png" alt="">
                    </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav ">

                        <c:if test="${not empty user}">
                            <li>
                                <a href="Profile">Welcome, <c:out value="${user.getName()}" /></a>
                            </li>                            
                        </c:if>
                        

                        <c:choose>
                            <c:when test="${user.getLevel()==1}">
                                <li>
                                    <a href="#">Applications</a>
                                </li>
                            </c:when>
                            <c:when test="${user.getLevel()==0}">
                                <li>
                                    <a href="#">Dashboard</a>
                                </li>
                            </c:when>
                        </c:choose>


                        <c:choose>
                            <c:when test="${not empty user}">                            
                                <li>
                                    <a href="Logout">Logout</a>

                                </li>
                                <li class="dropdown user user-menu open">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <img src="${user.getPic()}" class="user-image" alt="User Image">
                                        <span class="hidden-xs">${user.getName()}</span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <!-- User image -->
                                        <li class="user-header">
                                            <img src="${user.getPic()}" class="img-circle" alt="User Image">

                                            <p>
                                                ${user.getName()} 
                                                <small>${user.getId()}</small>
                                            </p>
                                        </li>                                        
                                        <!-- Menu Footer-->
                                        <li class="user-footer">
                                            <div class="pull-left">
                                                <a href="Profile" class="btn btn-default btn-flat">Profile</a>
                                            </div>
                                            <div class="pull-right">
                                                <a href="Logout" class="btn btn-default btn-flat">Log out</a>
                                            </div>
                                        </li>
                                    </ul>
                                </li>

                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="">Login</a>
                                </li>
                            </c:otherwise>

                        </c:choose>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->

            </div>
            <!-- /.container -->
        </nav>



