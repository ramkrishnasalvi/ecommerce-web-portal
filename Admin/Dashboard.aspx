<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            text-align: center;
            margin-bottom: 20px;
            border-left: 4px solid #007bff;
        }
        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #007bff;
        }
        .stat-label {
            font-size: 1rem;
            color: #6c757d;
        }
        .stat-icon {
            font-size: 2rem;
            margin-bottom: 10px;
        }
        .bg-products { border-left-color: #007bff; }
        .bg-orders { border-left-color: #28a745; }
        .bg-customers { border-left-color: #ffc107; }
        .bg-revenue { border-left-color: #dc3545; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <h2 class="mb-4">👕 Cloth Store Admin Dashboard</h2>
        
        <!-- Statistics Cards -->
        <div class="row">
            <!-- Total Products -->
            <div class="col-xl-3 col-md-6">
                <div class="stat-card bg-products">
                    <div class="stat-icon text-primary">👕</div>
                    <div class="stat-number">
                        <asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="stat-label">Total Products</div>
                </div>
            </div>
            
            <!-- Total Orders -->
            <div class="col-xl-3 col-md-6">
                <div class="stat-card bg-orders">
                    <div class="stat-icon text-success">🛒</div>
                    <div class="stat-number">
                        <asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="stat-label">Total Orders</div>
                </div>
            </div>
            
            <!-- Total Customers -->
            <div class="col-xl-3 col-md-6">
                <div class="stat-card bg-customers">
                    <div class="stat-icon text-warning">👥</div>
                    <div class="stat-number">
                        <asp:Label ID="lblTotalCustomers" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="stat-label">Total Customers</div>
                </div>
            </div>
            
            <!-- Total Revenue -->
            <div class="col-xl-3 col-md-6">
                <div class="stat-card bg-revenue">
                    <div class="stat-icon text-danger">💰</div>
                    <div class="stat-number">
                        ₹<asp:Label ID="lblTotalRevenue" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="stat-label">Total Revenue</div>
                </div>
            </div>
        </div>

        <!-- Quick Stats -->
        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white d-flex justify-content-between">
                        <h5 class="mb-0">📋 Recent Orders</h5>
                        <asp:Button ID="btnViewAllOrders" runat="server" Text="View All" 
                            CssClass="btn btn-light btn-sm" PostBackUrl="~/Admin/Orders.aspx" />
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="gvRecentOrders" runat="server" CssClass="table table-striped" 
                            AutoGenerateColumns="false" EmptyDataText="No recent orders" ShowHeader="true">
                            <Columns>
                                <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                                <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                                <asp:BoundField DataField="TotalAmount" HeaderText="Amount" DataFormatString="{0:C}" />
                                <asp:BoundField DataField="OrderDate" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" />
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <span class='badge <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                            <%# Eval("Status") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-success text-white d-flex justify-content-between">
                        <h5 class="mb-0">👕 New Products</h5>
                        <asp:Button ID="btnAddProduct" runat="server" Text="Add New" 
                            CssClass="btn btn-light btn-sm" PostBackUrl="~/Admin/Products.aspx" />
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="gvNewProducts" runat="server" CssClass="table table-striped" 
                            AutoGenerateColumns="false" EmptyDataText="No products found">
                            <Columns>
                                <asp:TemplateField HeaderText="Product">
                                    <ItemTemplate>
                                        <div class="d-flex align-items-center">
                                            <img src='../img/products/<%# Eval("ProductImage") %>' 
                                                 width="40" height="40" class="rounded me-3" 
                                                 onerror="this.src='../img/placeholder.jpg'" />
                                            <div>
                                                <strong><%# Eval("ProductName") %></strong><br>
                                                <small class="text-muted"><%# Eval("Category") %></small>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                                <asp:BoundField DataField="StockQuantity" HeaderText="Stock" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="row mt-4">
            <div class="col-12">
                <div class="card shadow">
                    <div class="card-header bg-info text-white">
                        <h5 class="mb-0">⚡ Quick Actions</h5>
                    </div>
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col-md-3 mb-3">
                                <asp:Button ID="btnManageProducts" runat="server" Text="👕 Manage Products" 
                                    CssClass="btn btn-primary btn-lg w-100" PostBackUrl="~/Admin/Products.aspx" />
                            </div>
                            <div class="col-md-3 mb-3">
                                <asp:Button ID="btnManageOrders" runat="server" Text="🛒 Manage Orders" 
                                    CssClass="btn btn-success btn-lg w-100" PostBackUrl="~/Admin/Orders.aspx" />
                            </div>
                            <div class="col-md-3 mb-3">
                                <asp:Button ID="btnManageCategories" runat="server" Text="📁 Categories" 
                                    CssClass="btn btn-warning btn-lg w-100" PostBackUrl="~/Admin/Categories.aspx" />
                            </div>
                            <div class="col-md-3 mb-3">
                                <asp:Button ID="btnFlashSale" runat="server" Text="🔥 Flash Sale" 
                                    CssClass="btn btn-danger btn-lg w-100" PostBackUrl="~/Admin/FlashSale.aspx" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

