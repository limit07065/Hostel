<%-- 
    Document   : roomtype
    Created on : Jan 1, 2017, 7:04:09 PM
    Author     : User
--%>

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
                        <td colspan="6" style="text-align: center;">No Record</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${roomTypes}" var="roomtype" varStatus="loop">
                        <tr>
                            <td><c:out value="${loop.index + 1}" /></td>
                            <td class="first"><c:out value="${roomtype.getType()}" /></td>
                            <td class="second">
                                <img src="img/<c:out value='${roomtype.getPic()}' />" class="img-thumbnail" width="70"/>
                            </td>
                            <td class="third"><c:out value="${roomtype.getPrice()}" /></td>
                            <td class="fourth"><c:out value="${roomtype.getDescription()}" /></td>
                            <td>
                                <span class="glyphicon glyphicon-pencil editRT" data-id="${roomtype.getRoomType_PK()}" data-type="${roomtype.getType()}"
                                      data-price="${roomtype.getPrice()}" data-description="${roomtype.getDescription()}" data-pic="${roomtype.getPic()}"
                                      data-toggle="modal" data-target="#editRTModal" style="cursor: pointer; color: blue;"></span>
                                &nbsp;
                                <span class="glyphicon glyphicon-trash deleteRT" data-id="${roomtype.getRoomType_PK()}" data-toggle="modal" data-target="#delete" aria-hidden="true" style="color: red; cursor: pointer;"></span>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    <!-- Modal -->
    <div class="modal fade" id="changeImageModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <form action="UploadRoomImageServlet" method="post" enctype="multipart/form-data" id="UploadRoomImageForm">
                    <div class="modal-header green">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Change Room Type Image</h4>
                    </div>
                    <div class="modal-body text-center">
                        <input type="hidden" name="id" id="id">
                        <div class="form-group row">
                            <label id="Number" style="font-size: 140%;"></label>
                            <div id="imgUpload" class="img-circle img-thumbnail img-circle img-modal">                
                            </div>
                        </div>
                        <label class="btn btn-primary ">
                            Choose Photo
                            <input type="file" class="hidden" name="upload" id="upload" size="50" />
                        </label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="backEditing()">Back</button>
                        <input type="submit" class="btn btn-primary" value="Save"/>
                    </div>
                </form>
            </div>
        </div>                      
    </div>
    <!-- Modal -->

    <!-- Modal -->
    <div class="modal fade" id="editRTModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <form action="EditRoomType" method="post" id="EditRoomTypeForm">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Room Type</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" id="id">
                        <div class="form-group row">
                            <label class="col-xs-2 col-form-label">Type</label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" name="Number" id="Number">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-xs-2 col-form-label">Price</label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" name="Price" id="Price">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-xs-2 col-form-label">Description</label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" name="Description" id="Description">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-xs-2 col-form-label">Image</label>
                            <div class="col-xs-10">
                                <img id="Pic" src="img/default_room.jpg" class="img-circle img-thumbnail" width="130" data-toggle="modal" data-target="#changeImageModal"
                                     style="cursor: pointer;" onclick="closeEditModal()"/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#changeImageModal" onclick="closeEditModal()">Change Image</button>
                        <input type="submit" class="btn btn-primary" value="Save"/>
                    </div>
                </form>
            </div>
        </div>    
    </div>
    <!-- Modal -->
</div>
