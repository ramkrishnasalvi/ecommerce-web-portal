<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-SpecialProduct.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .Imagepath {
            width: 60px;
            height: auto;
            border-radius: 5px;
        }
        .card {
    border: none;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.shadow {
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.p-4 {
    padding: 1.5rem !important;
}
    </style>
        <%-- ------------------------- 6. Our SPECIAL Brand Products View all MANAGEMENT SECTION ------------------------- --%>
    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Add New Special</h4>
                <div class="form-group mb-2">
                    <label>Image Path</label>
                    <asp:FileUpload ID="FileUpload5" runat="server" CssClass="form-control" />
                    <asp:Image ID="Specialimage" runat="server" Height="100" Width="100" />
                </div>

                <div class="form-group mb-2">
                    <label>Title</label>
                    <asp:TextBox ID="TxtTitleOS" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Discount</label>
                    <asp:TextBox ID="TxtDiscountOS" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Link URL</label>
                    <asp:TextBox ID="TxtLinkUrlOS" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-3">
                    <label>Display Order</label>
                    <asp:TextBox ID="txtDisplayOrderOS" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnSubmitOS" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitOS_Click" />
                <asp:Button ID="btnUpdateOS" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateOS_Click" Visible="false" />
                <asp:Label ID="lblSpecialID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
            </div>
        </div>
        <%-- ------------------------- 7. SPECIALProducts View all MANAGEMENT SECTION ------------------------- --%>
        <div class="col-md-5">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Add New SpecialProducts</h4>
                <div class="mb-2">
                    <label>Image</label>
                    <asp:FileUpload ID="FileUpload6" runat="server" CssClass="form-control" />
                    <asp:Image ID="SpecialimageSP" runat="server" Height="100" Width="100" />
                </div>
                <div class="mb-2">
                    <label>Title</label>
                    <asp:TextBox ID="TxtTitleSP" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-2">
                    <label>Discount Text</label>
                    <asp:TextBox ID="TxtDiscountText" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-2">
                    <label>Rating (0.0 - 5.0)</label>
                    <asp:TextBox ID="TxtRatingSP" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-2">
                    <label>Current Price</label>
                    <asp:TextBox ID="TxtCurrentPrice" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-2">
                    <label>Original Price</label>
                    <asp:TextBox ID="TxtOriginalPriceSP" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label>Display Order</label>
                    <asp:TextBox ID="TxtDisplayOrderSP" runat="server" CssClass="form-control" />
                </div>
                <asp:Button ID="btnSubmitSP" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitSP_Click" />
                <asp:Button ID="btnUpdateSP" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateSP_Click" Visible="false" />
                <asp:Label ID="lblSpecialProductID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
            </div>
        </div>
</div>

    <!-- Right Column Categories List -->
        <div class="col-12">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Special List</h4>

                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Specialimage</th>
                            <th>Title</th>
                            <th>Discount</th>
                            <th>Link URL</th>
                            <th>Display Order</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="SpecialListView" runat="server" OnItemCommand="SpecialListView_ItemCommand" OnItemDeleting="SpecialListView_ItemDeleting" OnItemEditing="SpecialListView_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblSpecialID" runat="server" Text='<%# Eval("SpecialID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblSpecialimage" runat="server" Text='<%# Eval("Specialimage") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblTitleOS" runat="server" Text='<%# Eval("TitleOS") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDiscountOS" runat="server" Text='<%# Eval("DiscountOS") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblLinkUrlOS" runat="server" Text='<%# Eval("LinkUrlOS") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDisplayOrderOS" runat="server" Text='<%# Eval("DisplayOrderOS") %>' Visible="false"></asp:Label>

                                <tr>
                                    <td><%# Eval("SpecialID") %></td>
                                    <td><img class="Imagepath" src='img/SpecialSlider/<%# Eval("Specialimage") %>'</td>
                                    <td><%# Eval("TitleOS") %></td>
                                    <td><%# Eval("DiscountOS") %></td>
                                    <td><%# Eval("LinkUrlOS") %></td>
                                    <td><%# Eval("DisplayOrderOS") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("SpecialID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this category?');">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("SpecialID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-12">
            <div class="card p-4 shadow">
                <h4>Special Products List</h4>
                <asp:ListView ID="SpecialProductsListView" runat="server" OnItemCommand="SpecialProductsListView_ItemCommand" OnItemDeleting="SpecialProductsListView_ItemDeleting" OnItemEditing="SpecialProductsListView_ItemEditing">
                    <LayoutTemplate>
                        <table class="table table-bordered table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>DiscountText</th>
                                    <th>Rating</th>
                                    <th>CurrentPrice</th>
                                    <th>OriginalPrice</th>
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
                        <asp:Label ID="lblSpecialProductID" runat="server" Text='<%# Eval("SpecialProductID") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblSpecialimageSP" runat="server" Text='<%# Eval("SpecialimageSP") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblTitleSP" runat="server" Text='<%# Eval("TitleSP") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblDiscountText" runat="server" Text='<%# Eval("DiscountText") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblRatingSP" runat="server" Text='<%# Eval("RatingSP") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblCurrentPrice" runat="server" Text='<%# Eval("CurrentPrice") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblOriginalPriceSP" runat="server" Text='<%# Eval("OriginalPriceSP") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblDisplayOrderSP" runat="server" Text='<%# Eval("DisplayOrderSP") %>' Visible="false"></asp:Label>
                        <tr>
                            <td><%# Eval("SpecialProductID") %></td>
                            <td><img class="Imagepath" src='img/products/<%# Eval("SpecialimageSP") %>' /></td>
                            <td><%# Eval("TitleSP") %></td>
                            <td><%# Eval("DiscountText") %></td>
                            <td><%# Eval("RatingSP")%></td>
                            <td>$<%# Eval("CurrentPrice") %></td>
                            <td>$<%# Eval("OriginalPriceSP") %></td>
                            <td><%# Eval("DisplayOrderSP")%></td>

                            <td>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("SpecialProductID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this category?');">Delete</asp:LinkButton>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("SpecialProductID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
</asp:Content>

