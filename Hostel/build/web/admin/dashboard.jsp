<%-- 
    Document   : dashboard.jsp
    Created on : Dec 22, 2016, 4:59:50 PM
    Author     : Ray
--%>


<%@include file="../header.jsp"%>
<%@ page import="bean.Application" %>
<%@ page import="bean.Room" %>
<%@ page import="bean.RoomType" %>
<%@ page import="bean.Session" %>
<%@ page import="java.util.ArrayList" %>
<div class="container-fluid">
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
                <a href="#" class="btn btn-default pull-right" data-toggle="modal" data-target="#addRTModal">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add New Room Type
                </a>
            </div>
            
            <!-- Modal -->
            <div class="modal fade" id="addRTModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <form action="AddRoomType" method="post">          
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
                <tbody>
                    <c:choose>
                        <c:when test="${roomTypes ==null}">
                            <td colspan="7" style="text-align: center;">No Record</td>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${roomTypes}" var="roomtype" varStatus="loop">
                                
                                <!-- Url With Parameters To Be Passed To Servlet -->
                                <c:url value="UploadRoomImageServlet" var="UploadRoomImageURL">
                                    <c:param name="id"   value="${roomtype.roomType_PK}" />
                                </c:url>
                                <c:url value="DeleteRoomType" var="DeleteRoomTypeURL">
                                    <c:param name="id"   value="${roomtype.roomType_PK}" />
                                </c:url>  
                                <!-- Url With Parameters To Be Passed To Servlet -->
                                
                                <tr>
                                    <td><c:out value="${loop.index + 1}" /></td>
                                    <td><c:out value="${roomtype.type}" /></td>
                                    <td>
                                        <img src="img/<c:out value="${roomtype.pic}" />" width="70" data-toggle="modal" data-target="#changeImageModal${loop.index}" style="cursor: pointer;"/>
                                    </td>
                                    <td><c:out value="${roomtype.price}" /></td>
                                    <td><c:out value="${roomtype.description}" /></td>
                                    <td>
                                        <span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#editRTModal${loop.index}" style="cursor: pointer; color: blue;"></span>
                                        &nbsp;
                                        <a href="<c:out value='${DeleteRoomTypeURL}' />" onclick="return confirm('Are you sure you want to delete the room type?')">
                                            <span class="glyphicon glyphicon-trash" aria-hidden="true" style="color: red;"></span>
                                        </a>
                                    </td>
                                    
                                    <!-- Modal -->
                                    <div class="modal fade" id="changeImageModal${loop.index}" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <form action="UploadRoomImageServlet" method="post" enctype="multipart/form-data">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Change Room Type Image</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="hidden" name="id" value="${roomtype.roomType_PK}">
                                                        <div class="form-group row">
                                                            <label for="type" class="col-xs-4 col-form-label">Type</label>
                                                            <div class="col-xs-8">
                                                                <label id="type" class="form-control"><c:out value='${roomtype.type}'/></label>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="curImage" class="col-xs-4 col-form-label">Current Image</label>
                                                            <div class="col-xs-8">
                                                                <img src="img/<c:out value='${roomtype.pic}' />" width="140" id="curImage"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="filetoupload" class="col-xs-4 col-form-label">Choose File to Upload</label>
                                                            <div class="col-xs-8">
                                                                <input type="file" name="filetoupload" id="filetoupload" size="50" />
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
                                    
                                    <!-- Modal -->
                                    <div class="modal fade" id="editRTModal${loop.index}" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <form action="EditRoomType" method="post">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Room Type</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="hidden" name="id" value="${roomtype.roomType_PK}">
                                                        <div class="form-group row">
                                                            <label for="type" class="col-xs-2 col-form-label">Type</label>
                                                            <div class="col-xs-10">
                                                                <input class="form-control" type="text" value="${roomtype.type}" name="Number" id="type">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="price" class="col-xs-2 col-form-label">Price</label>
                                                            <div class="col-xs-10">
                                                                <input class="form-control" type="text" value="${roomtype.price}" name="Price" id="price">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="description" class="col-xs-2 col-form-label">Description</label>
                                                            <div class="col-xs-10">
                                                                <input class="form-control" type="text" value="${roomtype.description}" name="Description" id="description">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="curImage" class="col-xs-2 col-form-label">Image</label>
                                                            <div class="col-xs-10">
                                                                <img src="img/<c:out value='${roomtype.pic}' />" width="100" id="curImage"/>
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
                        <form action="AddSession" method="post">          
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">New Session</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label for="name" class="col-xs-2 col-form-label">Name</label>
                                    <div class="col-xs-10">
                                        <input class="form-control" type="text" name="Name" id="name">
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
                <tbody>
                    <c:choose>
                        <c:when test="${sessions == null}">
                            <td colspan="7" style="text-align: center;">No Record</td>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${sessions}" var="currentSession" varStatus="loop">
                                
                                <!-- Url With Parameters To Be Passed To Servlet -->
                                <c:url value="SessionActivation" var="SessionActivationURL">
                                    <c:param name="id"   value="${currentSession.id}" />
                                    <c:param name="status"   value="${currentSession.status}" />
                                </c:url>
                                <c:url value="DeleteSession" var="DeleteSessionURL">
                                    <c:param name="id"   value="${currentSession.id}" />
                                </c:url>  
                                <!-- Url With Parameters To Be Passed To Servlet -->
                                
                                <tr>
                                    <td><c:out value="${loop.index + 1}" /></td>
                                    <td><c:out value="${currentSession.name}" /></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${currentSession.status == 0}">
                                                <a href="<c:out value='${SessionActivationURL}' />"><span class="glyphicon glyphicon-ok" style="color: green;"></span>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="<c:out value='${SessionActivationURL}' />"><span class="glyphicon glyphicon-remove" style="color: red;"></span>
                                            </c:otherwise>    
                                        </c:choose>
                                    </td>
                                    <td>
                                        <span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#editSModal${loop.index}" style="cursor:pointer; color: blue;"></span>
                                        &nbsp;
                                        <a href="<c:out value='${DeleteSessionURL}' />" onclick="return confirm('Are you sure you want to delete the session?')">
                                            <span class="glyphicon glyphicon-trash" aria-hidden="true" style="color: red;"></span>
                                        </a>
                                    </td>
                                                                       
                                    <!-- Modal -->
                                    <div class="modal fade" id="editSModal${loop.index}" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <form action="EditSession" method="post">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Session</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="hidden" name="id" value="${currentSession.id}">
                                                        <div class="form-group row">
                                                            <label for="name" class="col-xs-2 col-form-label">Name</label>
                                                            <div class="col-xs-10">
                                                                <input class="form-control" type="text" value="${currentSession.name}" name="Name" id="name">
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
</body>
</html>

