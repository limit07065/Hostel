<%-- 
    Document   : login
    Created on : Dec 21, 2016, 5:01:32 PM
    Author     : Ray
--%>

<%@include file="header.jsp" %>
<c:if test="${not empty user}">
    <script type="text/javascript">
        $(function(){
        <c:choose>
            <c:when test="${user.getLevel() == '0'}">
            window.location = "admin.jsp";
            </c:when>
            <c:when test="${user.getLevel() == '1'}">
            window.location = "apply.jsp";
            </c:when>
        </c:choose>
        });
    </script>
</c:if>
<div class="container-fluid greenbg">
    <form class="loginform form-group col-md-4 col-md-offset-4" method="post" action="LoginServlet">
        <img id="loginlogo" class="img-responsive center-block" alt="ktdi logo">
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
        <c:if test="${not empty loginError}">
        <div class="form-group">
            <div class="col-lg-10">
                <span class="help-block" style="color: red"><c:out value="${loginError}" /></span>
            </div>
        </div>
        </c:if>
        <br />
        <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
                <button type="reset" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </form>


</div>

<%@include file="footer.jsp" %>