<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ConfirmationModalUC.ascx.cs" Inherits="UmrahComponents_ConfirmationModalUC" %>
<!-- Modal -->
<div class="modal fade" id="confirmationModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" onclick="CancelModel()" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h5 class="modal-title" id="myModalLabel"><%= ModalTitle %></h5>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-alert"></span>&nbsp;&nbsp;Are you sure you want to delete this record?</div>
            </div>
            <div class="modal-footer">

                <div class="btn-group" role="group" aria-label="...">
                    <button type="button" class="btn" style="background:#278ac1" onclick="executeCurrentCommand();">Yes</button>
                    <button type="button" class="btn" data-dismiss="modal" onclick="CancelModel()">No</button>
                </div>
            </div>
        </div>
    </div>
</div>