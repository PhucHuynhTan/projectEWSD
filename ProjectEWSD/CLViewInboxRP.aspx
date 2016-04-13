<%@ Page Title="" Language="C#" MasterPageFile="~/CLMasterPage.Master" AutoEventWireup="true" CodeBehind="CLViewInboxRP.aspx.cs" Inherits="ProjectEWSD.WebForm9" %>

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
                                    <b>
                                        <asp:TextBox ReadOnly="true" runat="server" ID="txtTitle" CssClass="form-control" /></b>
                                </div>
                                <div class="form-group">
                                    <label>To:</label>
                                    <b>
                                        <asp:TextBox runat="server" ID="txtEmailSend" CssClass="form-control" /></b>
                                </div>
                                <div class="form-group">
                                    <label>Comment:</label>
                                    <b>
                                        <asp:TextBox runat="server" ID="txtComment" CssClass="form-control" /></b>
                                </div>
                                <div class="form-group">
                                    <label>Type of Report :</label>
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="typeRP">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="Exception">Exception Report</asp:ListItem>
                                        <asp:ListItem Value="Static">Static Report</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <!-- /.form group -->
                            </div>
                            <!-- /.col -->
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Content Reposts :</label>
                                    <asp:TextBox TextMode="MultiLine" Height="200px" runat="server" ID="txtContent" CssClass="form-control editor" placeholder="Enter ..."></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:LinkButton CssClass="btn btn-block btn-social btn-dropbox" OnClick="btAccept_Click" runat="server" Text="Accept" ID="btAccept" />
                            </div>
                            <div class="col-md-4">
                                <asp:LinkButton CssClass="btn btn-block btn-social btn-dropbox" runat="server" Text="Reject / Delete" ID="btNonAccept" OnClick="btNonAccept_Click" />
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
