<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CSSStyler.ascx.cs" Inherits="Components_PageTemplate_CSSStyler" %>
<input type="hidden" id="style-holder" />
<input type="hidden" id="class-holder" />
<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#ccsss" aria-controls="ccsss" role="tab" data-toggle="tab">Custom CSS Styles</a></li>
    <li role="presentation"><a href="#stylecss" aria-controls="stylecss" role="tab" data-toggle="tab">style.css</a></li>
</ul>
<div class="tab-content" style="background-color: white;">
    <div role="tabpanel" class="tab-pane active" id="ccsss">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="width: 100%">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#padding-margin" aria-expanded="true" aria-controls="padding-margin">Padding and Margins
        </a>
                    </h4>
                </div>
                <div id="padding-margin" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <div class="col-md-12" style="padding: 0;">
                            <div class="col-md-6">
                                <h5>Margin</h5>
                                <input id="slider-margin" type="range" value="0" min="0" max="100" step="5" />
                                <div class="col-md-6" style="padding: 15px;">
                                    <input type="text" id="top-margin" placeholder="Top" data-attribute="margin-top" class="form-control css-input" />
                                </div>
                                <div class="col-md-6" style="padding: 15px;">
                                    <input type="text" id="right-margin" placeholder="Right" data-attribute="margin-right" class="form-control css-input" />
                                </div>
                                <div class="col-md-6" style="padding: 15px;">
                                    <input type="text" id="bottom-margin" placeholder="Bottom" data-attribute="margin-bottom" class="form-control css-input" />
                                </div>
                                <div class="col-md-6" style="padding: 15px;">
                                    <input type="text" id="left-margin" placeholder="Left" data-attribute="margin-left" class="form-control css-input" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h5>Padding</h5>
                                <input id="slider-padding" type="range" value="0" min="0" max="100" step="5" />
                                <div class="col-md-6" style="padding: 15px;">
                                    <input type="text" id="top-padding" placeholder="Top" data-attribute="padding-top" class="form-control css-input" />
                                </div>
                                <div class="col-md-6" style="padding: 15px;">
                                    <input type="text" id="right-padding" placeholder="Right" data-attribute="padding-right" class="form-control css-input" />
                                </div>
                                <div class="col-md-6" style="padding: 15px;">
                                    <input type="text" id="bottom-padding" placeholder="Bottom" data-attribute="padding-bottom" class="form-control css-input" />
                                </div>
                                <div class="col-md-6" style="padding: 15px;">
                                    <input type="text" id="left-padding" placeholder="Left" data-attribute="padding-left" class="form-control css-input" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#cssColors" aria-expanded="false" aria-controls="cssColors">Border, Background and Font Color
        </a>
                    </h4>
                </div>
                <div id="cssColors" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <div class="col-md-6">
                            <h5>Background Color</h5>
                            <input type="color" id="bg-color" />
                            <input type="text" id="bg-color-code" data-attribute="background-color" class="css-input" />
                            <h5>Border Color</h5>
                            <input type="color" id="border-color" />
                            <input type="text" id="border-color-code" data-attribute="border-color" class="css-input" />
                        </div>
                        <div class="col-md-6">
                            <h5>Font Color</h5>
                            <input type="color" id="font-color" />
                            <input type="text" id="font-color-code" data-attribute="color" class="css-input" />
                            <h5>Font Size</h5>
                            <input type="range" id="font-size" min="8" max="48" step="1" value="8" />
                            <input type="text" id="font-size-value" data-attribute="font-size" class="css-input" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6" style="padding: 0">
                <h4>Custom Style</h4>
                <textarea id="css-string" class="form-control"></textarea>
            </div>
            <div class="col-md-6" style="padding: 0">
                <h4>Custom Class</h4>
                <textarea id="css-class-string" class="form-control"></textarea>
            </div>

        </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="stylecss">
        <div class="col-md-12" style="margin-top:30px;">
                <a href="~/Components/PageTemplate/Style" runat="server" class="btn btn-primary" target="_blank">Click here to Edit the Style.css File</a>
        </div>
    </div>
</div>

