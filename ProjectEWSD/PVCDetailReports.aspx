<%@ Page Language="C#"  MasterPageFile="~/PVCMasterPage.Master" AutoEventWireup="true" CodeBehind="PVCDetailReports.aspx.cs" Inherits="ProjectEWSD.ViewDetailExceptionReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <form id="form1" runat="server">
     <div class="content-wrapper"> 
     <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1><b>View Reports</b></h1>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="box box-default">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Title Reports:</label>
                                        <b><asp:TextBox runat="server" ID="txtTitle" class="form-control" ReadOnly="true"/></b>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Date of Report:</label>  
                                        <b><asp:TextBox runat="server" ID="txtDate" class="form-control" ReadOnly="true"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label>From Email:</label>  
                                        <b><asp:TextBox runat="server" ID="txtemal" ReadOnly="true" class="form-control"/></b>
                                    </div>
                                    <div class="form-group">
                                        <label>Comment :</label>  
                                        <b><asp:TextBox runat="server" ID="txtComment" class="form-control"/></b>
                                    </div>
                                    <!-- /.form group -->
                                </div>
                                <!-- /.col -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Content Reposts :</label>
                                        <asp:TextBox TextMode="MultiLine" Height="200px" runat="server" ID="txtContent" class="form-control editor" ReadOnly="true" placeholder="Enter ..."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                   <asp:LinkButton CssClass="btn btn-block btn-social btn-dropbox"  runat="server" Text="Accept" ID="btCheck" OnClick="btCheck_Click" />
                                    
                                    <!-- /.form group -->
                                </div>
                                 <div class="col-md-4">
                                   <asp:LinkButton CssClass="btn btn-block btn-social btn-dropbox"  runat="server"  Text="Recheck" ID="btRechec" OnClick="btRechec_Click" />
                                    
                                    <!-- /.form group -->
                                </div>
                                <div class="col-md-4">
                                       <asp:LinkButton CssClass="btn btn-block btn-social btn-dropbox" runat="server" Text="Cancel" ID="btCancel" OnClick="btCancel_Click" />
                                    <!-- /.form group -->
                                </div>
                                <!-- /.col-->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.box-body -->

                </section>
                <!-- /.content -->
            </div>
        </form>
</asp:Content>
