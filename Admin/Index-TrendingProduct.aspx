<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-TrendingProduct.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>

        
    </style>

    <%-- ------------------------- 8. TrendingProducts View all MANAGEMENT SECTION ------------------------- --%>
    <%--Western/Tops--%>
    <div class=row>
    <div class="col-md-5">
        <div class="card p-4 shadow">
            <h4>TrendingProducts (western)</h4>
            <div class="mb-2">
                <label>Image Path</label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                <asp:Image ID="TrendingimageTP" runat="server" Height="100" Width="100" />
            </div>
            <div class="mb-2">
                <label>Title</label>
                <asp:TextBox ID="TxtTitleTP" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>CurrentPrice</label>
                <asp:TextBox ID="TxtCurrentPriceTP" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>OriginalPrice</label>
                <asp:TextBox ID="TxtOriginalPriceTP" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>DiscountShow</label>
                <asp:TextBox ID="TxtDiscountShowTP" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Rating (0.0 - 5.0)</label>
                <asp:TextBox ID="TxtRatingTP" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Review Count</label>
                <asp:TextBox ID="TxtReviewCountTP" runat="server" CssClass="form-control"  />
            </div>
            <div class="mb-2">
                    <label>Is New (1 for Yes, 0 for No)</label>
                    <asp:TextBox ID="TxtIsNewTP" runat="server" CssClass="form-control"  />
                </div>
            
            <div class="mb-3">
                <label>Display Order</label>
                <asp:TextBox ID="TxtDisplayOrderTP" runat="server" CssClass="form-control"  />
            </div>

            <asp:Button ID="btnSubmitTP" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitTP_Click" />
            <asp:Button ID="btnUpdateTP" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateTP_Click" Visible="false" />
            <asp:Label ID="lblTrendingProductID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
        </div>
    </div>

        <div class="col-md-5">
        <div class="card p-4 shadow">
            <h4>TrendingProducts (Tops)</h4>
            <div class="mb-2">
                <label>Image Path</label>
                <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                <asp:Image ID="TrendingimageTP2" runat="server" Height="100" Width="100" />
            </div>
            <div class="mb-2">
                <label>Title</label>
                <asp:TextBox ID="TxtTitleTP2" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>CurrentPrice</label>
                <asp:TextBox ID="TxtCurrentPriceTP2" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>OriginalPrice</label>
                <asp:TextBox ID="TxtOriginalPriceTP2" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>DiscountShow</label>
                <asp:TextBox ID="TxtDiscountShowTP2" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Rating (0.0 - 5.0)</label>
                <asp:TextBox ID="TxtRatingTP2" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Review Count</label>
                <asp:TextBox ID="TxtReviewCountTP2" runat="server" CssClass="form-control"  />
            </div>
            <div class="mb-2">
                    <label>Is New (1 for Yes, 0 for No)</label>
                    <asp:TextBox ID="TxtIsNewTP2" runat="server" CssClass="form-control"  />
                </div>
            
            <div class="mb-3">
                <label>Display Order</label>
                <asp:TextBox ID="TxtDisplayOrderTP2" runat="server" CssClass="form-control"  />
            </div>

            <asp:Button ID="btnSubmitTP2" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitTP2_Click" />
            <asp:Button ID="btnUpdateTP2" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateTP2_Click" Visible="false" />
            <asp:Label ID="lblTrendingProduct2ID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
        </div>
    </div>
</div>
    <%--Western Listview--%>
    <div class="col-12">
        <div class="card p-4 shadow">
            <h4>Products List</h4>
            <asp:ListView ID="TrendingProductsListView" runat="server" OnItemCommand="TrendingProductsListView_ItemCommand" OnItemDeleting="TrendingProductsListView_ItemDeleting" OnItemEditing="TrendingProductsListView_ItemEditing">
                <LayoutTemplate>
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>CurrentPrice</th>
                                <th>OriginalPrice</th>
                                <th>DiscountShow</th>
                                <th>Rating</th>
                                <th>Review</th>
                                <th>New</th>
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
                    <asp:Label ID="lblTrendingProductID" runat="server" Text='<%# Eval("TrendingProductID") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblTrendingimageTP" runat="server" Text='<%# Eval("TrendingimageTP") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblTitleTP" runat="server" Text='<%# Eval("TitleTP") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblCurrentPriceTP" runat="server" Text='<%# Eval("CurrentPriceTP") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblOriginalPriceTP" runat="server" Text='<%# Eval("OriginalPriceTP") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDiscountShowTP" runat="server" Text='<%# Eval("DiscountShowTP") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblRatingTP" runat="server" Text='<%# Eval("RatingTP") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblReviewCountTP" runat="server" Text='<%# Eval("ReviewCountTP") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblIsNewTP" runat="server" Text='<%# Eval("IsNewTP") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDisplayOrderTP" runat="server" Text='<%# Eval("DisplayOrderTP") %>' Visible="false"></asp:Label>
                    <tr>
                        <td><%# Eval("TrendingProductID") %></td>
                        <td><img src='img/products/<%# Eval("TrendingimageTP") %>' width="50" /></td>
                        <td><%# Eval("TitleTP") %></td>
                        <td>$<%# Eval("CurrentPriceTP") %></td>
                        <td>$<%# Eval("OriginalPriceTP") %></td>
                        <td><%# Eval("DiscountShowTP") %></td>
                        <td><%# Eval("RatingTP") %></td>
                        <td><%# Eval("ReviewCountTP") %></td>
                        <td><%# Eval("IsNewTP").ToString() == "1" ? "Yes" : "No" %></td>
                        <td><%# Eval("DisplayOrderTP") %></td>

                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("TrendingProductID") %>' CssClass="btn btn-sm btn-warning">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("TrendingProductID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete?');">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <%--Tops Listview--%>
    <div class="col-12">
        <div class="card p-4 shadow">
            <h4>Products List</h4>
            <asp:ListView ID="TrendingProductsListView2" runat="server" OnItemCommand="TrendingProductsListView2_ItemCommand" OnItemDeleting="TrendingProductsListView2_ItemDeleting" OnItemEditing="TrendingProductsListView2_ItemEditing">
                <LayoutTemplate>
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>CurrentPrice</th>
                                <th>OriginalPrice</th>
                                <th>DiscountShow</th>
                                <th>Rating</th>
                                <th>Review</th>
                                <th>New</th>
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
                    <asp:Label ID="lblTrendingProduct2ID" runat="server" Text='<%# Eval("TrendingProduct2ID") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblTrendingimageTP2" runat="server" Text='<%# Eval("TrendingimageTP2") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblTitleTP2" runat="server" Text='<%# Eval("TitleTP2") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblCurrentPriceTP2" runat="server" Text='<%# Eval("CurrentPriceTP2") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblOriginalPriceTP2" runat="server" Text='<%# Eval("OriginalPriceTP2") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDiscountShowTP2" runat="server" Text='<%# Eval("DiscountShowTP2") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblRatingTP2" runat="server" Text='<%# Eval("RatingTP2") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblReviewCountTP2" runat="server" Text='<%# Eval("ReviewCountTP2") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblIsNewTP2" runat="server" Text='<%# Eval("IsNewTP2") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDisplayOrderTP2" runat="server" Text='<%# Eval("DisplayOrderTP2") %>' Visible="false"></asp:Label>
                    <tr>
                        <td><%# Eval("TrendingProduct2ID") %></td>
                        <td><img src='img/products/<%# Eval("TrendingimageTP2") %>' width="50" /></td>
                        <td><%# Eval("TitleTP2") %></td>
                        <td>$<%# Eval("CurrentPriceTP2") %></td>
                        <td>$<%# Eval("OriginalPriceTP2") %></td>
                        <td><%# Eval("DiscountShowTP2") %></td>
                        <td><%# Eval("RatingTP2") %></td>
                        <td><%# Eval("ReviewCountTP2") %></td>
                        <td><%# Eval("IsNewTP2").ToString() == "1" ? "Yes" : "No" %></td>
                        <td><%# Eval("DisplayOrderTP2") %></td>

                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("TrendingProduct2ID") %>' CssClass="btn btn-sm btn-warning">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("TrendingProduct2ID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete?');">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <%--Bags/Shoes--%>
    <div class=row>
    <div class="col-md-5">
        <div class="card p-4 shadow">
            <h4>TrendingProducts (Bags)</h4>
            <div class="mb-2">
                <label>Image Path</label>
                <asp:FileUpload ID="FileUpload3" runat="server" CssClass="form-control" />
                <asp:Image ID="TrendingimageTP3" runat="server" Height="100" Width="100" />
            </div>
            <div class="mb-2">
                <label>Title</label>
                <asp:TextBox ID="TxtTitleTP3" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>CurrentPrice</label>
                <asp:TextBox ID="TxtCurrentPriceTP3" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>OriginalPrice</label>
                <asp:TextBox ID="TxtOriginalPriceTP3" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>DiscountShow</label>
                <asp:TextBox ID="TxtDiscountShowTP3" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Rating (0.0 - 5.0)</label>
                <asp:TextBox ID="TxtRatingTP3" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Review Count</label>
                <asp:TextBox ID="TxtReviewCountTP3" runat="server" CssClass="form-control"  />
            </div>
            <div class="mb-2">
                    <label>Is New (1 for Yes, 0 for No)</label>
                    <asp:TextBox ID="TxtIsNewTP3" runat="server" CssClass="form-control"  />
                </div>
            
            <div class="mb-3">
                <label>Display Order</label>
                <asp:TextBox ID="TxtDisplayOrderTP3" runat="server" CssClass="form-control"  />
            </div>

            <asp:Button ID="btnSubmitTP3" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitTP3_Click" />
            <asp:Button ID="btnUpdateTP3" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateTP3_Click" Visible="false" />
            <asp:Label ID="lblTrendingProduct3ID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
        </div>
    </div>

        <div class="col-md-5">
        <div class="card p-4 shadow">
            <h4>TrendingProducts (Shoes)</h4>
            <div class="mb-2">
                <label>Image Path</label>
                <asp:FileUpload ID="FileUpload4" runat="server" CssClass="form-control" />
                <asp:Image ID="TrendingimageTP4" runat="server" Height="100" Width="100" />
            </div>
            <div class="mb-2">
                <label>Title</label>
                <asp:TextBox ID="TxtTitleTP4" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>CurrentPrice</label>
                <asp:TextBox ID="TxtCurrentPriceTP4" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>OriginalPrice</label>
                <asp:TextBox ID="TxtOriginalPriceTP4" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>DiscountShow</label>
                <asp:TextBox ID="TxtDiscountShowTP4" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Rating (0.0 - 5.0)</label>
                <asp:TextBox ID="TxtRatingTP4" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-2">
                <label>Review Count</label>
                <asp:TextBox ID="TxtReviewCountTP4" runat="server" CssClass="form-control"  />
            </div>
            <div class="mb-2">
                    <label>Is New (1 for Yes, 0 for No)</label>
                    <asp:TextBox ID="TxtIsNewTP4" runat="server" CssClass="form-control"  />
                </div>
            
            <div class="mb-3">
                <label>Display Order</label>
                <asp:TextBox ID="TxtDisplayOrderTP4" runat="server" CssClass="form-control"  />
            </div>

            <asp:Button ID="btnSubmitTP4" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitTP4_Click" />
            <asp:Button ID="btnUpdateTP4" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateTP4_Click" Visible="false" />
            <asp:Label ID="lblTrendingProduct4ID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
        </div>
    </div>
</div>
    <%--Bags Listview--%>
    <div class="col-12">
        <div class="card p-4 shadow">
            <h4>Products List</h4>
            <asp:ListView ID="TrendingProductsListView3" runat="server" OnItemCommand="TrendingProductsListView3_ItemCommand" OnItemDeleting="TrendingProductsListView3_ItemDeleting" OnItemEditing="TrendingProductsListView3_ItemEditing">
                <LayoutTemplate>
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>CurrentPrice</th>
                                <th>OriginalPrice</th>
                                <th>DiscountShow</th>
                                <th>Rating</th>
                                <th>Review</th>
                                <th>New</th>
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
                    <asp:Label ID="lblTrendingProduct3ID" runat="server" Text='<%# Eval("TrendingProduct3ID") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblTrendingimageTP3" runat="server" Text='<%# Eval("TrendingimageTP3") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblTitleTP3" runat="server" Text='<%# Eval("TitleTP3") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblCurrentPriceTP3" runat="server" Text='<%# Eval("CurrentPriceTP3") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblOriginalPriceTP3" runat="server" Text='<%# Eval("OriginalPriceTP3") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDiscountShowTP3" runat="server" Text='<%# Eval("DiscountShowTP3") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblRatingTP3" runat="server" Text='<%# Eval("RatingTP3") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblReviewCountTP3" runat="server" Text='<%# Eval("ReviewCountTP3") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblIsNewTP3" runat="server" Text='<%# Eval("IsNewTP3") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDisplayOrderTP3" runat="server" Text='<%# Eval("DisplayOrderTP3") %>' Visible="false"></asp:Label>
                    <tr>
                        <td><%# Eval("TrendingProduct3ID") %></td>
                        <td><img src='img/products/<%# Eval("TrendingimageTP3") %>' width="50" /></td>
                        <td><%# Eval("TitleTP3") %></td>
                        <td>$<%# Eval("CurrentPriceTP3") %></td>
                        <td>$<%# Eval("OriginalPriceTP3") %></td>
                        <td><%# Eval("DiscountShowTP3") %></td>
                        <td><%# Eval("RatingTP3") %></td>
                        <td><%# Eval("ReviewCountTP3") %></td>
                        <td><%# Eval("IsNewTP3").ToString() == "1" ? "Yes" : "No" %></td>
                        <td><%# Eval("DisplayOrderTP3") %></td>

                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("TrendingProduct3ID") %>' CssClass="btn btn-sm btn-warning">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("TrendingProduct3ID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete?');">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <%--Shoes Listview--%>
    <div class="col-12">
        <div class="card p-4 shadow">
            <h4>Products List</h4>
            <asp:ListView ID="TrendingProductsListView4" runat="server" OnItemCommand="TrendingProductsListView4_ItemCommand" OnItemDeleting="TrendingProductsListView4_ItemDeleting" OnItemEditing="TrendingProductsListView4_ItemEditing">
                <LayoutTemplate>
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>CurrentPrice</th>
                                <th>OriginalPrice</th>
                                <th>DiscountShow</th>
                                <th>Rating</th>
                                <th>Review</th>
                                <th>New</th>
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
                    <asp:Label ID="lblTrendingProduct4ID" runat="server" Text='<%# Eval("TrendingProduct4ID") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblTrendingimageTP4" runat="server" Text='<%# Eval("TrendingimageTP4") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblTitleTP4" runat="server" Text='<%# Eval("TitleTP4") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblCurrentPriceTP4" runat="server" Text='<%# Eval("CurrentPriceTP4") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblOriginalPriceTP4" runat="server" Text='<%# Eval("OriginalPriceTP4") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDiscountShowTP4" runat="server" Text='<%# Eval("DiscountShowTP4") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblRatingTP4" runat="server" Text='<%# Eval("RatingTP4") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblReviewCountTP4" runat="server" Text='<%# Eval("ReviewCountTP4") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblIsNewTP4" runat="server" Text='<%# Eval("IsNewTP4") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblDisplayOrderTP4" runat="server" Text='<%# Eval("DisplayOrderTP4") %>' Visible="false"></asp:Label>
                    <tr>
                        <td><%# Eval("TrendingProduct4ID") %></td>
                        <td><img src='img/products/<%# Eval("TrendingimageTP4") %>' width="50" /></td>
                        <td><%# Eval("TitleTP4") %></td>
                        <td>$<%# Eval("CurrentPriceTP4") %></td>
                        <td>$<%# Eval("OriginalPriceTP4") %></td>
                        <td><%# Eval("DiscountShowTP4") %></td>
                        <td><%# Eval("RatingTP4") %></td>
                        <td><%# Eval("ReviewCountTP4") %></td>
                        <td><%# Eval("IsNewTP4").ToString() == "1" ? "Yes" : "No" %></td>
                        <td><%# Eval("DisplayOrderTP4") %></td>

                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("TrendingProduct4ID") %>' CssClass="btn btn-sm btn-warning">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("TrendingProduct4ID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete?');">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>

