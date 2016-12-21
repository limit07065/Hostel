<%-- 
    Document   : login
    Created on : Dec 21, 2016, 5:01:32 PM
    Author     : Ray
--%>

<%@include file="header.jsp" %>
<div class="container-fluid greenbg">
    <form class="loginform form-group col-md-4 col-md-offset-4">
        <img id="loginlogo" class="img-responsive center-block" alt="ktdi logo">
        <div class="input-group">
            <span class="input-group-addon" style="padding-right:15px">
                <i class="fa fa-user"></i>
            </span>
            <input type="text" class="form-control"
                   placeholder="Username" id="inputGroup"/>
        </div>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="fa fa-key"></i>
            </span>
            <input type="text" class="form-control"
                   placeholder="Password" id="inputGroup"/>
        </div>
    </form>


</div>

<%@include file="footer.jsp" %>