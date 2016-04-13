<%@ Page Language="C#" MasterPageFile="~/DLTMasterPage.Master" AutoEventWireup="true" CodeBehind="DLTPage.aspx.cs" Inherits="ProjectEWSD.DLTPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="content-wrapper">
        <form runat="server">
            <!-- Content Header (Page header) -->
            <section class="content-header">
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- The time line -->

                        <!-- timeline time label -->
                        <li class="time-label">
                            <span class="bg-red">WARNING</span>
                        </li>
                        <!-- /.timeline-label -->
                        <!-- timeline item -->

                        <table align="center">
                            <div>
                                <asp:DataList OnItemCommand="dlM_ItemCommand" runat="server" CssClass="table table-bordered table-striped" ID="dlM">
                                    <ItemTemplate>
                                        <div class="timeline-item">
                                            <i class="fa fa-envelope bg-blue pull-left">
                                                <tr>
                                                    <td>
                                                        <span class="time pull-right"><i class="fa fa-calendar">
                                                            </i>
                                                            <asp:Label CssClass="time" ID="labeldate1" runat="server" Text='<%# Eval("DateRP") %>'></asp:Label>
                                                        </span>

                                                    </td>
                                                </tr>
                                            </i>
                                        </div>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="timeline-header text-blue pull-left" ID="labelEmail" runat="server" Text='<%# Eval("UserEmail") %>' />
                                                 <br />
                                                <asp:Label CssClass="timeline-header text-black pull-left" Text="Waitting to Accept !" runat="server" />
                                              

                                            </td>
                                        </tr>
                                        <tr>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="timeline-footer">
                                                    <div class="timeline-body" style="width: 937px">
                                                        <asp:Label CssClass="timeline-body pull-left" ID="labelcontent1" runat="server" Text='<%# Eval("Title") %>'></asp:Label><asp:Label CssClass="timeline-body pull-left" Text="-" runat="server" /><asp:Label CssClass="timeline-body pull-left" ID="lbID" runat="server" Text='<%# Eval("NumberID") %>'></asp:Label>
                                                          <asp:Label Visible="false" Text='<%# Eval("IDWrite") %>' runat="server" ID="lbEmailFrom" />
                                                    </div>
                                                    <br />
                                                    <asp:LinkButton CssClass="text-blue pull-left" CommandName="readmore" ID="readmore" runat="server" Text="Read more..."></asp:LinkButton>

                                                </div>
                                            </td>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </table>

                        <!-- END timeline item -->
                        <!-- timeline item -->


                        <li class="time-label">
                            <span class="bg-green">PUBLIC
                            </span>
                        </li>
                        <!-- /.timeline-label -->
                        <!-- timeline item -->
                        <table align="center" style="width: 90%">
                            <td>

                                <div>

                                    <asp:DataList OnItemCommand="DataList1_ItemCommand" runat="server" CssClass="table table-bordered table-striped" ID="DataList1">

                                        <ItemTemplate>
                                            <div class="timeline-item pull-left">
                                                <i class="fa fa-envelope bg-blue"></i>
                                                <td>
                                                    <asp:Label runat="server" ID="id"></asp:Label>

                                                    <span class="time pull-right"><i class="fa fa-calendar"></i>
                                                        <asp:Label CssClass="time" ID="labeldate1" runat="server" Text='<%# Eval("DateRP") %>'></asp:Label>
                                                    </span>
                                            </div>
                                            </td>

								</tr>
                                  <tr>
                                      <td>
                                          <asp:Label CssClass="timeline-header text-blue pull-left" ID="labelEmail" runat="server" Text='<%# Eval("UserEmail") %>'></asp:Label></>
                                          <label class="pull-left">sent you an email </label>
                                      </td>
                                  </tr>
                                            <tr></tr>
                                            <tr>
                                                <td>
                                                    <div class="timeline-footer">
                                                        <div class="timeline-body" style="width: 937px">

                                                            <asp:Label CssClass="timeline-body pull-left" ID="labelcontent1" runat="server" Text='<%# Eval("Content") %>'></asp:Label><label class="pull-left">...</label>
                                                        </div>
                                                        <asp:LinkButton CssClass="text-blue pull-left" CommandName="readmore" ID="readmore" runat="server" Text="Read more"></asp:LinkButton>

                                                    </div>
                                                </td>
                                        </ItemTemplate>
                                    </asp:DataList>


                                </div>
                            </td>
                        </table>
                        <!-- END timeline item -->


                    </div>
                    <!-- /.col -->
                </div>

                <!-- /.row -->


            </section>
            <!-- /.content -->
        </form>
    </div>
   
</asp:Content>