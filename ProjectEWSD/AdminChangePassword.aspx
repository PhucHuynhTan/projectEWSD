<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminChangePassword.aspx.cs" Inherits="ProjectEWSD.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="content">
                    <div class="register-box">
                        <div class="register-logo">
                            <h3>Create course report</h3>
                            <a href="#"><b><h3>Course Monitoring Reports</h3></b><b>CMR</b></a>
                        </div>
                        
                        <div class="register-box-body">
                                <div>
                                  </div>
                                <div class="form-group has-feedback">
                                    <asp:TextBox  TextMode="Password" class="form-control" placeholder="Old Password" runat="server" ID="txtoldpass" />
                                    <span class="glyphicon glyphicon-user form-control-feedback">
                                      </span>
                                </div>
                                <div>
                                    </div>
                                <div class="form-group has-feedback">
                                    <asp:TextBox TextMode="Password" class="form-control" placeholder="New password" runat="server" ID="txtpass" />
                                    <span class="glyphicon glyphicon-lock form-control-feedback">
                                    </span>
                                </div>
                                <div>
                                    
                                </div>
                                 <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control"  TextMode="Password" placeholder="ComfimPassword"  runat="server" ID="txtcfpass" />
                                    <span class="glyphicon glyphicon-lock form-control-feedback">
                                      
                                      </span>
                                </div>
                                 
                             
                                <div class="row">
                                    <div class="col-xs-8">
                                        <asp:Button Text="Change Password" ID="btchangepass" class="btn btn-primary btn-block btn-flat" runat="server" OnClick="btcreate_Click" />
                                    </div>
                                    <!-- /.col -->
                                </div>

                        </div>
                        <!-- /.form-box -->
                    </div>
                </section>
</asp:Content>

