<%-- 
    Document   : profile
    Created on : Dec 22, 2016, 5:05:36 PM
    Author     : Ray
--%>

<%@include file="header.jsp"%>
<div class="container">
    <div class="col-md-4 col-md-offset-4">

        <img class="upload-icon" src="img/upload.png">
        <img class="img img-circle center-block img-thumbnail profile-pic" src="img/<c:out value='${user.getPic()}' />" alt="x"/>
        
    </div>
    <div class="col-md-6 col-md-offset-3">
        <div class="row">

            <div class="col-md-3 ">
                <label> Name</label>    <br>
                <label> Matric Number</label>

            </div>
            <div class="col-md-1">
                <label>:</label> <br>   
                <label>:</label>
            </div>
            <div class="col-md-8">
                <label> <c:out value="${user.getName()}" /></label>    <br>
                <label> <c:out value="${user.getEmail()}" /></label>
            </div>
        </div>
       
            <button class="btn btn-default center-block">Change Password</button>
        
    </div>
</div>

<%@include file="footer.jsp"%>