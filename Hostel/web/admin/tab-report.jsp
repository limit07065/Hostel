<%-- 
    Document   : tab-report
    Created on : Jan 3, 2017, 9:37:53 PM
    Author     : User
--%>

<div id="report" class="tab-pane fade">
    <h3>
        Session  
    </h3>
    Total App
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
</div>
