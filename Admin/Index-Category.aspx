<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-Category.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>

    </style>
     <%-- ------------------------- 5. CATEGORIES MANAGEMENT SECTION ------------------------- --%>
    <div class="col-lg-6">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Add New Category</h4>

                <div class="form-group mb-2">
                    <label>Icon Path</label>
                    <asp:FileUpload ID="FileUpload4" runat="server" CssClass="form-control" />
                    <asp:Image ID="CateIconPath" runat="server" Height="100" Width="100" />
                </div>

                <div class="form-group mb-2">
                    <label>Title</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-3">
                    <label>Display Order</label>
                    <asp:TextBox ID="txtDisplayOrderC" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnSubmitC" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitC_Click" />
                <asp:Button ID="btnUpdateC" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateC_Click" Visible="false" />
                <asp:Label ID="lblCategoryID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
            </div>
        </div>
        <div class="col-12">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Categories List</h4>

                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Icon Path</th>
                            <th>Title</th>
                            <th>Display Order</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="CategoriesListView" runat="server" OnItemCommand="CategoriesListView_ItemCommand" OnItemDeleting="CategoriesListView_ItemDeleting" OnItemEditing="CategoriesListView_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblCategoryID" runat="server" Text='<%# Eval("CategoryID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblCateIconPath" runat="server" Text='<%# Eval("CateIconPath") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDisplayOrderC" runat="server" Text='<%# Eval("DisplayOrderC") %>' Visible="false"></asp:Label>

                                <tr>
                                    <td><%# Eval("CategoryID") %></td>
                                    <td><img src='img/categorySlider/<%# Eval("CateIconPath") %>' /></td>
                                    <td><%# Eval("Title") %></td>
                                    <td><%# Eval("DisplayOrderC") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("CategoryID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this category?');">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("CategoryID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
</asp:Content>

