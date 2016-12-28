<%-- 
    Document   : dashboard.jsp
    Created on : Dec 22, 2016, 4:59:50 PM
    Author     : Ray
--%>


<link href="../css/bootstrap.min.css" rel="stylesheet">
<%@include file="../header.jsp"%>
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
                    <tr>
                        <c:choose>
                            <c:when test="${$application}">
                                
                            </c:when>
                            <c:when test="${application ==null}">
                                <td colspan="7">No Record</td>
                            </c:when>
                                
                        </c:choose>
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

       

    </div>
    
  
    <div class="col-md-3">
    <h4>Menu</h4>
    <ul class="nav nav-pills nav-stacked">
        <li class="active"><a data-toggle="pill" href="#application">Application</a></li>
        <li><a data-toggle="pill" href="#room">Room</a></li>
        <li><a data-toggle="pill" href="#roomtype">Room Type</a></li>
        
        <li><a data-toggle="pill" href="#session">Session</a></li>  
    </ul>
</div>
</div>
<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>

