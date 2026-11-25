<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-FlashSell.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
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
        .Imagepath {
            width: 60px;
            height: auto;
            border-radius: 5px;
        }
        .add-group > table > tbody {
            display: flex;
        }
        .add-group > table > tbody > tr >td {
            text-align: center;
        }
        .add-group > table > tbody > tr >td >label[for='ContentPlaceHolder1_ColorOptions_0'] {
            color: red;
        }
        .add-group > table > tbody > tr >td >label[for='ContentPlaceHolder1_ColorOptions_1'] {
            color: Green;
        }.add-group > table > tbody > tr >td >label[for='ContentPlaceHolder1_ColorOptions_2'] {
            color: Blue;
        }.add-group > table > tbody > tr >td >label[for='ContentPlaceHolder1_ColorOptions_3'] {
            color: Yellow;
        }.add-group > table > tbody > tr >td >label[for='ContentPlaceHolder1_ColorOptions_4'] {
            color: Orange;
        }.add-group > table > tbody > tr >td >label[for='ContentPlaceHolder1_ColorOptions_5'] {
            color: Purple;
        }.add-group > table > tbody > tr >td >label[for='ContentPlaceHolder1_ColorOptions_6'] {
            color: Pink;
        }
    </style>
    <div class="col-lg-6">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Add New Flash Sell Item</h4>

                <div class="form-group mb-2">
                    <label>Product Image</label>
                    <asp:FileUpload ID="FileUpload3" runat="server" CssClass="form-control" />
                    <asp:Image ID="ProductImage" runat="server" Height="100" Width="100" />
                </div>

                <div class="form-group mb-2">
                    <label>Title</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Original Price</label>
                    <asp:TextBox ID="txtOriginalPrice" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Discounted Price</label>
                    <asp:TextBox ID="txtDiscountedPrice" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Discount Percentage</label>
                    <asp:TextBox ID="txtDiscountPercentage" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Is New (1 for Yes, 0 for No)</label>
                    <asp:TextBox ID="txtIsNew" runat="server" CssClass="form-control" Text="0" />
                </div>

                <div class="form-group mb-2">
                    <label>Rating</label>
                    <asp:TextBox ID="txtRating" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Review Count</label>
                    <asp:TextBox ID="txtReviewCount" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mb-3">
                    <label>Display Order</label>
                    <asp:TextBox ID="txtDisplayOrderFS" runat="server" CssClass="form-control" />
                </div>
                <asp:Button ID="btnSubmitF" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitF_Click" />
                <asp:Button ID="btnUpdateF" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateF_Click" Visible="false" />
                <asp:Label ID="lblFlashSellID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
            </div>
        </div>
    <div class="col-12">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Flash Sell Items List</h4>

                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Product Image</th>
                            <th>Title</th>
                            <th>Original Price</th>
                            <th>Discounted Price</th>
                            <th>Discount %</th>
                            <th>Is New</th>
                            <th>Rating</th>
                            <th>Review Count</th>
                            <th>Display Order</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="FlashSellListView" runat="server" OnItemCommand="FlashSellListView_ItemCommand" OnItemDeleting="FlashSellListView_ItemDeleting" OnItemEditing="FlashSellListView_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblFlashSellID" runat="server" Text='<%# Eval("FlashSellID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblProductImage" runat="server" Text='<%# Eval("ProductImage") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblOriginalPrice" runat="server" Text='<%# Eval("OriginalPrice") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDiscountedPrice" runat="server" Text='<%# Eval("DiscountedPrice") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDiscountPercentage" runat="server" Text='<%# Eval("DiscountPercentage") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblIsNew" runat="server" Text='<%# Eval("IsNew") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblRating" runat="server" Text='<%# Eval("Rating") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblReviewCount" runat="server" Text='<%# Eval("ReviewCount") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDisplayOrderFS" runat="server" Text='<%# Eval("DisplayOrderFS") %>' Visible="false"></asp:Label>
                                <tr>
                                    <td><%# Eval("FlashSellID") %></td>
                                    <td><img class="Imagepath" src='img/products/<%# Eval("ProductImage") %>' /></td>
                                    <td><%# Eval("Title") %></td>
                                    <td><%# Eval("OriginalPrice", "{0:C}") %></td>
                                    <td><%# Eval("DiscountedPrice", "{0:C}") %></td>
                                    <td><%# Eval("DiscountPercentage") %>%</td>
                                    <td><%# Eval("IsNew").ToString() == "1" ? "Yes" : "No" %></td>
                                    <td><%# Eval("Rating") %></td>
                                    <td><%# Eval("ReviewCount") %></td>
                                    <td><%# Eval("DisplayOrderFS") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("FlashSellID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this item?');">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("FlashSellID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
</asp:Content>

