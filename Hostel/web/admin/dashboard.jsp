<%-- 
    Document   : dashboard.jsp
    Created on : Dec 22, 2016, 4:59:50 PM
    Author     : Ray
--%>

<%@include file="../header.jsp"%>
<div class="container-fluid">
    <div class="row" id="application">

        <div class="col-md-5 " id="applicationlist" style="height:530px;">
            <h3>Application list</h3>
            <table class="table table-responsive table-hover" >
                <tr>
                    <th>No.</th>
                    <th>Name.</th>
                    <th>Matric No.</th>
                    <th>Block</th>
                    <th>Room </th>
                    <th>Type</th>
                    <th>Action</th>
                </tr> 
            </table>
        </div>

        <div class="col-md-4" id="studentwindow">
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
        <div class="col-md-4 full-screen" id="waitinglist">
            <h3>Waiting list</h3>
            <table class="table table-responsive table-hover" >
                <tr>
                    <th>No.</th>
                    <th>Name.</th>
                    <th>Matric No.</th>
                    <th>Block</th>
                    <th>Room </th>
                    <th>Type</th>
                    <th>Action</th>
                </tr> 
            </table>
        </div>       

    </div>
    
    <div class="row" id="room">
        <div class="col-md-6" id="roomlist">
            
        </div>
        
        <div class="col-md-6" id="roomtype">
            
        </div>
    </div>
</div>

