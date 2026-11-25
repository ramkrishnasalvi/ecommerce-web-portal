<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-Newarrival.aspx.cs" Inherits="Admin_Default" %>

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
     <%-- ------------------------- 10. New arrival  View all MANAGEMENT SECTION ------------------------- --%>
        <div class="col-lg-6">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Add New Flash Sell Item</h4>

                <div class="form-group mb-2">
                    <label>Product Image</label>
                    <asp:FileUpload ID="FileUpload9" runat="server" CssClass="form-control" />
                    <asp:Image ID="ArrivalImage" runat="server" Height="100" Width="100" />
                </div>

                <div class="form-group mb-2">
                    <label>Title</label>
                    <asp:TextBox ID="TxtTitleNA" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Original Price</label>
                    <asp:TextBox ID="TxtOriginalPriceNA" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Is New (1 for Yes, 0 for No)</label>
                    <asp:TextBox ID="TxtIsNewNA" runat="server" CssClass="form-control" Text="0" />
                </div>

                <div class="form-group mb-2">
                    <label>Rating</label>
                    <asp:TextBox ID="TxtRatingNA" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Review Count</label>
                    <asp:TextBox ID="TxtReviewCountNA" runat="server" CssClass="form-control" />
                </div>

                

                <div class="form-group mb-3">
                    <label>Display Order</label>
                    <asp:TextBox ID="TxtDisplayOrderNA" runat="server" CssClass="form-control" />
                </div>
                <asp:Button ID="btnSubmitNA" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmitNA_Click" />
                <asp:Button ID="btnUpdateNA" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdateNA_Click" Visible="false" />
                <asp:Label ID="lblArrivalID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
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
                            <th>Is New</th>
                            <th>Rating</th>
                            <th>Review Count</th>
                            <th>Display Order</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="NewArrivalListView" runat="server" OnItemCommand="NewArrivalListView_ItemCommand" OnItemDeleting="NewArrivalListView_ItemDeleting" OnItemEditing="NewArrivalListView_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblArrivalID" runat="server" Text='<%# Eval("ArrivalID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblArrivalImage" runat="server" Text='<%# Eval("ArrivalImage") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblTitleNA" runat="server" Text='<%# Eval("TitleNA") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblOriginalPriceNA" runat="server" Text='<%# Eval("OriginalPriceNA") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblIsNewNA" runat="server" Text='<%# Eval("IsNewNA") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblRatingNA" runat="server" Text='<%# Eval("RatingNA") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblReviewCountNA" runat="server" Text='<%# Eval("ReviewCountNA") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDisplayOrderNA" runat="server" Text='<%# Eval("DisplayOrderNA") %>' Visible="false"></asp:Label>
                                <tr>
                                    <td><%# Eval("ArrivalID") %></td>
                                    <td><img class="Imagepath" src='img/products/<%# Eval("ArrivalImage") %>' /></td>
                                    <td><%# Eval("TitleNA") %></td>
                                    <td><%# Eval("OriginalPriceNA", "{0:C}") %></td>
                                    <td><%# Eval("IsNewNA").ToString() == "1" ? "Yes" : "No" %></td>
                                    <td><%# Eval("RatingNA") %></td>
                                    <td><%# Eval("ReviewCountNA") %></td>
                                    <td><%# Eval("DisplayOrderNA") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("ArrivalID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this item?');">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("ArrivalID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
</asp:Content>

