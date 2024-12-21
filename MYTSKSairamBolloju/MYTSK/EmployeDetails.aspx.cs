using MYTSKSairamBolloju.App_Start;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace MYTSKSairamBolloju.MYTSK
{
    public partial class Registration : System.Web.UI.Page
    {
        DataAccessLayer objBL = new DataAccessLayer();
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridData();
            }
        }
        #endregion
        #region BindData
        public void BindGridData()
        {
            string SP = "SP_GetData"; string[] ParameterNames = null; string[] ParameterValues = null;
            DataSet Ds = objBL.RetrievedData(SP, ParameterNames, ParameterValues);
            if (Ds.Tables[0].Rows.Count > 0)
            {
                GvEmployees.DataSource = Ds.Tables[0];
                GvEmployees.DataBind();
            }
        }
        #endregion
        #region RowEdit
        protected void GvEmployees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GvEmployees.EditIndex = e.NewEditIndex;
            BindGridData();
        }
        #endregion
        #region RowCancel
        protected void GvEmployees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvEmployees.EditIndex = -1;
            BindGridData();
        }
        #endregion
        #region RowUpdate
        protected void GvEmployees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GvEmployees.Rows[e.RowIndex];
            string EmpId = (row.FindControl("txtEmployeeIDEdit") as TextBox).Text;
            string FirstName = (row.FindControl("txtFirstNameEdit") as TextBox).Text.Trim();
            string LastName = (row.FindControl("txtLastNameEdit") as TextBox).Text.Trim();
            string Designation = (row.FindControl("txtDesignationEdit") as TextBox).Text.Trim();
            string DepartmentName = (row.FindControl("DpDepartmentNameEdit") as DropDownList).SelectedItem.Text;
            DateTime HireDate;
            if (!DateTime.TryParse((row.FindControl("txtHireDateEdit") as TextBox).Text, out HireDate))
            {
                //string script = @"
                //Swal.fire({
                //title: 'Success!',
                //text: 'This is a SweetAlert triggered from the server-side.',
                //icon: 'success',
                //confirmButtonText: 'OK'
                //});";
                //ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
                string script = @"
                Swal.fire({
                title: 'Failure!',
                text: 'Invalid hire date format.',
                icon: 'error',
                confirmButtonText: 'OK'
                });";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
                return;
            }
            string SP = "Sp_UpdateDetails"; string[] ParameterNames = { "@EmployeeID", "@FirstName", "@LastName", "@Designation", "@DepartmentName", "@HireDate" };
            string[] ParameterValues = { EmpId, FirstName, LastName, Designation, DepartmentName, HireDate.ToString() };
            bool Result = objBL.InsertData(SP, ParameterNames, ParameterValues);
            if (Result == true)
            {
                GvEmployees.EditIndex = -1;
                BindGridData();
            }
            else
            {
                string script = @"
                Swal.fire({
                title: 'Failure!',
                text: 'Something went wrong.',
                icon: 'error',
                confirmButtonText: 'OK'
                });";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
            }
        }
        #endregion
        #region RowDelete
        protected void GvEmployees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string empId = GvEmployees.DataKeys[e.RowIndex].Value.ToString();
            string SP = "SP_DeleteData"; string[] ParameterNames = { "@EmployeeID" };
            string[] ParameterValues = { empId };
            bool Result = objBL.InsertData(SP, ParameterNames, ParameterValues);
            if (Result == true)
            {
                GvEmployees.EditIndex = -1;
                BindGridData();
            }
            else
            {
                string script = @"
                Swal.fire({
                title: 'Failure!',
                text: 'Something went wrong.',
                icon: 'error',
                confirmButtonText: 'OK'
                });";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
            }
        }
        #endregion
        #region RowDataBound
        protected void GvEmployees_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("DpDepartmentNameEdit");
                if (ddl != null)
                {
                    string SP = "SP_DropDownData"; string[] ParameterNames = null; string[] ParameterValues = null;
                    DataSet Ds = objBL.RetrievedData(SP, ParameterNames, ParameterValues);
                    if (Ds.Tables[0].Rows.Count > 0)
                    {
                        ddl.DataSource = Ds.Tables[0];
                        ddl.DataTextField = "DepartmentName";
                        ddl.DataValueField = "DepartmentId";
                        ddl.DataBind();
                    }
                }
            }

        }
        #endregion
    }
}