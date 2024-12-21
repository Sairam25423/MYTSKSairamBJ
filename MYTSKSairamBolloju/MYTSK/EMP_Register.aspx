<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EMP_Register.aspx.cs" Inherits="MYTSKSairamBolloju.MYTSK.EMP_Register" %>

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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .form-control input[type="radio"] {
            margin-right: 5px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#btnSubmit").click(function (event) {
                debugger;
                var Name = document.getElementById('txtName').value;
                var Designation = document.getElementById('txtDesignation').value;
                var Dateofjoin = document.getElementById('txtDateofjoin').value;
                var Salary = document.getElementById('txtSalary').value;

                var NameError = document.getElementById('ErrorName');
                var DesignationError = document.getElementById('ErrorDesignation');
                var DateofjoinError = document.getElementById('ErrorDateofjoin');
                var SalaryError = document.getElementById('ErrorSalary');
                var StateError = document.getElementById('ErrorState');
                var GenderError = document.getElementById('ErrorGender');

                var Isapproved = true;
                if (!validateName(Name)) {
                    NameError.innerText = 'Name must be at least 3 characters long and cannot be empty.';
                    Isapproved = false;
                } else {
                    NameError.innerText = '';
                }
                if (!validateDesignation(Designation)) {
                    DesignationError.innerText = 'Designation must be at least 3 characters long and contain only alphabets and spaces.';
                    Isapproved = false;
                } else {
                    DesignationError.innerText = '';
                }
                if (Dateofjoin === '') {
                    DateofjoinError.innerText = 'Please enter a valid date in the format YYYY-MM-DD.'
                    Isapproved = false;
                } else {
                    DateofjoinError.innerText = '';
                }
                if (!validateSalary(Salary)) {
                    SalaryError.innerText = 'Please enter a valid salary (numeric value).';
                    Isapproved = false;
                } else {
                    SalaryError.innerText = '';
                }
                var stateSelectedIndex = $('#DpState')[0].selectedIndex;
                if (stateSelectedIndex === 0) {
                    StateError.innerText = 'Please select a state.';
                    isValid = false;
                } else {
                    StateError.innerText = '';
                }
                if (!$('input[name="rblGender"]:checked').val()) {
                    GenderError.innerText = 'Please select a gender.'
                    Isapproved = false;
                } else {
                    GenderError.innerText = '';
                }
                if (!Isapproved) {
                    event.preventDefault();
                    return false;
                }
                return true;
            });
            function validateName(name) {
                return name !== '' && name.length >= 3;
            }
            function validateDesignation(designation) {
                var pattern = /^[A-Za-z\s]+$/;
                return pattern.test(designation) && designation.length >= 3;
            }
            function validateSalary(salary) {
                return !isNaN(salary) && parseFloat(salary) > 0;
            }
            //    function isValidDate(dateString) {
            //        var regex = /^\d{2}\/\d{2}\/\d{4}$/;
            //        if (!regex.test(dateString)) {
            //            return false;
            //        }
            //        var parts = dateString.split('/');
            //        var day = parseInt(parts[1], 10);
            //        var month = parseInt(parts[0], 10);
            //        var year = parseInt(parts[2], 10);

            //        var date = new Date(year, month - 1, day);
            //        return (date.getFullYear() === year && date.getMonth() + 1 === month && date.getDate() === day);
            //    }
        });
    </script>
</head>
<body>
    <form id="registrationForm" runat="server">
        <div class="container">
            <div class="card mt-5">
                <div class="card card-head" style="background: #ADBBDA">
                    <h2 class="text-center mt-2 mb-3" style="color: #AC8968">Employee Details</h2>
                </div>
                <div class="card card-body" style="background: #EDE8F5">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-4 col-xl-4 col-xxl-4">
                            <label>Name:</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" AutoCompleteType="Disabled" autocomlete="off"></asp:TextBox>
                            <div id="ErrorName" style="color: red"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-4 col-xl-4 col-xxl-4">
                            <label>Designation:</label>
                            <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control" AutoCompleteType="Disabled" autocomlete="off"></asp:TextBox>
                            <div id="ErrorDesignation" style="color: red"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-4 col-xl-4 col-xxl-4">
                            <label>Date of Join:</label>
                            <asp:TextBox ID="txtDateofjoin" runat="server" CssClass="form-control" AutoCompleteType="Disabled" autocomlete="off" TextMode="Date"></asp:TextBox>
                            <div id="ErrorDateofjoin" style="color: red"></div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-4 col-xl-4 col-xxl-4">
                            <label>Salary:</label>
                            <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" AutoCompleteType="Disabled" autocomlete="off"></asp:TextBox>
                            <div id="ErrorSalary" style="color: red"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-4 col-xl-4 col-xxl-4">
                            <label>State:</label>
                            <asp:DropDownList ID="DpState" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">--Select State--</asp:ListItem>
                            </asp:DropDownList>
                            <div id="ErrorState" style="color: red"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-4 col-xl-4 col-xxl-4">
                            <label>Gender:</label>
                            <asp:RadioButtonList ID="rblGender" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0" Enabled="false" style="display: none"></asp:ListItem>
                                <asp:ListItem Value="Male" Text="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female" Text="Female">Female</asp:ListItem>
                                <asp:ListItem Value="Other" Text="Other">Other</asp:ListItem>
                            </asp:RadioButtonList>
                            <div id="ErrorGender" style="color: red"></div>
                        </div>
                    </div>
                    <div class="mt-3 text-center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>

            <div class="row justify-content-center mt-3">
                <div class="col-md-8">
                    <div class="grid-container">
                        <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered text-center" OnRowCommand="gvEmployees_RowCommand" OnRowEditing="gvEmployees_RowEditing" DataKeyNames="EmpId">
                            <Columns>
                                <asp:BoundField DataField="EmpId" HeaderText="S.No" ReadOnly="true" Visible="false" />
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSerial" runat="server" Text='<%# Container.DataItemIndex + 1 %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' ReadOnly="true" Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" Text='<%# Eval("Name") %>' CommandArgument='<%# Eval("EmpId") + "," + Eval("Name") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("Designation") %>' ReadOnly="true" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date of Joining">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateofjoin" runat="server" Text='<%# Eval("DateofJoin") %>' ReadOnly="true" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Salary">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalary" runat="server" Text='<%# Eval("Salary") %>' ReadOnly="true" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>' ReadOnly="true" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State">
                                    <ItemTemplate>
                                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>' ReadOnly="true" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
