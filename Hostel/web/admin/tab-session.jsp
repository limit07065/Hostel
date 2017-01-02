<%-- 
    Document   : tab-session
    Created on : Jan 1, 2017, 7:05:27 PM
    Author     : User
--%>

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
                        <td colspan="4" style="text-align: center;">No Record</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${sessions}" var="currentSession" varStatus="loop">   
                        <tr>
                            <td><c:out value="${loop.index + 1}" /></td>
                            <td class="Name"><c:out value="${currentSession.getName()}" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${currentSession.getStatus() == 1}">
                                        <span class="glyphicon glyphicon-ok toggleStatus" style="color: green; cursor: pointer;"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="glyphicon glyphicon-remove toggleStatus" style="color: red; cursor: pointer;"></span>
                                    </c:otherwise>    
                                </c:choose>
                                <input type="hidden" name="id" id="id" value="${currentSession.getId()}">
                                <input type="hidden" name="status" id="status" value="${currentSession.getStatus()}">
                            </td>
                            <td>
                                <span class="glyphicon glyphicon-pencil editS" data-toggle="modal" data-target="#editSModal" style="cursor:pointer; color: blue;"></span>
                                &nbsp;
                                <span class="glyphicon glyphicon-trash deleteS" aria-hidden="true" style="color: red; cursor: pointer;"></span>
                                <input type="hidden" name="id" value="${currentSession.getId()}">
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    <!-- Modal -->
    <div class="modal fade" id="editSModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <form action="EditSession" method="post" id="EditSessionForm">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Session</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" id="id">
                        <div class="form-group row">
                            <label for="Name" class="col-xs-2 col-form-label">Name</label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" name="Name" id="Name">
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
