
<%@ Page Title="" Language="C#" MasterPageFile="~/CLMasterPage.Master" AutoEventWireup="true" CodeBehind="CLCreateReport.aspx.cs" Inherits="ProjectEWSD.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1><b>Create New Reports</b></h1>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="box box-default">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Title Reports:</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="Empty.Imput Title Please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <b>
                                        <asp:TextBox runat="server" ID="txtTitle" class="form-control" /></b>
                                </div>
                                <div class="form-group">
                                    <label>To:</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtToEmail" ErrorMessage="Empty.Imput data please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <b>
                                        <asp:TextBox runat="server" ID="txtToEmail" class="form-control" /></b>
                                </div>
                                <div class="form-group">
                                    <label>Type of Report :</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="typeRP" ErrorMessage="Empty.Select Type Please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:DropDownList runat="server" class="form-control" ID="typeRP">
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
                                    <label>Content Reposts :</label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContent" ErrorMessage="Empty.Import Data Content please!" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox TextMode="MultiLine" Height="200px" runat="server" ID="txtContent" class="form-control editor" placeholder="Enter ..."></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:LinkButton CssClass="btn btn-block btn-social btn-dropbox" OnClick="btSendRP_Click" runat="server" Text="Send Reports" ID="btSendRP" />

                                <!-- /.form group -->
                            </div>
                            <div class="col-md-4">
                                <asp:LinkButton CssClass="btn btn-block btn-social btn-dropbox" OnClick="Page_Load" runat="server" Text="Cancel" ID="btCancel" />
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
