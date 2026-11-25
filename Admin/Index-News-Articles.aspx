<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-News-Articles.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-md-5">
        <div class="card p-4 shadow">
            <h4>News & Articles</h4>
            <div class="mb-2">
                <label>BlogImage</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                <asp:Image ID="BlogImage" runat="server" Height="100" Width="100" />
            </div>
            <div class="mb-2">
                <label>AuthorName</label>
                <asp:TextBox ID="TxtAuthorName" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>PublishDate</label>
                <asp:TextBox ID="TxtPublishDate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Title</label>
                <asp:TextBox ID="TxtTitle" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Comments Count</label>
                <asp:TextBox ID="TxtCommentsCount" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label>Display Order</label>
                <asp:TextBox ID="TxtDisplayOrder" runat="server" CssClass="form-control"  />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdate_Click" Visible="false" />
            <asp:Label ID="lblBlogID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
        </div>
    </div>
    <div class="col-12">
        <div class="card p-4 shadow">
            <h4>News & Articles List</h4>
            <asp:ListView ID="NewsArticlesListView" runat="server" OnItemCommand="NewsArticlesListView_ItemCommand" OnItemDeleting="NewsArticlesListView_ItemDeleting" OnItemEditing="NewsArticlesListView_ItemEditing">
                <LayoutTemplate>
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>AuthorName</th>
                                <th>PublishDate</th>
                                <th>Title</th>
                                <th>CommentsCount</th>
                                <th>DisplayOrder</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                        </tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblBlogID" runat="server" Text='<%# Eval("BlogID") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblBlogImage" runat="server" Text='<%# Eval("BlogImage") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblAuthorName" runat="server" Text='<%# Eval("AuthorName") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblPublishDate" runat="server" Text='<%# Eval("PublishDate") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblCommentsCount" runat="server" Text='<%# Eval("CommentsCount") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDisplayOrder" runat="server" Text='<%# Eval("DisplayOrder") %>' Visible="false"></asp:Label>
                    <tr>
                        <td><%# Eval("BlogID") %></td>
                        <td><img src='img/Blog/<%# Eval("BlogImage") %>' width="50" /></td>
                        <td><%# Eval("AuthorName") %></td>
                        <td>$<%# Eval("PublishDate") %></td>
                        <td>$<%# Eval("Title") %></td>
                        <td><%# Eval("CommentsCount") %></td>
                        <td><%# Eval("DisplayOrder") %></td>

                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("BlogID") %>' CssClass="btn btn-sm btn-warning">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("BlogID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete?');">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>

