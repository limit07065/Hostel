<%-- 
    Document   : profile
    Created on : Dec 22, 2016, 5:05:36 PM
    Author     : Ray
--%>

<%@include file="header.jsp"%>
<div class="container-fluid greenbg text-center">
    <div class="col-md-12 ">

        <div id="modalPhoto" data-photo="${user.getPic()}" data-toggle="modal" data-target="#uploadPhoto" ><img class="upload-icon" src="img/upload.png"></div>
        <img class="profile-pic" src="img/<c:out value='${user.getPic()}' />" alt="x"/>

    </div>
    <div class="col-md-12">
        <label> ${user.getName()}</label>    <br>
        <label>${user.getId()}</label>
    </div>
</div>     

<div class="col-md-12 btn-menu">   
    <button class="btn btn-default btn-profile ">Edit Profile</button>
    <button class="btn btn-default btn-profile">Change Password</button>

</div>

<!--Modal for upload-->

<div id="uploadPhoto" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                <h4 class="modal-title" id="myModalLabel">Upload Profile Picture</h4>
            </div>
            <div class="modal-body">
                <div id="imgUpload" class="img-circle img-thumbnail img-circle img-modal">                
                </div>
     <!--        <img  class="img-thumbnail img-circle img-modal" src="img/${user.getPic()}">-->
                <form id="frmuploadphoto" action="UploadUserImageServlet" method="POST" class="text-center">
                    <label class="btn btn-primary ">
                        Choose Photo
                        <input type="file" class="hidden" id="upload" name="upload">
                    </label>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" form="frmuploadphoto" class="btn btn-primary">Save </button>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>