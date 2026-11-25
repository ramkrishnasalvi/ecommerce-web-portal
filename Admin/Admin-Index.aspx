<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Admin-Index.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        /* Card Styling */
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

/* Form Group Styling */
.form-group {
    margin-bottom: 1rem;
}

.form-group label {
    font-weight: 500;
    color: #333;
    margin-bottom: 0.25rem;
    display: block;
}

.form-control {
    border: 1px solid #ced4da;
    border-radius: 4px;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
}

.form-control:focus {
    border-color: #80bdff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
    outline: none;
}

/* Button Styling */
.btn {
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    border-radius: 4px;
    transition: all 0.3s ease;
}

.btn-success {
    background-color: #28a745;
    border-color: #28a745;
}

.btn-success:hover {
    background-color: #218838;
    border-color: #1e7e34;
}

.btn-secondary {
    background-color: #6c757d;
    border-color: #6c757d;
}

.btn-secondary:hover {
    background-color: #5a6268;
    border-color: #545b62;
}

.btn-sm {
    padding: 0.25rem 0.5rem;
    font-size: 0.875rem;
}

.me-2 {
    margin-right: 0.5rem !important;
}

/* Table Styling */
.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
}

.table-bordered {
    border: 1px solid #dee2e6;
}

.table-dark {
    background-color: #343a40;
    color: #fff;
}

.table-dark th {
    border-color: #454d55;
}

th {
    padding: 0.75rem;
    vertical-align: middle;
    border-bottom: 2px solid #dee2e6;
}

td {
    padding: 0.75rem;
    vertical-align: middle;
    border-top: 1px solid #dee2e6;
}

/* Custom Text */
.text-primary {
    color: #007bff !important;
}

.text-muted {
    color: #6c757d !important;
}

.d-block {
    display: block !important;
}

.mt-3 {
    margin-top: 1rem !important;
}
        .Imagepath {
            width: 60px;
            height: auto;
            border-radius: 5px;
        }
        /*.Imagepath1 {
            width: 60px;
            height: auto;
            border-radius: 5px;
            background-color: #16C4E3;
        }*/

        /*.CountdownEndDate {
  display: flex;
  gap: 5px;
}*/
        /*.add-group > table > tbody {
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
        }*/

    </style>
    

</asp:Content>

