<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Index-Countdown.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .CountdownEndDate {
            display: flex;
            gap: 5px;
        }
    </style>
        <%-- ------------------------- 4. COUNTDOWN MANAGEMENT SECTION ------------------------- --%>
    <div class="col-lg-6">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Countdown Events Management</h4>
                <div class="form-group mb-3">
                    <label>EventName</label>
                    <asp:TextBox ID="txtEventName" runat="server" placeholder="Event Name" CssClass="form-control" />
                </div> 
            <div class="form-group mb-3">
                    <label>Countdown End Date</label>
                    <asp:TextBox ID="txtCountdownEndDate" runat="server" TextMode="DateTimeLocal" placeholder="MM/dd/yyyy HH:mm" CssClass="form-control" />
                </div>
                <div class="form-group mb-3">
                    <label>Display Order</label>
                    <asp:TextBox ID="txtCountdownDisplayOrder" runat="server" placeholder="Display Order" CssClass="form-control" />
                </div>
            <asp:Button ID="btnSubmitCountdown" runat="server" Text="Submit Countdown" CssClass="btn btn-success me-2" OnClick="btnSubmitCountdown_Click" />
            <asp:Button ID="btnUpdateCountdown" runat="server" Text="Update Countdown" CssClass="btn btn-secondary" OnClick="btnUpdateCountdown_Click" Visible="false" />
            <asp:Label ID="lblCountdownID" runat="server" Visible="false"></asp:Label>
            </div>
        </div>
    <div class="col-12">
            <div class="card shadow p-4">
                <h4 class="mb-3 text-primary">Countdown List</h4>
                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                                <th>Event Name</th>
                                <th>End Date</th>
                                <th>Display Order</th>
                                <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView ID="CountdwonListView" runat="server" OnItemCommand="CountdwonListView_ItemCommand" OnItemDeleting="CountdwonListView_ItemDeleting" OnItemEditing="CountdwonListView_ItemEditing">
                            <ItemTemplate>
                                <asp:Label ID="lblCountdownID" runat="server" Text='<%# Eval("CountdownID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblEventName" runat="server" Text='<%# Eval("EventName") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblCountdownEndDate" runat="server" Text='<%# Eval("CountdownEndDate", "{0:yyyy/MM/dd HH:mm}") %>' Visible="false" />
                                <asp:Label ID="lblCountdownDisplayOrder" runat="server" Text='<%# Eval("CountdownDisplayOrder") %>' Visible="false"></asp:Label>

                                <tr>
                                    <td><%# Eval("CountdownID") %></td>
                                    <td><%# Eval("EventName") %></td>
                                    <td><div class="CountdownEndDate"data-end-date='<%# Eval("CountdownEndDate", "{0:yyyy/MM/dd HH:mm}") %>'></div></td>
                                    <td><%# Eval("CountdownDisplayOrder") %></td>
                                    <td>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("CountdownID") %>' CssClass="btn btn-danger btn-sm me-1" OnClientClick="return confirm('Are you sure you want to delete this item?');">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("CountdownID") %>' CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>
</asp:Content>

