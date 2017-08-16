<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OpenAuthProviders.ascx.cs" Inherits="OpenAuthProviders" %>
	<h3>External Login</h3>
<div class="row" style="margin-top:30px; margin-bottom:30px;text-align:center">
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
           
                <%--<button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>"
                    title="Log in using your <%#: Item %> account.">
                    <%#: Item %>
                </button>--%>
              <%--<button type="submit" class="<%#: Item.ToLower() %>-mybutton mybutton" value="<%#: Item %>" name="provider">
                             <div class="<%#: Item.ToLower() %>-icon-box icon-box fa fa-<%#: Item.ToLower() %> " aria-hidden="true" style="line-height: 35px;" >   
                             </div>
                             <span aria-hidden="true"><%#: Item %></span>
                            <span class="sr" style="display:none">Sign in with <%#: Item %></span>
              </button>--%>
            
			
				<div style="width:33.33%; float:left; padding-left:15px; padding-right:15px;">
					<div class="col-md-3" style="padding:1px;">
						<img src="../../Content/img/<%#: Item.ToLower() %>.png" width="100%" />
					</div>
					<div class="col-md-9" style="padding:0">
						<button  id="<%#: Item.ToLower() %>" value="<%#: Item %>" name="provider" class="btn btn-default  <%#: Item.ToLower() %>-color" style="text-overflow:ellipsis; white-space: nowrap; overflow: hidden;"><%#: Item.ToLower() %></button>
					</div>
				</div>
				
			
                
           
        </ItemTemplate>
       
        
        <EmptyDataTemplate>
            <div>
                <p>There are no external authentication services configured. See <a href="http://go.microsoft.com/fwlink/?LinkId=252803">this article</a> for details on setting up this ASP.NET application to support logging in via external services.</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
    </div>