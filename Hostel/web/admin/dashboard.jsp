<%-- 
    Document   : dashboard.jsp
    Created on : Dec 22, 2016, 4:59:50 PM
    Author     : Ray
--%>


<link href="../css/bootstrap.min.css" rel="stylesheet">
<%@include file="../header.jsp"%>
<div class="container-fluid" style="margin-top:5%;">
    <div class="col-md-9 tab-content">
        <div id="application" class="tab-pane fade in active">
            <div class="col-md-6" id="applicationlist" style="height:530px;">
                <h3>Application list</h3>
                <table class="table table-responsive table-hover" >
                    <tr>
                        <th>No.</th>
                        <th>Name.</th>
                        <th>Matric No.</th>
                        <th>Block</th>
                        <th>Room </th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <c:choose>
                            <c:when test="${$application}">
                                
                            </c:when>
                            <c:when test="${application ==null}">
                                <td colspan="7">No Record</td>
                            </c:when>
                                
                        </c:choose>
                    </tr>
                
                
                    
                </table>


            </div>
<!--            hidden-->
            <div class="col-md-6" id="studentwindow">
                <h3>Student Window</h3>
                <div class="col-md-6">
                    <img alt="Profile Picture"height="150px" />
                </div>
                <div class="col-md-6">
                    <label>Name:</label>
                    <br/>
                    <label>Matric Number:</label>
                </div>
            </div>
            
        </div>
        <div id="room" class="tab-pane fade">
            <!--This is for the things inside second menu-->
            <h3>GG</h3>
        </div>
        <div id="roomtype" class="tab-pane fade">
            <!--This is for the things inside third menu-->
            <div>
                <a href="#" class="btn btn-default pull-right" data-toggle="modal" data-target="#addModal">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add New Room Type
                </a>
            </div>
            
            <!-- Modal -->
            <div class="modal fade" id="addModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <form action="../AddRoomType" method="post">          
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
                                <input type="submit" class="btn btn-default" value="Save"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Modal -->
            
            <h3>Room Types</h3>
            <table class="table table-responsive table-hover">
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
                <tbody>
                    <c:choose>
                        <c:when test="${roomTypes}">
                            <c:forEach items="${roomTypes}" var="roomtype" varStatus="loop">
                                <tr>
                                    <td><c:out value="${loop.index + 1}" /></td>
                                    <td><c:out value="${roomtype.Type}" /></td>
                                    <td>
                                        <a href="<c:out value='${UploadRoomImageURL}' />">
                                            <img src="../img/<c:out value="${roomtype.Pic}" />" width="50"/>
                                        </a>
                                    </td>
                                    <td><c:out value="${roomtype.Price}" /></td>
                                    <td><c:out value="${roomtype.Description}" /></td>
                                    <td>
                                        <span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#editModal" style="cursor:pointer;"></span>
                                        &nbsp;
                                        <a href="<c:out value='${DeleteRoomTypeURL}' />" onclick="return confirm('Are you sure you want to delete the room type?')">
                                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                        </a>
                                    </td>
                                    
                                    <!-- Url With Parameters To Be Passed To Servlet -->
                                    <%--<c:url value="EditRoomType" var="EditRoomTypeURL">--%>
                                        <%--<c:param name="id"   value="${roomtype.RoomType_PK}" />--%>
                                        <%--<c:param name="Number"   value="${roomtype.Type}" />--%>
                                        <%--<c:param name="Price"   value="${roomtype.Price}" />--%>
                                        <%--<c:param name="Description"   value="${roomtype.Description}" />--%>
                                    <%--</c:url>--%>
                                    <c:url value="UploadRoomImageServlet" var="UploadRoomImageURL">
                                        <c:param name="id"   value="${roomtype.RoomType_PK}" />
                                    </c:url>
                                    <c:url value="DeleteRoomType" var="DeleteRoomTypeURL">
                                        <c:param name="id"   value="${roomtype.RoomType_PK}" />
                                    </c:url>  
                                    <!-- Url With Parameters To Be Passed To Servlet -->
                                    
                                    <!-- Modal -->
                                    <div class="modal fade" id="editModal" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <form action="EditRoomType" method="post">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Room Type</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="hidden" name="id" value="${roomtype.RoomType_PK}">
                                                        <div class="form-group row">
                                                            <label for="type" class="col-xs-2 col-form-label">Type</label>
                                                            <div class="col-xs-10">
                                                                <input class="form-control" type="text" value="${roomtype.Type}" name="Number">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="price" class="col-xs-2 col-form-label">Price</label>
                                                            <div class="col-xs-10">
                                                                <input class="form-control" type="text" value="${roomtype.Price}" name="Price">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="description" class="col-xs-2 col-form-label">Description</label>
                                                            <div class="col-xs-10">
                                                                <input class="form-control" type="text" value="${roomtype.Description}" name="Description">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="description" class="col-xs-2 col-form-label">Image</label>
                                                            <div class="col-xs-10">
                                                                <input class="form-control" type="text" value="${roomtype.Pic}" readonly="true">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="submit" class="btn btn-default" value="Save"/>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal -->
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:when test="${roomTypes ==null}">
                            <td colspan="7" style="text-align: center;">No Record</td>
                        </c:when>
                    </c:choose>
                </tbody>
            </table>
        </div>
        <div id="session" class="tab-pane fade">
            <!--This is for the things inside forth menu-->
            <h3>cd</h3>
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
<script src="../js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>
</body>
</html>

