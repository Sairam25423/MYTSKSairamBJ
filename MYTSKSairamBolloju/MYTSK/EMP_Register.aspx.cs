using MYTSKSairamBolloju.App_Start;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace MYTSKSairamBolloju.MYTSK
{
    public partial class EMP_Register : System.Web.UI.Page
    {
        DataAccessLayer objBL = new DataAccessLayer();
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDateofjoin.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");
                txtDateofjoin.Attributes["min"] = DateTime.Now.ToString("1947-01-01");
                BindStates(); BindGridData();
            }
        }
        #endregion
        #region BtnClick
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!(string.IsNullOrEmpty(txtName.Text.Trim()) && string.IsNullOrEmpty(txtDesignation.Text.Trim()) && string.IsNullOrEmpty(txtDateofjoin.Text.Trim()) && string.IsNullOrEmpty(txtSalary.Text.Trim()))
                && rblGender.SelectedIndex != 0 && DpState.SelectedIndex > 0)
            {
                string SP = "Sp_InsertData"; string[] ParameterNames = { "@Name", "@Designation", "@Dateofjoin", "@Salary", "@Gender", "@State" };
                string[] ParameterValues = { txtName.Text.Trim(), txtDesignation.Text.Trim(), txtDateofjoin.Text.Trim(), txtSalary.Text.Trim(), rblGender.SelectedItem.Text, DpState.SelectedItem.Text };
                bool Result = objBL.InsertData(SP, ParameterNames, ParameterValues);
                if (Result == true)
                {
                    string script = @"
                    Swal.fire({
                    title: 'Success!',
                    text: 'Details inserted successfully.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                    });";
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
                    txtName.Text = txtDesignation.Text = txtDateofjoin.Text = txtSalary.Text = string.Empty; rblGender.SelectedIndex = DpState.SelectedIndex = -1; BindGridData();
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
            else
            {
                string script = @"
                Swal.fire({
                title: 'Failure!',
                text: 'Please fill all the details.',
                icon: 'error',
                confirmButtonText: 'OK'
                });";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
            }
        }
        #endregion
        #region BindData
        public void BindGridData()
        {
            string SP = "SP_GridData"; string[] ParameterNames = null; string[] ParameterValues = null;
            DataSet Ds = objBL.RetrievedData(SP, ParameterNames, ParameterValues);
            if (Ds.Tables[0].Rows.Count > 0)
            {
                gvEmployees.DataSource = Ds.Tables[0];
                gvEmployees.DataBind();
                gvEmployees.Visible = true;
            }
        }
        #endregion
        #region BindDropDown
        public void BindStates()
        {
            string SP = "Sp_GetStates"; string[] ParameterNames = null; string[] ParameterValues = null;
            DataSet Ds = objBL.RetrievedData(SP, ParameterNames, ParameterValues);
            if (Ds.Tables[0].Rows.Count > 0)
            {
                DpState.DataSource = Ds.Tables[0];
                DpState.DataTextField = "StateName";
                DpState.DataValueField = "StateId";
                DpState.DataBind();
                DpState.Items.Insert(0, new ListItem("---Select State---", "0"));

            }
        }
        #endregion
        #region RowCommand
        protected void gvEmployees_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                LinkButton lnkEdit = (LinkButton)e.CommandSource;
                GridViewRow row = (GridViewRow)lnkEdit.NamingContainer;

                string empId = lnkEdit.CommandArgument.Split(',')[0];
                txtName.Text = ((Label)row.FindControl("lblName")).Text;  
                txtDesignation.Text = ((Label)row.FindControl("lblDesignation")).Text;
                txtDateofjoin.Text = ((Label)row.FindControl("lblDateofjoin")).Text; 
                txtSalary.Text = ((Label)row.FindControl("lblSalary")).Text;  
                DpState.SelectedItem.Text = ((Label)row.FindControl("lblState")).Text;
                rblGender.SelectedValue = ((Label)row.FindControl("lblGender")).Text; 
            }
        }
        #endregion

        protected void gvEmployees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEmployees.EditIndex = e.NewEditIndex;
            BindGridData();
        }
    }
}