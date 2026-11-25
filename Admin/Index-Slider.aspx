<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-Slider.aspx.cs" Inherits="Admin_Default" %>

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
    <%-- ------------------------- 1. SLIDERS MANAGEMENT SECTION ------------------------- --%>
    <div class="row" id="Sliders" style="margin-right: 0px;">
        <!-- Left Column -->
        <div class="col-lg-6">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Add New Sliders</h4>

                <div class="form-group mb-2">
                    <label>Slider Image</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                    <asp:Image ID="Sliderimage" runat="server" Height="100" Width="100" />
                </div>

                <div class="form-group mb-2">
                    <label>Heading 1</label>
                    <asp:TextBox ID="txtHeading1" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Heading 2</label>
                    <asp:TextBox ID="txtHeading2" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-2">
                    <label>Link URL</label>
                    <asp:TextBox ID="txtLinkUrl" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group mb-3">
                    <label>Display Order</label>
                    <asp:TextBox ID="txtDisplayOrder" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success me-2" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-secondary" OnClick="btnUpdate_Click" Visible="false" />
                <asp:Label ID="lblSliderID" runat="server" Visible="false" CssClass="d-block mt-3 text-muted"></asp:Label>
            </div>
        </div>
         <!-- Right Column Slider List -->
    <div class="row mt-4">
        <div class="col-lg-12">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Slider List</h4>

                <table class="table table-bordered ">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Slider Image</th>
                            <th>Heading 1</th>
                            <th>Heading 2</th>
                            <th>Link URL</th>
                            <th>Display Order</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="SliderListView" runat="server" OnItemCommand="SliderListView_ItemCommand" OnItemDeleting="SliderListView_ItemDeleting" OnItemEditing="SliderListView_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblSliderID" runat="server" Text='<%# Eval("SliderID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblSliderimage" runat="server" Text='<%# Eval("Sliderimage") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblHeading1" runat="server" Text='<%# Eval("Heading1") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblHeading2" runat="server" Text='<%# Eval("Heading2") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblLinkUrl" runat="server" Text='<%# Eval("LinkUrl") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDisplayOrder" runat="server" Text='<%# Eval("DisplayOrder") %>' Visible="false"></asp:Label>

                                <tr>
                                    <td><%# Eval("SliderID") %></td>
                                    <td><img class="Imagepath" src='img/Slider/<%# Eval("Sliderimage") %>' /></td>
                                    <td><%# Eval("Heading1") %></td>
                                    <td><%# Eval("Heading2") %></td>
                                    <td><%# Eval("LinkUrl") %></td>
                                    <td><%# Eval("DisplayOrder") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("SliderID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this banner?');">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("SliderID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

