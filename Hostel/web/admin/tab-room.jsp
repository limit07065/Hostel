<%-- 
    Document   : tab-room
    Created on : Dec 31, 2016, 4:44:58 PM
    Author     : Ray
--%>

<div id="room" class="tab-pane fade ">
    <div id="roomlist" >
        <div>
             <a class="btn btn-default pull-right" data-toggle="modal" data-target="#addRModal">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add New Room
            </a>
        </div>
        <h3>
            Rooms 

        </h3>
        <table id="tableroom" class="table table-responsive table-hover tablesorter" cellspacing="0" width="100%" >
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Block</th>            
                    <th>Number</th>
                    <th>Gender</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty rooms}">
                    <c:forEach items="${rooms}" var="room" varStatus="loop">
                        <tr>
                            <td><c:out value="${loop.index+1}" /></td>

                        <td><c:out value="${room.getBlock()}" /></td>
                        <td><c:out value="${room.getNumber()}" /></td>
                        <td>
                        <c:choose>
                            <c:when test="${room.getGender()==0}">
                                Female
                            </c:when>
                            <c:when test="${room.getGender()==1}">
                                Male
                            </c:when>
                        </c:choose>
                        </td>                        
                        <td>
                        <c:forEach items="${roomTypes}" var="rt" >
                            <c:if test="${room.getRoomType()==rt.getRoomType_PK()}">
                                ${rt.getType()}
                            </c:if>
                        </c:forEach>  
                        </td>   
                        <td>
                        <c:choose>
                            <c:when test="${room.getOccupied()==0}">
                                Not Occupied
                            </c:when>
                            <c:when test="${room.getGender()==1}">
                                Occupied
                            </c:when>
                        </c:choose>
                        </td>                                                                        
                        <td>
                            <span class="glyphicon glyphicon-pencil editR" data-block="${room.getBlock()}" data-number="${room.getNumber()}" data-gender="${room.getGender()}" data-type="${room.getRoomType()}" data-id="${room.getRoom_PK()}" data-toggle="modal" data-target="#editRModal" style="cursor:pointer; color: blue;"></span>
                            &nbsp;
                            <span class="glyphicon glyphicon-trash deleteR" data-id="${room.getRoom_PK()}" data-toggle="modal" data-target="#delete" aria-hidden="true" style="color: red; cursor: pointer;"></span>

                        </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="7" class="text-center">No room.<td>
                    </tr>
                </c:otherwise>

            </c:choose>
            </tbody>
        </table>

        <!-- Modal -->
        <div class="modal fade" id="addRModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <form action="AddRoom" method="post" id="AddRoomForm">          
                         <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Room </h4>
                        </div>
                        <div class="modal-body">
                            
                            <div class="form-group row">
                                <label class="col-xs-2 col-form-label">Block</label>
                                <div class="col-xs-10">
                                    <input class="form-control" type="text" name="Block" id="rBlock">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-2 col-form-label">Number</label>
                                <div class="col-xs-10">
                                    <input class="form-control" type="text" name="Number" id="rNumber">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-2 col-form-label">Gender</label>
                                <div class="col-xs-10">
                                    <select class="form-control" name="Gender" id="rGender">
                                        <option value="1"> Male   </option>
                                        <option value="0"> Female   </option>                                            
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-xs-2 col-form-label">Room Type</label>
                                <div class="col-xs-10">
                                    <select class="form-control" name="RoomType_FK" id="rType">                                        
                                        <c:forEach items="${roomTypes}" var="type">
                                            <option value="${type.getRoomType_PK()}"> ${type.getType()}</option>
                                        </c:forEach>                             
                                    </select>
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
        <div class="modal fade" id="editRModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <form action="EditRoom" method="post" id="EditRoomForm">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Room </h4>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="id">
                            <div class="form-group row">
                                <label class="col-xs-2 col-form-label">Block</label>
                                <div class="col-xs-10">
                                    <input class="form-control" type="text" name="Block" id="rBlock">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-2 col-form-label">Number</label>
                                <div class="col-xs-10">
                                    <input class="form-control" type="text" name="Number" id="rNumber">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xs-2 col-form-label">Gender</label>
                                <div class="col-xs-10">
                                    <select class="form-control" name="Gender" id="rGender">
                                        <option value="1"> Male   </option>
                                        <option value="0"> Female   </option>                                            
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-xs-2 col-form-label">Room Type</label>
                                <div class="col-xs-10">
                                    <select class="form-control" name="RoomType_FK" id="rType">                                        
                                        <c:forEach items="${roomTypes}" var="type">
                                            <option value="${type.getRoomType_PK()}"> ${type.getType()}</option>
                                        </c:forEach>                             
                                    </select>
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
    </div>




</div>


