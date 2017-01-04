<%-- 
    Document   : tab-report
    Created on : Jan 3, 2017, 9:37:53 PM
    Author     : User
--%>

<div id="report" class="tab-pane fade">
    <h3>
        Report for ${activeSession}
    </h3>
    <div class="col-xs-12 col-md-4" style="padding-bottom: 10px;">
        <button type="button" class="btn btn-primary">Total Application :  <span class="badge">${totalApplication}</span></button>
    </div>
    <div class="col-xs-12 col-md-4" style="padding-bottom: 10px;">
        <button type="button" class="btn btn-success">Approved Application :  <span class="badge">${approvedApplication}</span></button>
    </div>
    <div class="col-xs-12 col-md-4" style="padding-bottom: 10px;">
        <button type="button" class="btn btn-danger">Rejected Application :  <span class="badge">${rejectedApplication}</span></button>
    </div>
   
    <h3 style="margin-top:8%;">Report For Current Room</h3>
    <table id="tableroom" class="table table-responsive table-hover tablesorter" cellspacing="0" width="100%" >
        <thead>
            <tr>
                <th>Type</th>
                <th>Rented</th>            
                <th>Free</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Single</td>
                <td>${occupiedSingleRoom}</td>
                <td>${unoccupiedSingleRoom}</td>
                <td>${occupiedSingleRoom + unoccupiedSingleRoom}</td>
            </tr>
            <tr>
                <td>Double</td>
                <td>${occupiedDoubleRoom}</td>
                <td>${unoccupiedDoubleRoom}</td>
                <td>${occupiedDoubleRoom + unoccupiedDoubleRoom}</td>
            </tr>
            <tr>
                <td>Single With Bathroom</td>
                <td>${occupiedSingleRoomWBathroom}</td>
                <td>${unoccupiedSingleRoomWBathroom}</td>
                <td>${occupiedSingleRoomWBathroom + unoccupiedSingleRoomWBathroom}</td>
            </tr>
        </tbody>
<!--        <tbody>
        <c:choose>
            <c:when test="${not empty occupiedSingleRoomWBathroom}">
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
        </tbody>-->
    </table>
</div>
