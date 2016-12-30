<%-- 
    Document   : profile
    Created on : Dec 22, 2016, 5:05:36 PM
    Author     : Ray
--%>

<%@include file="header.jsp"%>
<div class="container-fluid greenbg text-center">
    <div class="col-md-12 ">

        <img class="upload-icon" src="img/upload.png">
        <img class="profile-pic" src="img/<c:out value='${user.getPic()}' />" alt="x"/>

    </div>
    <div class="col-md-12">
        <label> ${user.getName()}</label>    <br>
        <label>${user.getId()}</label>
    </div>
</div>     

<div class="col-md-12">   
    <button class="btn btn-default center-block">Edit Profile</button>
    <button class="btn btn-default center-block">Change Password</button>
    
</div>


<%@include file="footer.jsp"%>