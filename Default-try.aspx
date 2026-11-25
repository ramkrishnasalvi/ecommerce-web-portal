<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default-try.aspx.cs" Inherits="Default_try" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .category-header {
            background-color: #f4a261;
            color: white;
            padding: 10px;
            font-weight: bold;
            text-align: center;
            border-radius: 5px 5px 0 0;
        }
        .category-list {
            background-color: #fff;
            padding: 10px;
            border: 1px solid #ccc;
            border-top: none;
            border-radius: 0 0 5px 5px;
        }
        .category-item {
            display: flex;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .category-item img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
            border-radius: 50%;
        }
        .category-item span {
            flex-grow: 1;
            font-size: 16px;
        }
        .edit-form {
            padding: 10px;
            border: 1px solid #ddd;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="category-header">Manage Categories</div>
    <div class="category-list">
        <asp:ListView ID="CategoryList" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="CategoryID" >
            <LayoutTemplate>
                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
            </LayoutTemplate>
            <ItemTemplate>
                <div class="category-item">
                    <asp:Image ID="CategoryIcon" runat="server" ImageUrl='Admin/img/category/<%# Eval("IconPath") %>' />
                    <span><%# Eval("CategoryName") %></span>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn" OnClientClick="return confirm('Are you sure?');" />
                </div>
            </ItemTemplate>
            <EditItemTemplate>
                <div class="edit-form">
                    <asp:Image ID="CategoryIcon" runat="server" ImageUrl='<%# Eval("IconPath") %>' /><br />
                    <asp:Label ID="lblName" runat="server" Text="Category Name:"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox><br />
                    <asp:Label ID="lblIcon" runat="server" Text="Icon Path:"></asp:Label>
                    <asp:TextBox ID="txtIcon" runat="server" Text='<%# Bind("IconPath") %>'></asp:TextBox><br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Save" CssClass="btn" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn" />
                </div>
            </EditItemTemplate>
            
        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(localdb)\Projects;Initial Catalog=E-commerce1;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False" 
            SelectCommand="SELECT CategoryID, CategoryName, IconPath FROM Categories WHERE IsActive = 1"
            UpdateCommand="UPDATE Categories SET CategoryName = @CategoryName, IconPath = @IconPath WHERE CategoryID = @CategoryID" 
            DeleteCommand="DELETE FROM Categories WHERE CategoryID = @CategoryID"
            InsertCommand="INSERT INTO Categories (CategoryName, IconPath, IsActive) VALUES (@CategoryName, @IconPath, 1)">
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="IconPath" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="IconPath" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
