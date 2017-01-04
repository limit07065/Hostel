<%-- 
    Document   : tab-report
    Created on : Jan 3, 2017, 9:37:53 PM
    Author     : User
--%>

<div id="report" class="tab-pane fade">
    <h3>
        Report for <c:out value="${activeSession}" />
    </h3>
    <div class="col-xs-12 col-md-4" style="padding-bottom: 10px;">
        <button type="button" class="btn btn-primary">Total Application :  <span class="badge"><c:out value="${totalApplication}" /></span></button>
    </div>
    <div class="col-xs-12 col-md-4" style="padding-bottom: 10px;">
        <button type="button" class="btn btn-success">Approved Application :  <span class="badge"><c:out value="${approvedApplication}" /></span></button>
    </div>
    <div class="col-xs-12 col-md-4" style="padding-bottom: 10px;">
        <button type="button" class="btn btn-danger">Rejected Application :  <span class="badge"><c:out value="${rejectedApplication}" /></span></button>
    </div>
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
                <td><c:out value="${occupiedSingleRoom}" /></td>
                <td><c:out value="${unoccupiedSingleRoom}" /></td>
                <td><c:out value="${occupiedSingleRoom + unoccupiedSingleRoom}" /></td>
            </tr>
            <tr>
                <td>Double</td>
                <td><c:out value="${occupiedDoubleRoom}" /></td>
                <td><c:out value="${unoccupiedDoubleRoom}" /></td>
                <td><c:out value="${occupiedDoubleRoom + unoccupiedDoubleRoom}" /></td>
            </tr>
            <tr>
                <td>Single With Bathroom</td>
                <td><c:out value="${occupiedSingleRoomWBathroom}" /></td>
                <td><c:out value="${unoccupiedSingleRoomWBathroom}" /></td>
                <td><c:out value="${occupiedSingleRoomWBathroom + unoccupiedSingleRoomWBathroom}" /></td>
            </tr>
        </tbody>
    </table>
</div>
