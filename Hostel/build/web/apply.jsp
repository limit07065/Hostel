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
                </select>

                <div class=" row">
                    <div class=" col-md-6">
                        <label for="block"  >Block </label>
                        <select id="block" name="block" class="form-control">
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="room" >Room Number</label>
                        <select id="room" name="room" class="form-control">
                        </select>
                    </div>
                </div>
                <input type="submit" class="pull-right btn btn-success">


            </form>

        </div>
    </div>
</div>
</div>
<%@include file="footer.jsp" %>