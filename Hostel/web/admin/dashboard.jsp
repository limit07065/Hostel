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
        <%@include file="tab-report.jsp" %>
    </div>

    <div class="col-md-3">
        <h4>Menu</h4>
        <ul class="nav nav-pills nav-stacked">
            <li class="active"><a data-toggle="pill" href="#application">Application</a></li>
            <li><a data-toggle="pill" href="#room">Room</a></li>
            <li><a data-toggle="pill" href="#roomtype">Room Type</a></li>
            <li><a data-toggle="pill" href="#session">Session</a></li>
            <li><a data-toggle="pill" href="#report">Report</a></li>
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
<script src="js/jquery.datatable.min.js"></script>
<script src="js/bootstrap.datatable.min.js"></script>


<script>
    // Room JQuery AJAX
    $(document).on('submit', 'form#AddRoomForm', function (e) {
        $.ajax({
            type: "POST",
            url: "AddRoom",
            data: $(this).serialize(), // serializes the form's elements.
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
    $(document).on('submit', 'form#UploadRoomImageForm', function (e) {
        $.ajax({
            type: "POST",
            url: "UploadRoomImageServlet",
            data: new FormData(this),
            contentType: false,
            processData: false
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    function backEditing() { // This function is used to close the Upload Image Modal and Open the Editing Modal
        $("#editRTModal").modal('show');
    }
    function closeEditModal() { // Hide Editing Modal and Set the values in the Upload Image Modal
        $("#editRTModal").modal('hide');
        $("#UploadRoomImageForm #id").val($("#EditRoomTypeForm #id").val());
        $("#UploadRoomImageForm #Number").html($("#EditRoomTypeForm #Number").val());
        //$("#UploadRoomImageForm #Pic").attr('src', $("#EditRoomTypeForm #Pic").attr("src"));
    }
    $(document).on('click', 'span.editRT', function (e) {
        $("#EditRoomTypeForm #id").val($(this).data("id"));
        $("#EditRoomTypeForm #Number").val($(this).data("type"));
        $("#EditRoomTypeForm #Price").val($(this).data("price"));
        $("#EditRoomTypeForm #Description").val($(this).data("description"));
        $("#EditRoomTypeForm #Pic").attr('src', "img/" + $(this).data("pic"));
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
        $("#yes").on("click", function (e) {
            $.ajax({
                type: "POST",
                url: "DeleteRoomType",
                data: 'id=' + id,
                success: function () {
                    $("#roomtype").load(" #roomtype>*");
                    $("#delete").modal("hide");
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
                $("#messagecontent").text("Successfully add the session .");
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
                $("#report").load(" #report>*");
                $("#messagecontent").text("Successfully toggle sessions' status .");
                $("#message").modal("show");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    $(document).on('click', 'span.editS', function (e) {
        $("#EditSessionForm #id").val($(this).data("id"));
        $("#EditSessionForm #Name").val($(this).data("name"));
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
                $("#messagecontent").text("Successfully edit the session .");
                $("#message").modal("show");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    $(document).on('click', 'span.deleteS', function () {
        var id = $(this).data("id");
        $("#deletecontent").text('Are you sure you want to delete the session?');
        $("#yes").on("click", function (e) {
            $.ajax({
                type: "POST",
                url: "DeleteSession",
                data: 'id=' + id,
                success: function () {
                    $("#session").load(" #session>*");
                    $("#delete").modal("hide");
                    $("#message").modal("show");
                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
        });
    });
    // End of Session JQuery AJAX 

    // Application JQuery AJAX
    $(document).on('click', 'button.approve', function (e) {
        var id = $(this).data("appid");

        $.ajax({
            type: "POST",
            url: "ApproveApplicationServlet",
            data: 'id=' + id,
            success: function () {
                $("#application").load(" #application>*");
                $("#report").load(" #report>*");
                // $("#studentwindow").modal("hide");
                $("#messagecontent").text("Successfully approve the application .");
                $("#studentwindow").modal("hide");
                $("#message").modal("show");
            }
        });

        e.preventDefault(); // avoid to execute the actual submit of the form.
    });

    $(document).on('click', 'button.reject', function (e) {
        var id = $(this).data("appid");

        $.ajax({
            type: "POST",
            url: "RejectApplicationServlet",
            data: 'id=' + id,
            success: function () {
                $("#application").load(" #application>*");
                $("#report").load(" #report>*");
                // $("#studentwindow").modal("hide");
                $("#messagecontent").text("Successfully reject the application .");
                $("#message").modal("show");
            }
        });

        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    // End of Application JQuery AJAX
</script>
<!--Data Table -->
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
            var username = $(this).data("username");
            var appid = $(this).data("appid");

            //query student detail and edit field in modal
            $.get("GetUser", {username: username}, function (data) {
                var student = JSON.parse(data);
                $("#studentusername").text(username);
                $(".studentusername").text(username);
                $("#studentname").text(student.Name);
                $("#studentmatrixid").text(student.Id);
                var n = "1".localeCompare(student.Gender);
                if (n === 0)
                    $("#studentgender").text("Male");
                else if (n === 1)
                    $("#studentgender").text("Female");
                $("#studentcontact").text(student.Contact);
                $("#studentemail").text(student.Email);
                $("#studentphoto").css("background-image", "url('img/profile/" + student.Pic + "')");                
                $("#studentwindow").modal("show");
            });
        });




    });
</script>
</body>
</html>


