<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-Banner.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .Imagepath {
            width: 60px;
            height: auto;
            border-radius: 5px;
        }
    </style>
    <%-- ------------------------- 2. BANNERS MANAGEMENT SECTION ------------------------- --%>
   <!-- Banner2 Section -->
        <div class="col-lg-6">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Add New Banner</h4>

                <div class="form-group mb-2">
                    <label>Image Path</label>
                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                    <asp:Image ID="Bannerimage" runat="server" Height="100" Width="100" />
                </div>

                <div class="form-group mb-2">
                    <label>Head 1</label>
                    <asp:TextBox ID="txtHead1" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Head2</label>
                    <asp:TextBox ID="txtHead2" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Link URL</label>
                    <asp:TextBox ID="txtLinkUrl2" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-3">
                    <label>Display Order</label>
                    <asp:TextBox ID="txtDisplayOrder2" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnSubmitB" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitB_Click" />
                <asp:Button ID="btnUpdateB" runat="server" Text="UpdateB" CssClass="btn btn-secondary" OnClick="btnUpdateB_Click" Visible="false" />
                <asp:Label ID="lblBannerID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
            </div>
        </div>

    <!--  Right Column Banner List -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Banner List</h4>
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Image Path</th>
                            <th>Head1</th>
                            <th>Head2</th>
                            <th>LinkURL2</th>
                            <th>DisplayOrder2</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="BannerListView" runat="server" OnItemCommand="BannerListView_ItemCommand" OnItemDeleting="BannerListView_ItemDeleting" OnItemEditing="BannerListView_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblBannerID" runat="server" Text='<%# Eval("BannerID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblBannerimage" runat="server" Text='<%# Eval("Bannerimage") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblHead1" runat="server" Text='<%# Eval("Head1") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblHead2" runat="server" Text='<%# Eval("Head2") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblLinkUrl2" runat="server" Text='<%# Eval("LinkUrl2") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDisplayOrder2" runat="server" Text='<%# Eval("DisplayOrder2") %>' Visible="false"></asp:Label>

                                <tr>
                                    <td><%# Eval("BannerID") %></td>
                                    <td><img class="Imagepath" src='img/Banner/<%# Eval("Bannerimage") %>' /></td>
                                    <td><%# Eval("Head1") %></td>
                                    <td><%# Eval("Head2") %></td>
                                    <td><%# Eval("LinkUrl2") %></td>
                                    <td><%# Eval("DisplayOrder2") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkDelete2" runat="server" CommandName="delete" CommandArgument='<%# Eval("BannerID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this banner2?');">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="lnkEdit2" runat="server" CommandName="edit" CommandArgument='<%# Eval("BannerID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

