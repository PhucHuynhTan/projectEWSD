<%@ Page Title="" Language="C#" MasterPageFile="~/CLMasterPage.Master" AutoEventWireup="true" CodeBehind="CLCreateSubjectRP.aspx.cs" Inherits="ProjectEWSD.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" id="form1">
      <div class="content-wrapper">
     <section class="content">
                    <div class="register-box">
                        <div class="register-logo">
                            <h3>Create course report</h3>
                            <a href="#"><b><h3>Course Monitoring Reports</h3></b><b>CMR</b></a>
                        </div>
                        
                        <div class="register-box-body">
                                <div class="form-group has-feedback">
                                    <asp:Label runat="server" Text="Send To CM :" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlSendTo" ErrorMessage="Empty.Import data please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:DropDownList class="form-control" runat="server" ID="ddlSendTo" />
                                  </div>
                                <div class="form-group has-feedback">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCMRkey" ErrorMessage="Empty.Import data please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:TextBox  class="form-control" placeholder="CMRkey" runat="server" ID="txtCMRkey" />
                                    
                                </div>
                                <div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtdatestart" ErrorMessage="Empty.Import data please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                <div class="form-group has-feedback">
                                      <asp:Label runat="server" Text="Start date :" />
                                    <asp:TextBox TextMode="Date" class="form-control" placeholder="Date Start" runat="server" ID="txtdatestart" />
                                </div>
                                <div>
                                    
                                </div>
                                 <div class="form-group has-feedback">
                                       <asp:Label runat="server" Text="Finish date :" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdateend" ErrorMessage="Empty.Import data please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:TextBox  class="form-control"  TextMode="Date" placeholder="Date End"  runat="server" ID="txtdateend" />
                                    
                                </div>
                                <div class="form-group has-feedback">
                                    <asp:Label runat="server" Text="Facultie :" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" InitialValue="0" ControlToValidate="ddFacultieID" ErrorMessage="Empty.Select data please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddFacultieID" class="form-control" runat="server" >
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                       
                                    </asp:DropDownList>
                                    </div>
                             <div class="form-group has-feedback">
                                  <asp:Label runat="server" Text="Specialize :" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="0" ControlToValidate="ddFacultieID" ErrorMessage="Empty.Select data please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                  
                                    <asp:DropDownList ID="ddSpecID" class="form-control" runat="server" >
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        
                                    </asp:DropDownList>
                                    </div>
                             <div class="form-group has-feedback">
                                 <asp:Label runat="server" Text="Lecturesr :" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" InitialValue="0" ControlToValidate="ddFacultieID" ErrorMessage="Empty.Select data please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                  <asp:DropDownList ID="ddTeachID" class="form-control" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                    
                                    </asp:DropDownList>
                                    </div>
                                <div class="row">
                                    <div class="col-xs-8">
                                        <asp:Button Text="Create course report" ID="btcreate" class="btn btn-primary btn-block btn-flat" runat="server" OnClick="btcreate_Click" />
                                    </div>
                                    <!-- /.col -->
                                </div>

                        </div>
                        <!-- /.form-box -->
                    </div>
                </section>
          </div>
        </form>
</asp:Content>
