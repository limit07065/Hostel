<%-- 
    Document   : tab-application
    Created on : Dec 31, 2016, 4:43:21 PM
    Author     : Ray
--%>

<div id="application" class="tab-pane fade in active">
    <div id="applicationlist" >
        <h3>
            Application list 
            <c:forEach items="${sessions}" var="session" varStatus="loop" >
                <c:if test="${session.getStatus()==0}">
                      <c:out value="${session.getName()}"/>
                      
            </c:if>
        </c:forEach>
    </h3>
    <table class="table table-responsive table-hover" >
        <tr>
            <th>No.</th>
            <th>Name.</th>            
            <th>Block</th>
            <th>Room </th>
            <th>Type</th>
            <th>Apply Date</th>
            <th>Status</th>
            <th>Approved Date</th>
            <th>Action</th>
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
