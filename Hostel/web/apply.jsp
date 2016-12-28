<%-- 
    Document   : index
    Created on : Dec 21, 2016, 4:11:00 PM
    Author     : Ray
--%>
<%@include file="header.jsp" %>
<div class="container-fluid">
    <div class="row hostelbg">
        <!-- carousel roomtype gallery -->
        <div class="col-md-6 ">

        </div>

        <div class="col-md-4 col-md-offset-1">
            <form id="form" class="form-group">
                <label for="roomtype" >Room Type</label>

                <select id="roomtype" name="roomtype" class="form-control">
                    <option value="" selected disabled>Select Room Type</option>
                    <c:forEach items="${sessionScope.roomtype}" var="currentRoomtype" varStatus="loop">
                        <option value="<c:out value='${currentRoomtype.getRoomType_PK()}' />"> <c:out value="${currentRoomtype.getType()}" /> </option>
                    </c:forEach>
                </select>

                <div class=" row">
                    <div class=" col-md-6">
                        <label for="block"  >Block </label>
                        <c:choose>
                            <c:when test="${empty block}">
                                <select id="block" name="block" class="form-control" disabled>
                                    <option value="" selected disabled>Select Available Block</option>
                                </select>
                            </c:when>
                            <c:otherwise>
                                <select id="block" name="block" class="form-control">
                                    <option value="" selected disabled>Select Available Block</option>
                                    <c:forEach items="${sessionScope.block}" var="currentBlock" varStatus="loop">
                                        <option value="<c:out value='${currentBlock.getBlock()}' />"> <c:out value="${currentBlock.getBlock()}" /> </option>
                                    </c:forEach>
                                </select>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-md-6">
                        <label for="room" >Room Number</label>
                        
                        <c:choose>
                            <c:when test="${empty block}">
                                <select id="room" name="room" class="form-control" disabled>
                                    <option value="" selected disabled>Select Room</option>
                                </select>
                            </c:when>
                            <c:otherwise>
                                <select id="room" name="room" class="form-control">
                                    <option value="" selected disabled>Select Room</option>
                                    <c:forEach items="${sessionScope.room}" var="currentRoom" varStatus="loop">
                                        <option value="<c:out value='${currentRoom.getRoom_PK()}' />"> <c:out value="${currentRoom.getNumber()}" /> </option>
                                    </c:forEach>
                                </select>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <input type="submit" class="pull-right btn btn-success">


            </form>

        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">
    
    $("#roomtype").change( function(){
        
        var roomtype = $("#roomtype").val();
        
        $.post("PopulateRoomServlet", {type: roomtype}, function(res){ 
            $("#room").load(" #room");
        });
    });
    
</script>


<%@include file="footer.jsp" %>