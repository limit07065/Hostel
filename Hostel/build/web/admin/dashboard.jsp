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

        <div id="roomtype" class="tab-pane fade">
            <!--This is for the things inside third menu-->
            <div>
                <a href="#" class="btn btn-default pull-right" data-toggle="modal" data-target="#addRTModal">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add New Room Type
                </a>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="addRTModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <form action="AddRoomType" method="post" id="AddRoomTypeForm">          
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">New Room Type</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label for="type" class="col-xs-2 col-form-label">Type</label>
                                    <div class="col-xs-10">
                                        <input class="form-control" type="text" name="Number">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="price" class="col-xs-2 col-form-label">Price</label>
                                    <div class="col-xs-10">
                                        <input class="form-control" type="text" name="Price">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="description" class="col-xs-2 col-form-label">Description</label>
                                    <div class="col-xs-10">
                                        <input class="form-control" type="text" name="Description">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-primary" value="Save"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Modal -->

            <h3>Room Types</h3>
            <table class="table table-responsive table-hover vertical-text-align-middle">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Type</th>
                        <th>Pic</th>
                        <th>Price</th>
                        <th>Description </th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="tableBodyRT">
                    <c:choose>
                        <c:when test="${empty roomTypes}">
                            <tr>
                                <td colspan="7" style="text-align: center;">No Record</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${roomTypes}" var="roomtype" varStatus="loop">
                                <tr>
                                    <td><c:out value="${loop.index + 1}" /></td>
                                    <td><c:out value="${roomtype.getType()}" /></td>
                                    <td>
                                        <img src="img/<c:out value="${roomtype.getPic()}" />" width="70"/>
                                    </td>
                                    <td><c:out value="${roomtype.getPrice()}" /></td>
                                    <td><c:out value="${roomtype.getDescription()}" /></td>
                                    <td>
                                        <span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#editRTModal${loop.index}" style="cursor: pointer; color: blue;"></span>
                                        &nbsp;
                                        <span class="glyphicon glyphicon-trash deleteRT" aria-hidden="true" style="color: red; cursor: pointer;"></span>
                                        <input type="hidden" value="${roomtype.getRoomType_PK()}" name="id">
                                    </td>

                                    <!-- Modal -->
                            <div class="modal fade" id="changeImageModal${loop.index}" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <form action="UploadRoomImageServlet" method="post" enctype="multipart/form-data" class="UploadRoomImageForm">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Change Room Type Image</h4>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="id" value="${roomtype.getRoomType_PK()}">
                                                <div class="form-group row">
                                                    <label class="col-xs-4 col-form-label">Type</label>
                                                    <div class="col-xs-8">
                                                        <label id="type" class="form-control"><c:out value='${roomtype.getType()}'/></label>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-xs-4 col-form-label">Current Image</label>
                                                    <div class="col-xs-8">
                                                        <img src="img/<c:out value='${roomtype.getPic()}' />" width="140"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-xs-4 col-form-label">Choose File to Upload</label>
                                                    <div class="col-xs-8">
                                                        <input type="file" name="filetoupload" size="50" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-primary" value="Save"/>
                                            </div>
                                        </form>
                                    </div>
                                </div>                      
                            </div>
                            <!-- Modal -->

                            <!-- Modal -->
                            <div class="modal fade" id="editRTModal<c:out value='${loop.index}'/>" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <form action="EditRoomType" method="post" class="EditRoomTypeForm">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Room Type</h4>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="id" value="<c:out value='${roomtype.getRoomType_PK()}'/>">
                                                <div class="form-group row">
                                                    <label class="col-xs-2 col-form-label">Type</label>
                                                    <div class="col-xs-10">
                                                        <input class="form-control" type="text" value="<c:out value='${roomtype.getType()}'/>" name="Number">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-xs-2 col-form-label">Price</label>
                                                    <div class="col-xs-10">
                                                        <input class="form-control" type="text" value="<c:out value='${roomtype.getPrice()}'/>" name="Price">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-xs-2 col-form-label">Description</label>
                                                    <div class="col-xs-10">
                                                        <input class="form-control" type="text" value="<c:out value='${roomtype.getDescription()}'/>" name="Description">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-xs-2 col-form-label">Image</label>
                                                    <div class="col-xs-10">
                                                        <img src="img/<c:out value='${roomtype.getPic()}' />" width="100" data-toggle="modal" data-target="#changeImageModal<c:out value='${loop.index}'/>"
                                                             style="cursor: pointer;" onclick="closeEditModal(<c:out value='${loop.index}'/>)"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-primary" value="Save"/>
                                            </div>
                                        </form>
                                    </div>
                                </div>    
                            </div>
                            <!-- Modal -->
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
        <div id="session" class="tab-pane fade">
            <!--This is for the things inside forth menu-->
            <div>
                <a href="#" class="btn btn-default pull-right" data-toggle="modal" data-target="#addSModal">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add New Session
                </a>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="addSModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <form action="AddSession" method="post" id="AddSessionForm">          
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">New Session</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label class="col-xs-2 col-form-label">Name</label>
                                    <div class="col-xs-10">
                                        <input class="form-control" type="text" name="Name">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-primary" value="Save"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Modal -->

            <h3>Sessions</h3>
            <table class="table table-responsive table-hover">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Session</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="tableBodyS">
                    <c:choose>
                        <c:when test="${empty sessions}">
                            <tr>
                                <td colspan="7" style="text-align: center;">No Record</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${sessions}" var="currentSession" varStatus="loop">   
                                <tr>
                                    <td><c:out value="${loop.index + 1}" /></td>
                                    <td><c:out value="${currentSession.getName()}" /></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${currentSession.getStatus() == 1}">
                                                <span class="glyphicon glyphicon-ok toggleStatus" style="color: green; cursor: pointer;"></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="glyphicon glyphicon-remove toggleStatus" style="color: red; cursor: pointer;"></span>
                                            </c:otherwise>    
                                        </c:choose>
                                        <input type="hidden" name="id" value="${currentSession.getId()}">
                                        <input type="hidden" name="status" value="${currentSession.getStatus()}">
                                    </td>
                                    <td>
                                        <span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#editSModal${loop.index}" style="cursor:pointer; color: blue;"></span>
                                        &nbsp;
                                        <span class="glyphicon glyphicon-trash deleteS" aria-hidden="true" style="color: red; cursor: pointer;"></span>
                                        <input type="hidden" name="id" value="${currentSession.getId()}">
                                    </td>

                                    <!-- Modal -->
                            <div class="modal fade" id="editSModal${loop.index}" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <form action="EditSession" method="post" class="EditSessionForm">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Session</h4>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="id" value="${currentSession.getId()}">
                                                <div class="form-group row">
                                                    <label class="col-xs-2 col-form-label">Name</label>
                                                    <div class="col-xs-10">
                                                        <input class="form-control" type="text" value="${currentSession.getName()}" name="Name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-primary" value="Save"/>
                                            </div>
                                        </form>      
                                    </div>
                                </div>
                            </div>
                            <!-- Modal -->
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>



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
                alert("Successfully add the room type.");
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
    $(document).on('submit', 'form.EditRoomTypeForm', function (e) {
        $.ajax({
            type: "POST",
            url: "EditRoomType",
            data: $(this).serialize(), // serializes the form's elements.
            success: function () {
                $(this).parents(".modal").modal('toggle');
                $('.modal-backdrop').remove();
                $("#roomtype").load(" #roomtype>*");
                alert("Successfully edit the room type.");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    $(document).on('click', 'span.deleteRT', function (e) {
        if (confirm('Are you sure you want to delete the room type?') === true)
        {
            $.ajax({
                type: "POST",
                url: "DeleteRoomType",
                data: 'id=' + $(this).siblings("input").val(),
                success: function () {
                    $("#roomtype").load(" #roomtype>*");
                    alert("Successfully delete the room type.");
                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
        }
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
                alert("Successfully add the session.");
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
                alert("Successfully toggle the session's status.");
            }
        });
        e.preventDefault(); // avoid to execute the actual submit of the form.
    });
    $(document).on('submit', 'form.EditSessionForm', function (e) {
        $.ajax({
            type: "POST",
            url: "EditSession",
            data: $(this).serialize(), // serializes the form's elements.
            success: function () {
                $(this).parents(".modal fade").modal('hide');
                $('.modal-backdrop').remove();
                $("#session").load(" #session>*");
                alert("Successfully edit the session.");
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
                    alert("Successfully delete the session.");
                }
            });
            e.preventDefault(); // avoid to execute the actual submit of the form.
        }
    });
    // End of Session JQuery AJAX

    function closeEditModal(id) {
        $("#editRTModal" + id).modal('hide');
    }
</script>

<!--Data Table JavaScript-->
<script src="js/bootstrap.datatable.min.js"></script>
<script src="js/jquery.datatable.min.js"></script>

<script>
    $(document).ready(function () {
        $("#tableapplication").dataTable({
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