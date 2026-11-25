<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-favouriteproduct.aspx.cs" Inherits="Admin_Default" %>

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
    <div class="row">
    <div class="col-lg-6">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Add bundle Banner</h4>
                <div class="form-group mb-2">
                    <label>Image Path</label>
                    <asp:FileUpload ID="FileUpload10" runat="server" CssClass="form-control" />
                    <asp:Image ID="BannerImageB" runat="server" Height="100" Width="100" />
                </div>

                <div class="form-group mb-2">
                    <label>Title</label>
                    <asp:TextBox ID="TxtTitleB" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Discount</label>
                    <asp:TextBox ID="TxtDiscountTextB" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>OfferText</label>
                    <asp:TextBox ID="TxtOfferTextB" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-3">
                    <label>Display Order</label>
                    <asp:TextBox ID="TxtDisplayOrderB" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnSubmitB" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitB_Click" />
                <asp:Button ID="btnUpdateB" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateB_Click" Visible="false" />
                <asp:Label ID="lblBannerBID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Add Favorite Style</h4>
                <div class="form-group mb-2">
                    <label>Image Path2</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                    <asp:Image ID="FavoriteImage" runat="server" Height="100" Width="100" />
                </div>

                <div class="form-group mb-2">
                    <label>Title</label>
                    <asp:TextBox ID="TxtTitleF" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mb-2">
                    <label>CurrentPrice</label>
                    <asp:TextBox ID="TxtCurrentPriceF" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group mb-2">
                    <label>Original Price</label>
                    <asp:TextBox ID="TxtOriginalPriceF" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Discounted Price</label>
                    <asp:TextBox ID="TxtDiscountShowF" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Is New (1 for Yes, 0 for No)</label>
                    <asp:TextBox ID="TxtIsNewF" runat="server" CssClass="form-control" Text="0" />
                </div>

                <div class="form-group mb-2">
                    <label>Rating</label>
                    <asp:TextBox ID="TxtRatingF" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Review Count</label>
                    <asp:TextBox ID="TxtReviewCountF" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-3">
                    <label>Display Order2</label>
                    <asp:TextBox ID="TxtDisplayOrderF" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnSubmitF" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitF_Click" />
                <asp:Button ID="btnUpdateF" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateF_Click" Visible="false" />
                <asp:Label ID="lblFavoriteID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
            </div>
        </div>
        </div>
    <!-- Right Column Categories List -->
        <div class="col-12">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">bundle Banner List</h4>

                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>BannerImage</th>
                            <th>Title</th>
                            <th>Discount</th>
                            <th>OfferText</th>
                            <th>Display Order</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="bundleBannerListView" runat="server" OnItemCommand="bundleBannerListView_ItemCommand" OnItemDeleting="bundleBannerListView_ItemDeleting" OnItemEditing="bundleBannerListView_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblBannerBID" runat="server" Text='<%# Eval("BannerBID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblBannerImageB" runat="server" Text='<%# Eval("BannerImageB") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblTitleB" runat="server" Text='<%# Eval("Titleb") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDiscountTextb" runat="server" Text='<%# Eval("DiscountTextB") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblOfferTextb" runat="server" Text='<%# Eval("OfferTextB") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDisplayOrderb" runat="server" Text='<%# Eval("DisplayOrderB") %>' Visible="false"></asp:Label>

                                <tr>
                                    <td><%# Eval("BannerBID") %></td>
                                    <td><img class="Imagepath" src='img/SpecialSlider/<%# Eval("BannerImageB") %>'</td>
                                    <td><%# Eval("TitleB") %></td>
                                    <td><%# Eval("DiscountTextB") %></td>
                                    <td><%# Eval("OfferTextB") %></td>
                                    <td><%# Eval("DisplayOrderB") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("BannerBID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this category?');">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("BannerBID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
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
            <h4>Favorite Style List</h4>
            <asp:ListView ID="FavoriteListView" runat="server" OnItemCommand="FavoriteListView_ItemCommand" OnItemDeleting="FavoriteListView_ItemDeleting" OnItemEditing="FavoriteListView_ItemEditing" >
                <LayoutTemplate>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image2</th>  
                                <th>Title2</th>
                                <th>Current Price2</th>
                                <th>Original Price2</th>
                                <th>DiscountShowF</th>
                                <th>RatingF</th>
                                <th>ReviewCountF</th>
                                <th>Display Order2</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody><asp:PlaceHolder ID="itemPlaceholder" runat="server" /></tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblFavoriteID" runat="server" Text='<%# Eval("FavoriteID") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblFavoriteImage" runat="server" Text='<%# Eval("FavoriteImage") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblTitleF" runat="server" Text='<%# Eval("TitleF") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblCurrentPriceF" runat="server" Text='<%# Eval("CurrentPriceF") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblOriginalPriceF" runat="server" Text='<%# Eval("OriginalPriceF") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblDiscountShowF" runat="server" Text='<%# Eval("DiscountShowF") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblIsNewF" runat="server" Text='<%# Eval("IsNewF") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblRatingF" runat="server" Text='<%# Eval("RatingF") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblReviewCountF" runat="server" Text='<%# Eval("ReviewCountF") %>' Visible="false"></asp:Label>
                        <asp:Label ID="lblDisplayOrderF" runat="server" Text='<%# Eval("DisplayOrderF") %>' Visible="false"></asp:Label>
                    <tr>
                        <td><%# Eval("FavoriteID") %></td>
                        <td> <img class="Imagepath" src='img/BSELLP/<%# Eval("FavoriteImage") %>' /></td>
                        <td><%# Eval("TitleF") %></td>
                        <td>$<%# Eval("CurrentPriceF") %></td> 
                        <td><%# Eval("OriginalPriceF") %></td>
                        <td><%# Eval("DiscountShowF") %></td>
                        <td><%# Eval("IsNewF") %></td>
                        <td><%# Eval("RatingF") %></td>
                        <td><%# Eval("ReviewCountF") %></td>
                        <td><%# Eval("DisplayOrderF") %></td>
                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("FavoriteID") %>' CssClass="btn btn-sm btn-warning">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("FavoriteID") %>' CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete?');">Delete</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>

