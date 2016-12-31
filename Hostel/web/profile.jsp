<%-- 
    Document   : profile
    Created on : Dec 22, 2016, 5:05:36 PM
    Author     : Ray
--%>

<%@include file="header.jsp"%>
<div class="container-fluid greenbg text-center">
    <div class="col-md-12 ">


        <div id="modalPhoto" data-photo="${user.getPic()}" data-toggle="modal" data-target="#uploadPhoto" ><img class="upload-icon" src="img/upload.png"></div>
        <div id="profilepic" class="img-circle img-thumbnail img-circle img-modal" style="background-image: url('img/${user.getPic()}')">                
                </div>
<!--        <img class="profile-pic" src="img/<c:out value='${user.getPic()}' />" alt="x"/>-->


    </div>
    <div class="col-md-12">
        <label> ${user.getName()}</label>    <br>
        <label><span><i class="fa fa-id-badge"></i></span> ${user.getId()}</label>       <br> 
        <label><span><i class="fa fa-phone"></i></span> ${user.getContact()}</label>    <br>
        <label><span><i class="fa fa-send"></i></span> ${user.getEmail()}</label>    <br>
    </div>
</div>     

<div class="col-md-12 btn-menu">   
    <button class="btn btn-default btn-profile" data-toggle="modal" data-target="#edit">Edit Profile</button>
    <button class="btn btn-default btn-profile" data-toggle="modal" data-target="#changepassword">Change Password</button>

</div>

<!--Modal for upload-->

<div id="uploadPhoto" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header green">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                <h4 class="modal-title" id="myModalLabel">Upload Profile Picture</h4>
            </div>
            <div class="modal-body">
                <div id="imgUpload" class="img-circle img-thumbnail img-circle img-modal">                
                </div>
    
                <form id="frmuploadphoto" action="UploadUserImageServlet" method="POST" class="text-center" enctype="multipart/form-data">

                    <label class="btn btn-primary ">
                        Choose Photo
                        <input type="file" class="hidden" id="upload" name="upload">
                    </label>
                </form>
            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" form="frmuploadphoto" class="btn btn-primary">Save </button>
            </div>
        </div>
    </div>
</div>
<!--END Modal for upload-->


<!--Modal for Edit-->

<div id="edit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header green">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                <h4 class="modal-title" id="myModalLabel">Edit Profile</h4>
            </div>
            <div class="modal-body">  
                <form id="frmedit" action="Profile" method="POST">
                    
                    <label class="" for="email">Email</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="${user.getEmail()}" >                    
                    <label class="" for="contact" id="contact">Contact</label>
                    <input type="text" class="form-control" name="contact" id="contact" placeholder="${user.getContact()}">    
                </form>
            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" form="frmedit" class="btn btn-primary">Save </button>
            </div>
        </div>
    </div>
</div>
<!--END Modal for Edit-->
<!--Modal for Change Password-->

<div id="changepassword" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header green">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                <h4 class="modal-title" id="myModalLabel">Change password</h4>
            </div>
            <div class="modal-body">  
                <form id="frmchangepassword" action="Profile" method="POST">
                    
                    <label class="" for="oldpassword">Old Password</label>
                    <input type="password" class="form-control" name="oldpassword" id="oldpassword" placeholder="Enter Old Password" >                    
                    <label class="" for="newpassword" id="contact">New Password</label>
                    <input type="password" class="form-control" name="newpassword" id="newpassword" placeholder="Enter New Password">    
                    <label class="" for="cnewpassword" id="contact">Confirm New Password</label>
                    <input type="password" class="form-control" name="cnewpassword" id="newpassword" placeholder="Enter New Password Again">    
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" form="frmchangepassword" class="btn btn-primary">Save </button>
            </div>
        </div>
    </div>
</div>
<!--END Modal for Edit-->
<%@include file="footer.jsp"%>