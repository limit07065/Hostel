<%-- 
    Document   : login
    Created on : Dec 21, 2016, 5:01:32 PM
    Author     : Ray
--%>

<%@include file="header.jsp" %>
<div class="container-fluid greenbg">
    <form class="loginform form-group col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4" method="post" action="">
        <img id="loginlogo" class="img-circle img-thumbnail center-block" alt="ktdi logo" src="img/loginlogo.jpg">
        <c:if test="${not empty loginError}">  
                <span class="col-xs-12 alert alert-danger text-center" ><i class="fa fa-exclamation-triangle"></i> <c:out value="${loginError}" /></span>
                </c:if>
        <div class="input-group">
            <span class="input-group-addon" style="padding-right:15px">
                <i class="fa fa-user"></i>
            </span>
            <input type="text" class="form-control"
                   placeholder="Username" id="username" name="username" />
        </div>
        <div class="input-group">
            <span class="input-group-addon">
                <i class="fa fa-key"></i>
            </span>
            <input type="password" class="form-control"
                   placeholder="Password" id="password" name="password" />
        </div>

        
       
        <div class="form-group">
            <div class="text-center">
                <button type="reset" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </form>


</div>

<%@include file="footer.jsp" %>