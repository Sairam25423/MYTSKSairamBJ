<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeDetails.aspx.cs" Inherits="MYTSKSairamBolloju.MYTSK.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EMP Details</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.0/dist/sweetalert2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.0/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card mt-5">
                <div class="card card-head" style="background: #ADBBDA">
                    <h2 class="text-center mt-2 mb-3" style="color: #AC8968">Employee Details</h2>
                </div>
                <div class="card card-body" style="background: #EDE8F5">
                    <div class="row">
                         <div class="grid-container">
                            <asp:GridView ID="GvEmployees" runat="server" CssClass="table table-striped table-bordered text-center" AutoGenerateColumns="False"
                                OnRowEditing="GvEmployees_RowEditing" OnRowCancelingEdit="GvEmployees_RowCancelingEdit" OnRowUpdating="GvEmployees_RowUpdating" OnRowDeleting="GvEmployees_RowDeleting" OnRowDataBound="GvEmployees_RowDataBound" DataKeyNames="EmployeeID">
                                <Columns>
                                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" ReadOnly="true" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmployeeIDEdit" runat="server" Text='<%# Bind("EmployeeID") %>' ReadOnly="true" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" ReadOnly="true" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtFirstNameEdit" runat="server" Text='<%# Bind("FirstName") %>' />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" ReadOnly="true" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLastNameEdit" runat="server" Text='<%# Bind("LastName") %>' />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" ReadOnly="true" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDesignationEdit" runat="server" Text='<%# Bind("Designation") %>' />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DOB" ReadOnly="true" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DpDepartmentNameEdit" runat="server" SelectedItem='<%# Bind("DepartmentName") %>'></asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="HireDate" HeaderText="HireDate" SortExpression="HireDate" ReadOnly="true" />
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtHireDateEdit" runat="server" Text='<%# Bind("HireDate") %>' />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Actions" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="container mt-3">
                <div class="row justify-content-center mt-3">
                    <div class="col-md-8">
                       
                    </div>
                </div>
            </div>--%>
        </div>
    </form>
</body>
</html>
