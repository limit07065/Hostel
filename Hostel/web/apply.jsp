<%-- 
    Document   : index
    Created on : Dec 21, 2016, 4:11:00 PM
    Author     : Ray
--%>
<%@include file="header.jsp" %>
<div class="container-fluid">
    <div class="row hostelbg">
        <div class="col-md-5 col-md-offset-1">
            <blockquote id ="index-quote" >
                <h2>Kolej Tun Dr Ismail</h2>
                <p>Kita sama-sama Naik! <br>
                    <cite class="pull-right">JKM KTDI 2014</cite></p>
            </blockquote>

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
<div class="container-fluid" id="roomtypegallery">
    <div class="row">
        <div class="col-md-3 gallery-tile" >
            <img class="img-responsive" alt="x"/>
        </div>
        <div class="col-md-3 gallery-tile" >

        </div>
        <div class="col-md-3 gallery-tile" >
            <img class="img-responsive" alt="x"/>
        </div>
        <div class="col-md-3 gallery-tile" >

        </div>        
    </div>
    <div class="row">
        <div class="col-md-3 gallery-tile" >
            
        </div>
        <div class="col-md-3 gallery-tile" >
<img class="img-responsive" alt="x"/>
        </div>
        <div class="col-md-3 gallery-tile" >
            
        </div>
        <div class="col-md-3 gallery-tile" >
<img class="img-responsive" alt="x"/>
        </div>        
    </div>

</div>
</div>
<%@include file="footer.jsp" %>