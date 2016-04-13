<%@ Page Title="" Language="C#" MasterPageFile="~/CLMasterPage.Master" AutoEventWireup="true" CodeBehind="CLProfile.aspx.cs" Inherits="ProjectEWSD.WebForm16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <section class="content">
            <div class="row">
                <div class="col-md-6">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Edit Profile</h3>
                        </div>

                        <form id="form1" runat="server">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Old Password</label>
                                    <asp:TextBox runat="server" Text="" TextMode="Password" CssClass="form-control" ID="OldPass" />
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">New Password</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="Password" TextMode="Password" />
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Re-New Password</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="Comfirmpass" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button runat="server" type="submit" class="btn btn-primary" ID="btChange" OnClick="btChange_Click" Text="Change" />
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- About Me Box -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">About Me</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <strong><i class="fa fa-book margin-r-5"></i>Experences</strong>
                            <p class="text-muted">
                                B.S. in Computer Science from the University of Tennessee at Knoxville
                            </p>
                            <hr>
                            <strong><i class="fa fa-book margin-r-5"></i>Education</strong>
                            <p class="text-muted">
                                B.S. in Computer Science from the University of Tennessee at Knoxville
                            </p>

                            <hr>

                            <strong><i class="fa fa-map-marker margin-r-5"></i>Location</strong>
                            <p class="text-muted">Malibu, California</p>

                            <hr>

                            <strong><i class="fa fa-pencil margin-r-5"></i>Skills</strong>
                            <p>
                                <span class="label label-danger">UI Design</span>
                                <span class="label label-success">Coding</span>
                                <span class="label label-info">Javascript</span>
                                <span class="label label-warning">PHP</span>
                                <span class="label label-primary">Node.js</span>
                            </p>

                            <hr>

                            <strong><i class="fa fa-file-text-o margin-r-5"></i>Notes</strong>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
