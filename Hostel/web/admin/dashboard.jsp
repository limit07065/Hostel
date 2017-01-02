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
<%@include file="modals.jsp" %>
<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- Hostel custom JavaScript -->
<script src="js/hostel.js"></script>

<!--Data Table JavaScript-->
<script src="js/bootstrap.datatable.min.js"></script>
<script src="js/jquery.datatable.min.js"></script>

<!--Data Table -->


<script>
    // Room JQuery AJAX
    $(document).on('submit', 'form#AddRoomForm', function (e) {
        
        
        $.ajax({
            type: "POST",
            url: "AddRoom",
            data: $("#AddRoomForm").serialize(), // serializes the form's elements.
            success: function () {
                $('#addRModal').modal('hide');
                $('.modal-backdrop').remove();
                $("#room").load(" #room>*");
                $("#messagecontent").text("Successfully add the room .");
                $("#message").modal("show");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    
    //edit room
     $(document).on('click', 'span.editR', function (e) {
        $("#EditRoomForm #id").val($(this).data("id"));
        $("#EditRoomForm #rBlock").val($(this).data("block"));
        $("#EditRoomForm #rNumber").val($(this).data("number"));
        $("#EditRoomForm #rGender").val($(this).data("gender"));
        $("#EditRoomForm #rType").val($(this).data("type"));
        
    });
    
    $(document).on('submit', 'form#EditRoomForm', function (e) {        
        
        $.ajax({
            type: "POST",
            url: "EditRoom",
            data: $(this).serialize(), // serializes the form's elements.
            success: function () {
                $(this).parents(".modal").modal('toggle');
                $('.modal-backdrop').remove();
                $("#room").load(" #room>*");
                $("#messagecontent").text("Successfully edit the room .");
                $("#message").modal("show");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    //delete room    
    $(document).on('click', 'span.deleteR', function () {
        var id = $(this).data("id");

        $("#deletecontent").text('Are you sure you want to delete the room?');        
        $("#yes").on("click", function (e) {
            $.ajax({
                type: "POST",
                url: "DeleteRoom",
                data: 'id=' + id,
                success: function () {
                    $("#room").load(" #room>*");
                    $("#messagecontent").text("Successfully delete the room.");
                    $("#delete").modal("hide");
                    $("#message").modal("show");
                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
        });
    });
    
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
    $(document).on('click', 'span.deleteRT', function () {
        var id = $(this).data("id");

        $("#deletecontent").text('Are you sure you want to delete the room type?');
        $("#delete").modal("show");
        $("#yes").on("click", function (e) {
            $.ajax({
                type: "POST",
                url: "DeleteRoomType",
                data: 'id=' + id,
                success: function () {
                    $("#roomtype").load(" #roomtype>*");
                    $("#delete").modal("hide");
                    $("#messagecontent").text("Successfully delete the room type.");
                    $("#message").modal("show");

                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.

        });
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
                $("#messagecontent").text("Successfully toggle the session's status.");
                $("#message").modal("show");
                $("#application").load(" #application>*");
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
    $(document).on('click', 'span.deleteS', function () {
        var id = $(this).data("id");

        $("#deletecontent").text('Are you sure you want to delete the session?');
        $("#delete").modal("show");
        $("#yes").on("click", function (e) {
            $.ajax({
                type: "POST",
                url: "DeleteSession",
                data: 'id=' + id,
                success: function () {
                    $("#session").load(" #session>*");
                    $("#messagecontent").text("Successfully delete the session.");
                    $("#delete").modal("hide");
                    $("#message").modal("show");
                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
        });
    });
    // End of Session JQuery AJAX 
</script>

<script>
    $(document).ready(function () {
        $("#tableapplication").dataTable({
            "iDisplayLength": 10,
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]]
        });
        
        $("#tableroom").dataTable({
            "iDisplayLength": 10,
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]]
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


