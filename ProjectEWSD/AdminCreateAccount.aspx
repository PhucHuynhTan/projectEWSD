<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AdminCreateAccount.aspx.cs" Inherits="ProjectEWSD.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="content">
                    <div class="register-box">
                        <div class="register-logo">
                            <h3>Register Member</h3>
                            <a href="#"><b><h3>Course Monitoring Reports</h3></b><b>CMR</b></a>
                        </div>
                        
                        <div class="register-box-body">
                                <div><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Empty.Import data please!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                  </div>
                                <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" placeholder="ID" runat="server" ID="txtUser" />
                                    <span class="glyphicon glyphicon-user form-control-register">
                                      </span>
                                </div>
                                <div><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Empty.Import data please!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                <div class="form-group has-feedback">
                                    <asp:TextBox TextMode="Password" class="form-control" placeholder="Password" runat="server" ID="txtPass" />
                                    <span class="glyphicon glyphicon-lock form-control-register">
                                    </span>
                                </div>
                                <div><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFullname" ErrorMessage="Empty.Import data please!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    
                                </div>
                                 <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" placeholder="Fullname"  runat="server" ID="txtFullname" />
                                    <span class="glyphicon glyphicon-lock form-control-register">
                                      
                                      </span>
                                </div>
                                <div><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Empty.Import data please!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Syntax Error!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>    
                                </div>
                                 <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" placeholder="E-mail"  runat="server" ID="txtEmail" />
                                    <span class="glyphicon glyphicon-lock form-control-register">
                                      </span>
                                </div>
                                <div> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAge" ErrorMessage="Empty.Import data please!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtAge" ErrorMessage="Age must than 18" ForeColor="Red" MaximumValue="90" MinimumValue="18" Display="Dynamic"></asp:RangeValidator>
                                     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Error.Must be imput number!" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtAge" Display="Dynamic"></asp:CompareValidator>
                                     
                                </div>
                                 <div class="form-group has-feedback">
                                    <asp:TextBox  class="form-control" placeholder="Age"  runat="server" ID="txtAge" />
                                    <span class="glyphicon glyphicon-lock form-control-register">
                                     </span>
                                </div>
                                 
                                <div class="form-group has-feedback">
                                    <asp:DropDownList ID="cmbPosition" class="form-control" runat="server">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                        <asp:ListItem Value="PVC">Pro-Vice Chancellor (PVC)</asp:ListItem>
                                        <asp:ListItem Value="DLT">Director of Learning and Quality (DLT)</asp:ListItem>
                                        <asp:ListItem Value="CL">Course Leader (CL) </asp:ListItem>
                                        <asp:ListItem Value="CM">Course Moderator (CM) </asp:ListItem>
                                        <asp:ListItem Value="Teacher">Teacher</asp:ListItem>
                                        <asp:ListItem Value="Guest">Guest</asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                <div class="row">
                                    <div class="col-xs-8">
                                        <asp:Button Text="Register" ID="btRegister" class="btn btn-primary btn-block btn-flat" runat="server" OnClick="btRegister_Click" />
                                        
                                    </div>
                                    <!-- /.col -->
                                </div>

                        </div>
                        <!-- /.form-box -->
                    </div>
                </section>
</asp:Content>
