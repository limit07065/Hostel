<%-- 
    Document   : dashboard.jsp
    Created on : Dec 22, 2016, 4:59:50 PM
    Author     : Ray
--%>

<%@ page import="bean.Application" %>
<%@ page import="bean.Room" %>
<%@ page import="bean.RoomType" %>
<%@ page import="bean.Session" %>
<%@ page import="java.util.ArrayList" %>

<%@include file="../header.jsp"%>
<link href="css/datatable.bootstrap.min.css" rel="stylesheet">
<div class="container-fluid">
    <div class="col-md-9 tab-content">
        <%@include file="tab-application.jsp" %>
        <%@include file="tab-room.jsp" %>
        <%@include file="tab-roomtype.jsp" %>
        <%@include file="tab-session.jsp" %>

    </div>

    <div class="col-md-3">
        <h4>Menu</h4>
        <ul class="nav nav-pills nav-stacked">
            <li class="active"><a data-toggle="pill" href="#application">Application</a></li>
            <li><a data-toggle="pill" href="#room">Room</a></li>
            <li><a data-toggle="pill" href="#roomtype">Room Type</a></li>
            <li><a data-toggle="pill" href="#session">Session</a></li>  
        </ul>
    </div>
</div>
<!--Modal for Confirm Delete-->

<div id="delete" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-danger">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
            </div>
            <div class="modal-body">  
                <p id="deletecontent"></p>
            </div>
            <div class="modal-footer ">
                <a id="yes" href=""><button class="btn btn-default">Yes </button></a>
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>

            </div>
        </div>
    </div>
</div>
<!--END Modal for Confirm Delete-->
<!-- one line modal notification -->
<div id="message" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:100px">

        <div class="alert alert-success">
            <span><i class="fa fa-child"></i></span><span id="messagecontent"></span>
        </div>      



    </div>
</div>
<!-- END one line modal notification -->

<!-- jQuery -->
<script src="js/jquery.js"></script>


<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>


<!-- Hostel custom JavaScript -->
<script src="js/hostel.js"></script>




<script>

    $(".student").on("click", function () {
        var appId = $(this).data("appid");
        var username = $(this).text();

        //query student detail and edit field in modal
        $.get("test", function (data) {
            var student = JSON.parse(data);
            $("#studentname").text(student.fullname);
            $("#studentmatrixid").text(student.matrixId);
            $("#studentwindow").modal();
        });
    });

</script>


<script>
    // Room Type JQuery AJAX
    $(document).on('submit', 'form#AddRoomTypeForm', function (e) {
        $.ajax({
            type: "POST",
            url: "AddRoomType",
            data: $("#AddRoomTypeForm").serialize(), // serializes the form's elements.
            success: function () {
                $('#addRTModal').modal('hide');
                $('.modal-backdrop').remove();
                $("#roomtype").load(" #roomtype>*");                
                $("#messagecontent").text("Successfully add the room type.");
                $("#message").modal("show");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    //    $(document).on('submit', 'form.UploadRoomImageForm', function (e) {
    //        $.ajax({
    //            type: "POST",
    //            url: "UploadRoomImageServlet",
    //            data: $(this).serialize(), // serializes the form's elements.
    //            success: function(){
    //                $(this).parents(".modal fade").modal('hide');
    //                $("#roomtype").load(" #roomtype>*");
    //                alert("Successfully change the image.");
    //            }
    //        });
    //        e.preventDefault(); // avoid to execute the actual submit of the form.
    //    });
    function backEditing() { // This function is used to close the Upload Image Modal and Open the Editing Modal
        $("#editRTModal").modal('show');
    }
    function closeEditModal() { // Hide Editing Modal and Set the values in the Upload Image Modal
        $("#editRTModal").modal('hide');
        $("#UploadRoomImageForm #id").val($("#EditRoomTypeForm #id").val());
        $("#UploadRoomImageForm #Number").html($("#EditRoomTypeForm #Number").val());
        $("#UploadRoomImageForm #Pic").attr('src', $("#EditRoomTypeForm #Pic").attr("src"));
    }
    $(document).on('click', 'span.editRT', function (e) {
        $("#EditRoomTypeForm #id").val($(this).siblings("input").val());
        $("#EditRoomTypeForm #Number").val($(this).parents("tr").children("td.first").html());
        $("#EditRoomTypeForm #Price").val($(this).parents("tr").children("td.third").html());
        $("#EditRoomTypeForm #Description").val($(this).parents("tr").children("td.fourth").html());
        $("#EditRoomTypeForm #Pic").attr('src', $(this).parents("tr").children("td.second").children("img").attr("src"));
    });
    $(document).on('submit', 'form#EditRoomTypeForm', function (e) {
        $.ajax({
            type: "POST",
            url: "EditRoomType",
            data: $(this).serialize(), // serializes the form's elements.
            success: function () {
                $(this).parents(".modal").modal('toggle');
                $('.modal-backdrop').remove();

                $("#roomtype").load(" #roomtype>*");
                $("#messagecontent").text("Successfully edit the room type.");
                $("#message").modal("show");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.

    });
    $(document).on('click', 'span.deleteRT', function (e) {
        $("#deletecontent").text('Are you sure you want to delete the room type?');
        $("#delete").modal("show");
        
        $("#yes").on("click",function(){
            
        });
        {
            $.ajax({
                type: "POST",
                url: "DeleteRoomType",
                data: 'id=' + $(this).siblings("input").val(),
                success: function () {
                    $("#roomtype").load(" #roomtype>*");
                    $("#messagecontent").text("Successfully delete the room type.");
                $("#message").modal("show");
                    
                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
        }
//        $("#yes").on("click",function(){
//            $.ajax({
//                type: "POST",
//                url: "DeleteRoomType",
//                data: 'id=' + ele.siblings("input").val(),
//                success: function (e) {
//                    e.preventDefault(); // avoid to execute the actual submit of the form.
//                    $("#roomtype").load(" #roomtype>*");
//                    $("#messagecontent").text("Successfully delete the room type.");
//                $("#message").modal("show");
//                    
//                }
//            });
//            
//        });
    });
    // End of Room Type JQuery AJAX

    // Session JQuery AJAX
    $(document).on('submit', 'form#AddSessionForm', function (e) {
        $.ajax({
            type: "POST",
            url: "AddSession",
            data: $("#AddSessionForm").serialize(), // serializes the form's elements.
            success: function () {
                $('#addSModal').modal('hide');
                $('.modal-backdrop').remove();
                $("#session").load(" #session>*");
                $("#messagecontent").text("Successfully add the session.");
                $("#message").modal("show");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    $(document).on('click', 'span.toggleStatus', function (e) {
        $.ajax({
            type: "POST",
            url: "SessionActivation",
            data: 'id=' + $(this).siblings("input").val() + '&status=' + $(this).siblings("input").next().val(),
            success: function () {

                $("#session").load(" #session>*");
                $("#messagecontent").text("Successfully change the session's status.");
                $("#message").modal("show");

            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.

    });
    $(document).on('click', 'span.editS', function (e) {
        $("#EditSessionForm #id").val($(this).parents("tr").children("td.Name").next().children("input").val());
        $("#EditSessionForm #Name").val($(this).parents("tr").children("td.Name").html());
    });
    $(document).on('submit', 'form#EditSessionForm', function (e) {
        $.ajax({
            type: "POST",
            url: "EditSession",
            data: $(this).serialize(), // serializes the form's elements.
            success: function () {
                $(this).parents(".modal fade").modal('hide');
                $('.modal-backdrop').remove();
                $("#session").load(" #session>*");
                $("#messagecontent").text("Successfully edit the session.");
                $("#message").modal("show");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    $(document).on('click', 'span.deleteS', function (e) {
        if (confirm('Are you sure you want to delete the room type?') === true)
        {
            $.ajax({
                type: "POST",
                url: "DeleteSession",
                data: 'id=' + $(this).siblings("input").val(),
                success: function () {
                    $("#session").load(" #session>*");                    
                    $("#messagecontent").text("Successfully delete the session.");
                    $("#message").modal("show");
                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
        }
    });
    // End of Session JQuery AJAX 
</script>


<script>
    $(document).ready(function () {
    $("#tableapplication").dataTable({
    "iDisplayLength": 10,
            "aLengthMenu": [[10, 25, 50, 100, - 1], [10, 25, 50, 100, "All"]]
    });
            $(".student").on("click", function () {
    var appId = $(this).data("appid");
            var username = $(this).text();<!--Data Table JavaScript-->
            < script src = "js/bootstrap.datatable.min.js" ></script>
<script src="js/jquery.datatable.min.js"></script>

<script>
            $(document).ready(function () {
    $("#tableapplication").dataTable({
    "iDisplayLength": 10,
            "aLengthMenu": [[10, 25, 50, 100, - 1], [10, 25, 50, 100, "All"]]
    });
            $(".student").on("click", function () {
    var appId = $(this).data("appid");
            var username = $(this).text();
            //query student detail and edit field in modal
            $.get("test", function (data) {
            var student = JSON.parse(data);
                    $("#studentname").text(student.fullname);
                    $("#studentmatrixid").text(student.matrixId);
                    $("#studentwindow").modal();
            });
    });
    });
</script>
</body>
</html>



