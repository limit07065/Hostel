<%-- 
    Document   : modals
    Created on : Jan 2, 2017, 10:22:31 PM
    Author     : Ray
--%>

<!--Modal for Confirm Delete-->

<div id="delete" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-danger">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                <h4 class="modal-title" id="myModalLabel">Confirm delete</h4>
            </div>
            <div class="modal-body">  
                <p id="deletecontent"></p>
            </div>
            <div class="modal-footer ">
                <a id="url" href=""><button id="yes" class="btn btn-default">Yes </button></a>
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>

            </div>
        </div>
    </div>
</div>
<!--END Modal for Confirm Delete-->


<!-- one line modal notification -->
<div id="message" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:100px">

        <div class="alert alert-success">
            <span><i class="fa fa-child"></i></span>&nbsp;<span id="messagecontent"></span>
        </div>      

    </div>
</div>
<!-- END one line modal notification -->
