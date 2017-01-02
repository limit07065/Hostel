<%-- 
    Document   : application
    Created on : Dec 21, 2016, 5:24:41 PM
    Author     : Ray
--%>

<%@include file="header.jsp" %>

<div class="container">

    <c:choose>
        <c:when test="${sessionScope.open == 1}">
            <div class="alert alert-success ">Application for new year is <strong>open</strong> now! Click <a href="Apply?apply=true">here</a> to apply.</div>     
        </c:when>
        <c:when test="${sessionScope.open == 0}">
            <div class="container ">
                <h2>
                    Current Application
                </h2>
                <table class="table table-responsive table-hover" >
                    <tr>
                        <th>Session</th>
                        <th>Block</th>
                        <th>Room No.</th>
                        <th>Room Type</th>
                        <th>Price/Day</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr> 
                    <c:choose>
                        <c:when test="${not empty applications}">
                            <c:forEach items="${sessionScope.applications}" var="currentApp" varStatus="loop">
                                <c:if test="${currentApp.getSession() == activeSession}">
                                    <tr>
                                        <td><c:out value="${currentApp.getSession()}" /></td>
                                        <td><c:out value="${currentApp.getBlock()}" /></td>
                                        <td><c:out value="${currentApp.getNumber()}" /></td>
                                        <td><c:out value="${currentApp.getRoomtype()}" /></td>   
                                        <td><c:out value="${currentApp.getPrice()}" /></td>
                                        <td><c:out value="${currentApp.getPrice() * 130}" /></td>

                                        <c:choose>
                                            <c:when test="${currentApp.getStatus() == 0}">
                                                <td>Pending</td>
                                            </c:when>
                                            <c:when test="${currentApp.getStatus() == 1}">
                                                <td>Approved</td>
                                            </c:when>
                                            <c:when test="${currentApp.getStatus() == 2}">
                                                <td>Cancelled</td>
                                            </c:when>
                                            <c:when test="${currentApp.getStatus() == 3}">
                                                <td>Rejected</td>
                                            </c:when>
                                        </c:choose>

                                        <c:url value="Apply" var="cancelApplicationURL">
                                            <c:param name="session"   value="${currentApp.getSession()}" />
                                        </c:url>
                                        <td><button class="btn btn-danger cancel" data-toggle="modal" data-target="#cancel" data-cancel="<c:out value='${cancelApplicationURL}' />" data-toggle="modal" data-target="#cancel">Cancel</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="7" class="text-center">No application.<td>
                            </tr>
                        </c:otherwise>

                    </c:choose>

                </table>
            </div>
        </c:when>
    </c:choose>


    <div class="container" id="roomHistroy">
        <div class="page-header">
            <h2 class="clickable-header" data-toggle="tooltip" title="Click to show more." style="cursor:pointer;">
                Room History
                <span style="font-size:20px;" class="glyphicon glyphicon-chevron-down">
            </h2>
        </div>
        <table class="table table-responsive table-hover" style="display:none;">
            <tr>
                <th>Session</th>
                <th>Block</th>
                <th>Room No.</th>
                <th>Room Type</th>
                <th>Price/Day</th>
                <th>Total</th>
            </tr> 
            <c:forEach items="${sessionScope.applications}" var="currentApp" varStatus="loop">
                <c:if test="${currentApp.getSession() != activeSession}">
                    <tr>
                        <td><c:out value="${currentApp.getSession()}" /></td>
                        <td><c:out value="${currentApp.getBlock()}" /></td>
                        <td><c:out value="${currentApp.getNumber()}" /></td>
                        <td><c:out value="${currentApp.getRoomtype()}" /></td>
                        <td><c:out value="${currentApp.getPrice()}" /></td>
                        <td><c:out value="${currentApp.getPrice() * 130}" /></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>
</div>

<!--Modal for Confirm Cancel-->

<div id="cancel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-danger">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                <h4 class="modal-title" id="myModalLabel">Confirm cancel</h4>
            </div>
            <div class="modal-body">  
                <p>Are you sure you want to cancel application?</p>
            </div>
            <div class="modal-footer ">
                <a id="url" href=""><button class="btn btn-default">Yes </button></a>
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>

            </div>
        </div>
    </div>
</div>
<!--END Modal for Confirm Cancel-->
<%@include file="footer.jsp" %>
<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
        $("h2.clickable-header").click(function () {
            if ($(this).children("span").attr("class") === "glyphicon glyphicon-chevron-down") {
                $(this).parents(".container").children("table").slideDown("slow");
                $(this).children("span").removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
            } else {
                $(this).parents(".container").children("table").slideUp("slow");
                $(this).children("span").removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
            }
        });

        $(".cancel").on("click",function(){
            var url = $(this).data("cancel");               
            $("#url").attr("href",url);
        

        });
    });
</script>