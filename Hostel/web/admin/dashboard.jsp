<%-- 
    Document   : dashboard.jsp
    Created on : Dec 22, 2016, 4:59:50 PM
    Author     : Ray
--%>


<link href="../css/bootstrap.min.css" rel="stylesheet">
<%@include file="header.jsp"%>
<div class="container-fluid" style="margin-top:70px;">
    <div class="col-md-9 tab-content">
        <div id="application" class="tab-pane fade in active">
            <div class="col-md-6" id="applicationlist" style="height:530px;">
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
            <div class="col-md-6 full-screen" id="waitinglist">
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
        <div id="room" class="tab-pane fade">
            <!--This is for the things inside second menu-->
            <h3>GG</h3>
        </div>
        <div id="roomtype" class="tab-pane fade">
            <!--This is for the things inside third menu-->
            <h3>ab</h3>
        </div>
        <div id="session" class="tab-pane fade">
            <!--This is for the things inside forth menu-->
            <h3>cd</h3>
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
    <%@include file="sidebar.jsp"%>
</div>
<%@include file="footer.jsp"%>

