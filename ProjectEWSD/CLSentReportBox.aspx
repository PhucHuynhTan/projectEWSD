<%@ Page Title="" Language="C#" MasterPageFile="~/CLMasterPage.Master" AutoEventWireup="true" CodeBehind="CLSentReportBox.aspx.cs" Inherits="ProjectEWSD.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form id="form1" runat="server">
    <div class="content-wrapper">
            <section class="content-header">
                <h1>
            Report Box
            <small>advanced tables</small>
          </h1>
                <ol class="breadcrumb">
                    <li><a href="CLHomePage.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li>Report</li>
                    <li class="active">Report tables</li>
                </ol>
            </section>
                            <div class="box-body">
                                <table id="example1" class="table table-bordered table-striped">
                                        <tr><th></th>
                                            <th style="text-align:left">Select</th>
                                            <th style="text-align:left">To</th>
                                            <th style="text-align:left">Title</th>
                                            <th style="text-align:left">Status</th>
                                            <th style="text-align:left">From Date(s)</th>
                                            <th></th>
                                        </tr>
                                   
                                        <tr><asp:DataList runat="server" OnItemCommand="dlRP_ItemCommand" CssClass="table table-bordered table-striped" ID="dlRP">
                                        <ItemTemplate>
                                            <td style="width:210px" ><asp:CheckBox ID="ck1" runat="server" /></td>
                                             <td style="width:120px"><asp:Label ID="lblTo" runat="server" Text='<%# Eval("UserEmail") %>'></asp:Label></td>
                                            <td style="width:230px"><asp:Label ID="lbTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label></td>
                                            <td style="width:210px"><asp:Label ID="lbStatus" runat="server" Text='<%# Eval("StatusRP") %>'></asp:Label></td>
                                            <td style="width:210px"><asp:Label ID="lbDate" runat="server" Text='<%# Eval("DateRP") %>'></asp:Label></td>
                                            <td><asp:LinkButton CommandName="viewSentRP" ID="btChoice" runat="server" Text="View" /></td>
                                            <td style="width:230px"><asp:Label Visible="false" ID="lbID" runat="server" Text='<%# Eval("NumberID") %>'></asp:Label></td>
                                         </ItemTemplate>
                                   </asp:DataList>
                                            </tr>
                                </table>    
                            </div>
        </div>
          </form>
</asp:Content>
