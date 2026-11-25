<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-FeaturesList.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .Imagepath1 {
            width: 60px;
            height: auto;
            border-radius: 5px;
            background-color: #16C4E3;
        }
    </style>
    <%-- ------------------------- 3. FEATURES MANAGEMENT SECTION ------------------------- --%>
        <div class="col-12">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Features List</h4>

                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Icon-Path</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Color Class</th>
                            <th>Display Order</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="FeaturesListView" runat="server" OnItemCommand="FeaturesListView_ItemCommand" OnItemDeleting="FeaturesListView_ItemDeleting" OnItemEditing="FeaturesListView_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblFeatureId" runat="server" Text='<%# Eval("FeatureID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblIconPath1" runat="server" Text='<%# Eval("IconPath1") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblColorClass" runat="server" Text='<%# Eval("ColorClass") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDisplayOrder" runat="server" Text='<%# Eval("DisplayOrder") %>' Visible="false"></asp:Label>

                                <tr>
                                    <td><%# Eval("FeatureID") %></td>
                                    <td><img class="Imagepath1" src='<%# Eval("IconPath1") %>' /></td>
                                    <td><%# Eval("Title") %></td>
                                    <td><%# Eval("Description") %></td>
                                    <td><%# Eval("ColorClass") %></td>
                                    <td><%# Eval("DisplayOrder") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("FeatureID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this feature?');">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("FeatureID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
</asp:Content>

