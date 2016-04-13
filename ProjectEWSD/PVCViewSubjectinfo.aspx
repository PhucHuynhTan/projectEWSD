<%@ Page Title="" Language="C#" MasterPageFile="~/PVCMasterPage.Master" AutoEventWireup="true" CodeBehind="PVCViewSubjectinfo.aspx.cs" Inherits="ProjectEWSD.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" id="form1">
     <div class="content-wrapper">
     <section class="content">
                    <div class="register-box">
                        <div class="register-logo">
                            <h3>View Subject Information</h3>
                            <a href="#"><b><h3>Course Monitoring Reports</h3></b><b>CMR</b></a>
                        </div>
                        
                        <div class="register-box-body">
                                    
                                <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" ReadOnly="true" placeholder="CMR Key" runat="server" ID="txtCMRkey" />
                                 
                                </div>
                                
                                 <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" ReadOnly="true" placeholder="Start Date"  runat="server" ID="txtStartdate" />
                                
                                </div>
                               
                                 <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" ReadOnly="true" placeholder="Finish Date"  runat="server" ID="txtFinishdate" />
                                    
                                </div>
                             <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" ReadOnly="true" placeholder="Facultie"  runat="server" ID="txtFacultie" />
                                   
                                </div>
                             <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" ReadOnly="true" placeholder="Specialize"  runat="server" ID="txtSpecialize" />
                                   
                                </div>
                             <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" ReadOnly="true" placeholder="Lecturesr"  runat="server" ID="txtLecturesr" />
                                   
                                </div>
                                 <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" placeholder="Comment"  runat="server" ID="txtComment" />
                                   
                                </div>
                             <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" ReadOnly="true" placeholder="Status"  runat="server" ID="txtStatus" />
                                   
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <asp:Button Text="Accept" ID="btnCheck" class="btn btn-primary btn-block btn-flat col-xs-6" OnClick="btnCheck_Click" runat="server" />
                                        
                                    </div>
                                    <div class="col-xs-6">
                                        <asp:Button Text="Reject" ID="btnRecheck" class="btn btn-primary btn-block btn-flat col-xs-6" OnClick="btnRecheck_Click" runat="server"/>
                                        
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
