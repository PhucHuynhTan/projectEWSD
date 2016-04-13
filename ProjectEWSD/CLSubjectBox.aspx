<%@ Page Title="" Language="C#" MasterPageFile="~/CLMasterPage.Master" AutoEventWireup="true" CodeBehind="CLSubjectBox.aspx.cs" Inherits="ProjectEWSD.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" id="form1">
        <div class="content-wrapper">
            <section class="content-header">
                <h1>Subject Report Box
            <small>advanced tables</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="CLHomePage.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                    <li>Messeage</li>
                    <li class="active">Messeage tables</li>
                </ol>
            </section>
            <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                    <tbody>
                        <tr>
                            <th style="text-align: left">Select</th>
                            <th style="text-align: left">CMR Key</th>
                            <th style="text-align: left">Status</th>
                            <th style="text-align: left">From Date(s)</th>
                            <th></th>
                        </tr>
                        <tr>
                            <asp:DataList runat="server" OnItemCommand="dtCMR_ItemCommand" CssClass="table table-bordered table-striped" ID="dtCMR">
                                <ItemTemplate>
                                    <td style="width: 80px">
                                        <asp:CheckBox ID="ck1" runat="server" /></td>
                                    <td style="width: 280px">
                                        <asp:Label ID="lbCmrKey" runat="server" Text='<%# Eval("CMRKey") %>'></asp:Label></td>
                                    <td style="width: 240px">
                                        <asp:Label ID="lbDate" runat="server" Text='<%# Eval("StatusCMR") %>'></asp:Label></td>
                                    <td style="width: 210px">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("StartDate") %>'></asp:Label></td>
                                    <td>
                                        <asp:LinkButton CommandName="viewCMR" ID="btChoice"  runat="server" Text="View" /></td>
                                </ItemTemplate>
                            </asp:DataList>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <br />
                                <div class="col-md-4">
                                    <asp:Button Width="310px" CssClass="btn btn-block btn-social btn-dropbox" runat="server" Text="Create Subject Report / Accept All" OnClick="brCreateRP_Click" ID="brCreateRP" />
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</asp:Content>
