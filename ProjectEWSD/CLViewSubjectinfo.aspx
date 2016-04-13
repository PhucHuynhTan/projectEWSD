<%@ Page Language="C#" MasterPageFile="~/CLMasterPage.Master" AutoEventWireup="true" CodeBehind="CLViewSubjectinfo.aspx.cs" Inherits="ProjectEWSD.CLViewSubjectinfo" %>

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
                                    <asp:TextBox  class="form-control" placeholder="Send to" runat="server" ID="txtSendto" />
                                    <span class="glyphicon glyphicon-user form-control-register">
                                      </span>
                                </div>
                               
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
                                        <asp:Button Text="Accept / Back" ID="btnCheck" class="btn btn-primary btn-block btn-flat col-xs-6" runat="server" OnClick="btnCheck_Click" />
                                        
                                    </div>
                                    <div class="col-xs-6">
                                        <asp:Button Text="Reject / View task" ID="btnRecheck" class="btn btn-primary btn-block btn-flat col-xs-6" runat="server" OnClick="btnRecheck_Click"/>
                                        
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
