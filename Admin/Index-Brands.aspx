<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-Brands.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-md-5">
        <div class="card p-4 shadow">
            <h4>Brands</h4>
            <div class="mb-2">
                <label>Image Path</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                <asp:Image ID="Brandimage" runat="server" Height="100" Width="100" />
            </div>
            <div class="mb-2">
                <label>DisplayOrder</label>
                <asp:TextBox ID="TxtDisplayOrder" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdate_Click" Visible="false" />
            <asp:Label ID="lblBrandID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
        </div>
    </div>
    <div class="col-12">
        <div class="card p-4 shadow">
            <h4>Products List</h4>
            <asp:ListView ID="BrandsListView" runat="server" OnItemCommand="BrandsListView_ItemCommand" OnItemDeleting="BrandsListView_ItemDeleting" OnItemEditing="BrandsListView_ItemEditing">
                <LayoutTemplate>
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
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
                    <asp:Label ID="lblBrandID" runat="server" Text='<%# Eval("BrandID") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblBrandimage" runat="server" Text='<%# Eval("Brandimage") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDisplayOrder" runat="server" Text='<%# Eval("DisplayOrder") %>' Visible="false"></asp:Label>
                    <tr>
                        <td><%# Eval("BrandID") %></td>
                        <td><img src='img/Brands/<%# Eval("Brandimage") %>' width="50" /></td>
                        <td><%# Eval("DisplayOrder") %></td>

                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("BrandID") %>' CssClass="btn btn-sm btn-warning">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("BrandID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete?');">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>

