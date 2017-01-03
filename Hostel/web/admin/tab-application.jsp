<%-- 
    Document   : tab-application
    Created on : Dec 31, 2016, 4:43:21 PM
    Author     : Ray
--%>

<div id="application" class="tab-pane fade in active">
    <div id="applicationlist" >
        <h3>
            Application <c:out value="${activeSession}" />

        </h3>
        <table id="tableapplication" class="table table-responsive table-hover tablesorter" cellspacing="0" width="100%" >
            <thead>
            <tr>
                <th>No.</th>
                <th>Name.</th>            
                <th>Block</th>
                <th>Room </th>
                <th>Type</th>
                <th>Apply Date</th>
                <th>Status</th>
                <th>Processed Date</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:set value="1" var="index" scope="page" />
            <c:choose>
                <c:when test="${not empty applications}">
                    <c:forEach items="${applications}" var="currentApp" varStatus="loop">
                        <c:if test="${currentApp.getStatus() != 2}">
                            <tr>
                                <td><c:out value="${index}" /></td>  <%-- Status == 2 is not output at here, have to use another variable as counter  --%>
                            <td class="student"  data-appId="${currentApp.getApplication_PK()}"><c:out value="${currentApp.getUsername()}" /></td>
                            <td><c:out value="${currentApp.getBlock()}" /></td>
                            <td><c:out value="${currentApp.getNumber()}" /></td>
                            <td><c:out value="${currentApp.getRoomtype()}" /></td>   
                            <td><c:out value="${currentApp.getApplyDate()}" /></td>


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
                                    <td style="color: red">Rejected</td>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${currentApp.getApprovedDate()!=null}">                                  
                                        <td><c:out value="${currentApp.getApprovedDate()}" /></td>
                                </c:when> 
                                <c:otherwise>
                                    <td></td>
                                </c:otherwise>
                            </c:choose>
                            <td>
                                <c:choose>
                                    <c:when test="${currentApp.getStatus() != 1}">
                                        <button class="approve btn btn-success" data-appId="${currentApp.getApplication_PK()}">Approve</button>
                                    </c:when>
                                    <c:when test="${currentApp.getStatus() != 3}">
                                        <button class="reject btn btn-danger" data-appId="${currentApp.getApplication_PK()}">Reject</button>
                                    </c:when>
                                </c:choose>
                            </td>
                            </tr>
                            <c:set var="index" value="${index + 1}" />
                        </c:if>
                        
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="7" class="text-center">No application.<td>
                    </tr>
                </c:otherwise>

            </c:choose>
        </tbody>
        </table>

    </div>

    <!--Modal for student window-->

    <div id="studentwindow" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header green">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body">
                    <div id="studentphoto" class="img-circle img-thumbnail img-circle img-modal">                
                    </div>
                    <label>Full Name</label><span id='studentname'></span>
                    <label>Matrix ID</label><span id='studentmatrixid'></span>
                    <label>Email</label><span id='studentemail'></span>
                    <label>Contact</label><span id='studentcontact'></span>

                </div>
                <div class="modal-footer ">
                    <button id="studentapprove" class="approve btn btn-success" data-appId="${currentApp.getApplication_PK()}">Approve</button>
                    <button id="studentreject" class="reject btn btn-danger" data-appId="${currentApp.getApplication_PK()}">Reject</button>

                </div>
            </div>
        </div>
    </div>
    <!--END Modal for student window-->                        
    

</div>


