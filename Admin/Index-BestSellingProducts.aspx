<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-BestSellingProducts.aspx.cs" Inherits="Admin_Default" %>

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
    <%-- ------------------------- 9. BestSellingProducts View all MANAGEMENT SECTION ------------------------- --%>
    <div class="row">
    <div class="col-md-6">
        <div class="card shadow p-4">
            <h4>Best Selling Product</h4>
            <div class="mb-2">
                <label>Image</label>
                <asp:FileUpload ID="FileUpload8" runat="server" CssClass="form-control" />
                <asp:Image ID="BestSellingimage" runat="server"  Height="100" Width="100" />
            </div>
            <div class="mb-2">
                <label>Title</label>
                <asp:TextBox ID="TxtTitleBS" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Current Price</label>
                <asp:TextBox ID="TxtCurrentPriceBS" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Original Price (Optional)</label>
                <asp:TextBox ID="TxtOriginalPriceBS" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label>LinkUrl</label>
                <asp:TextBox ID="TxtLinkUrlBS" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label>Display Order</label>
                <asp:TextBox ID="TxtDisplayOrderBS" runat="server" CssClass="form-control" />
            </div>

            <asp:Button ID="btnSubmitBS" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmitBS_Click" />
            <asp:Button ID="btnUpdateBS" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateBS_Click" Visible="false" />
            <asp:Label ID="lblBestSellingProductID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>

        </div>
    </div>
        <div class="col-md-6">
        <div class="card shadow p-4">
            <h4>Best Selling Product2</h4>
            <div class="mb-2">
                <label>Image2</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                <asp:Image ID="BestSellingimage2" runat="server"  Height="100" Width="100" />
            </div>
            <div class="mb-2">
                <label>Title2</label>
                <asp:TextBox ID="TxtTitleBS2" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Current Price2</label>
                <asp:TextBox ID="TxtCurrentPriceBS2" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Original Price2 (Optional)</label>
                <asp:TextBox ID="TxtOriginalPriceBS2" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label>LinkUrl2</label>
                <asp:TextBox ID="TxtLinkUrlBS2" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label>Display Order2</label>
                <asp:TextBox ID="TxtDisplayOrderBS2" runat="server" CssClass="form-control" />
            </div>

            <asp:Button ID="btnSubmitBS2" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmitBS2_Click" />
            <asp:Button ID="btnUpdateBS2" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateBS2_Click" Visible="false" />
            <asp:Label ID="lblBestSellingProduct2ID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>

        </div>
    </div>

        </div>

    <div class="col-12">
        <div class="card p-4 shadow">
            <h4>Products List</h4>
            <asp:ListView ID="BestSellingProductListView" runat="server" OnItemCommand="BestSellingProducts_ItemCommand" OnItemDeleting="BestSellingProducts_ItemDeleting" OnItemEditing="BestSellingProducts_ItemEditing" >
                <LayoutTemplate>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>Current Price</th>
                                <th>Original Price</th>
                                <th>LinkUrl</th>
                                <th>Display Order</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblBestSellingProductID" runat="server" Text='<%# Eval("BestSellingProductID") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblBestSellingimage" runat="server" Text='<%# Eval("BestSellingimage") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblTitleBS" runat="server" Text='<%# Eval("TitleBS") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblCurrentPriceBS" runat="server" Text='<%# Eval("CurrentPriceBS") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblOriginalPriceBS" runat="server" Text='<%# Eval("OriginalPriceBS") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblLinkUrlBS" runat="server" Text='<%# Eval("LinkUrlBS") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblDisplayOrderBS" runat="server" Text='<%# Eval("DisplayOrderBS") %>' Visible="false"></asp:Label>
                    <tr>
                        <td><%# Eval("BestSellingProductID") %></td>
                        <td> <img class="Imagepath" src='img/BSELLP/<%# Eval("BestSellingimage") %>' /></td>
                        <td><%# Eval("TitleBS") %></td>
                        <td>$<%# Eval("CurrentPriceBS") %></td> 
                        <td><%# Eval("OriginalPriceBS") %></td>
                        <td><%# Eval("LinkUrlBS") %></td>
                        <td><%# Eval("DisplayOrderBS") %></td>
                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("BestSellingProductID") %>' CssClass="btn btn-sm btn-warning">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("BestSellingProductID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete?');">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>

    <div class="col-12">
        <div class="card p-4 shadow">
            <h4>Products List</h4>
            <asp:ListView ID="BestSellingProductListView1" runat="server" OnItemCommand="BestSellingProductsListView1_ItemCommand" OnItemDeleting="BestSellingProductsListView1_ItemDeleting" OnItemEditing="BestSellingProductsListView1_ItemEditing" >
                <LayoutTemplate>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image2</th>
                                <th>Title2</th>
                                <th>Current Price2</th>
                                <th>Original Price2</th>
                                <th>LinkUrl2</th>
                                <th>Display Order2</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblBestSellingProduct2ID" runat="server" Text='<%# Eval("BestSellingProduct2ID") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblBestSellingimage2" runat="server" Text='<%# Eval("BestSellingimage2") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblTitleBS2" runat="server" Text='<%# Eval("TitleBS2") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblCurrentPriceBS2" runat="server" Text='<%# Eval("CurrentPriceBS2") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblOriginalPriceBS2" runat="server" Text='<%# Eval("OriginalPriceBS2") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblLinkUrlBS2" runat="server" Text='<%# Eval("LinkUrlBS2") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblDisplayOrderBS2" runat="server" Text='<%# Eval("DisplayOrderBS2") %>' Visible="false"></asp:Label>
                    <tr>
                        <td><%# Eval("BestSellingProduct2ID") %></td>
                        <td> <img class="Imagepath" src='img/BSELLP/<%# Eval("BestSellingimage2") %>' /></td>
                        <td><%# Eval("TitleBS2") %></td>
                        <td>$<%# Eval("CurrentPriceBS2") %></td> 
                        <td><%# Eval("OriginalPriceBS2") %></td>
                        <td><%# Eval("LinkUrlBS2") %></td>
                        <td><%# Eval("DisplayOrderBS2") %></td>
                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("BestSellingProduct2ID") %>' CssClass="btn btn-sm btn-warning">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("BestSellingProduct2ID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete?');">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>

