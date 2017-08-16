<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Next_Previous.ascx.cs" Inherits="Components_LessonMenu_Next_Previous" %>
<div class="row" id="next_previous" style="display:none;">
    <div class="col-md-12">
        <div class="col-md-3">
            <button type="button" id="previous" class="btn btn-default next-previous" style="width: 100%" aria-label="Left Align">
                <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>Previous
            </button>
        </div>
        <div class="col-md-6"></div>
        <div class="col-md-3">
            <button type="button" class="btn btn-default next-previous" id="next" style="width: 100%" aria-label="Left Align">
                Next <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
            </button>
        </div>
    </div>
</div>
