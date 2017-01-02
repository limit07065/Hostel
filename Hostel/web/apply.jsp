<%-- 
    Document   : index
    Created on : Dec 21, 2016, 4:11:00 PM
    Author     : Ray
--%>
<%@include file="header.jsp" %>
<style>
    .btn-success{
        margin:10px 0px ;
    }
</style>

<div class="container-fluid">
    <div class="row hostelbg">
        <!-- carousel roomtype gallery -->
        <div class="col-md-7 ">
            <div id="rooms" class="carousel slide" data-ride="carousel" data-interval="false">
                <!-- Indicators-->
                <ol class="carousel-indicators">
                    <c:forEach items="${roomTypes}" var="type" varStatus="loop">
                        <c:choose>
                            <c:when test="${loop.index==0}">
                                <li data-target="#rooms" data-slide-to="${loop.index}" class="active"></li>
                                </c:when>
                                <c:otherwise>
                                <li data-target="#rooms" data-slide-to="${loop.index}"></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                </ol>

                <!-- Wrapper for slides -->                
                <div class="carousel-inner" role="listbox">
                    <c:forEach items="${roomTypes}" var="type" varStatus="loop">
                        <c:choose>
                            <c:when test="${loop.index==0}">
                                <div class="item active">
                                    <img src="img/${type.getPic()}" alt="${type.getType()}" class="img-carousel" >
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="item img-carousel">
                                    <img src="img/${type.getPic()}" alt="${type.getType()}" class="img-carousel" >
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                </div>
            </div>
        </div>
        <div class="col-md-5 ">

            <form id="form" class="form-group1" action="Apply" method="POST">

                <label for="roomtype" >Room Type</label>

                <select id="roomtype" name="roomtype" class="form-control" onChange="slidetoroom()">
                    <option value=" " selected disabled hidden>Select Room Type</option>
                    <c:forEach items="${roomTypes}" var="currentRoomtype" varStatus="loop">
                        <option value="${currentRoomtype.getRoomType_PK()}" data-target="#rooms" data-slide-to="${loop.index}" > <c:out value="${currentRoomtype.getType()}" /> </option>
                    </c:forEach>
                </select>

                <div class=" row">
                    <div class=" col-sm-6">
                        <label for="block"  >Block </label>
                        <select id="block" name="block" class="form-control" disabled>
                            <c:choose>
                                <c:when test="${not empty block}">
                                    <c:forEach items="${sessionScope.block}" var="currentBlock" varStatus="loop">
                                        <option value="<c:out value='${currentBlock.getBlock()}' />"> <c:out value="${currentBlock.getBlock()}" /> </option>
                                    </c:forEach>
                                    <option value=" " selected disabled hidden>Select Available Block</option>
                                </c:when>
                                <c:otherwise>
                                    <option value=" " selected disabled >No Available Block</option>
                                </c:otherwise>
                            </c:choose>


                        </select>
                    </div>
                    <div class="col-sm-6">
                        <label for="room" >Room Number</label>
                        <select id="room" name="room" class="form-control" disabled >
                            <c:forEach items="${sessionScope.roomAvailable}" var="currentRoom" varStatus="loop">
                                <option value="<c:out value='${currentRoom.getNumber()}' />"> <c:out value="${currentRoom.getNumber()}" /> </option>
                            </c:forEach>
                            <option value=" " selected disabled hidden>Select Room</option>
                        </select>
                    </div>
                </div>
                <input id="submit" type="submit" class="pull-right btn btn-success" disabled>


            </form>

        </div>

    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">

                    $("#roomtype").change(function () {

                        var roomtype = $("#roomtype").val();

                        $.post("PopulateRoomServlet", {type: roomtype}, function () {
                            $("#block").load(" #block>*");
                        });

                        // Reset dropdownlist #room before activating #block
                        $("#room").val(" ");
                        $("#room").attr("disabled", "disabled");
                        $("#block").removeAttr("disabled");
                    });

                    $("#block").change(function () {
                        var block = $("#block").val();
                        var roomtype = $("#roomtype").val();

                        $.post("PopulateRoomServlet", {type: roomtype, block: block}, function () {
                            $("#room").load(" #room>*");
                        });

                        $("#room").removeAttr("disabled");
                    });

                    $("#room").change(function () {

                        var room = $("#room").val();

                        if (room !== null) {
                            $("#submit").removeAttr("disabled");
                        } else {
                            $("#submit").attr("disabled", "disabled");
                        }

                    });
</script>


<%@include file="footer.jsp" %>