<%-- 
    Document   : register
    Created on : Dec 31, 2016, 2:16:16 PM
    Author     : Ray
--%>

<%@include file="header.jsp" %>
<div class="container-fluid greenbg">

    <form class="formbg form-group1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4" method="post" action="Register">        
        <h3 class="text-center">Register</h3>
        <input type="text" class="form-control" name="username" id="username" placeholder="Username" required>                    
        <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>                    
        <input type="password" class="form-control" name="cpassword" id="cpassword" placeholder="Confirm Password" required> 
        <div class="text-center">
            <input type="radio" id="M" name="gender" value="1" class="toggle" checked  >
            <label class="gender-radio" for="M">Male </label>
            <input type="radio" id="F" name="gender" value="0" class="toggle" >
            <label class="gender-radio" for="F">Female</label>
        </div>
        <input type="text" class="form-control" name="id" id="id" placeholder="Matrix Number" required>                    
        <input type="text" class="form-control" name="fullname" id="fullname" placeholder="Full Name" required>                    
        <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>                    
        <input type="text" class="form-control" name="contact" id="contact" placeholder="Contact" required>   
        <c:if test="${not empty passError}">  
        <span class="col-xs-12 alert alert-danger text-center" ><i class="fa fa-exclamation-triangle"></i> <c:out value="${passError}" /></span>
        </c:if>
        <input type="submit" class="btn btn-success pull-right" value="Submit"/>
    </form>


</div>

<%@include file="footer.jsp" %>
