<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AdminCreateSF.aspx.cs" Inherits="ProjectEWSD.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
                    <div class="register-box">
                        <div class="register-logo">
                            <h3>Create Faculite / Specialize</h3>
                            <a href="#"><b><h3>Course Monitoring Reports</h3></b><b>CMR</b></a>
                        </div>
                        
                        <div class="register-box-body">
                                 <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" placeholder="ID Of Faculite / Specialize"  runat="server" ID="txtID" />
                                </div>
                                <div></div>
                                 <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" placeholder="Name Of Faculite / Specialize"  runat="server" ID="txtName" />
                                </div>
                                 
                                <div class="form-group has-feedback">
                                    <asp:DropDownList ID="cmbFS" class="form-control" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        <asp:ListItem Value="F">Faculite (F)</asp:ListItem>
                                        <asp:ListItem Value="S">Specialize (S)</asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                <div class="row">
                                    <div class="col-xs-8">
                                        <asp:Button Text="Add New" ID="btCreate" class="btn btn-primary btn-block btn-flat" runat="server" OnClick="btCreate_Click" />
                                    </div>
                                    <!-- /.col -->
                                </div>
                        </div>
                        <!-- /.form-box -->
                    </div>
                </section>
</asp:Content>
