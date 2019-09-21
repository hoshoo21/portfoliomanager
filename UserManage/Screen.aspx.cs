using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Portfolio;

namespace Portfolio
{
    public partial class Screen : System.Web.UI.Page
    {
        private dal db;
        private ClientClass cc;
        private DataTable dt;
        private DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownProject();
                DropDownParent();
                fillgrid();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                db = new dal();
                dt = new DataTable();
                cc = new ClientClass();
                cc.Screen = txtScreen.Text;
                cc.ProjectIdx = ddlProject.SelectedValue;

                if (chkActive.Checked == true)
                {
                    cc.Active = "1";
                }
                else
                {
                    cc.Active = "0";
                }                

                cc.insertScreen(dt, Convert.ToInt32(cc.Active), Convert.ToInt32(cc.ProjectIdx), cc.Screen, txtUrl.Text, ddlParent.SelectedValue == "-1" ? 0 : Convert.ToInt32(ddlParent.SelectedValue), Convert.ToInt32(ddlIsParent.SelectedValue), txtIcon.Text, Convert.ToDecimal(txtSorting.Text));

                string message = " Add Successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                refreshText();
                fillgrid();

            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
            }
        }
        public void refreshText()
        {
            ddlProject.SelectedIndex = 0;
            txtScreen.Text = "";
            txtUrl.Text = "";
            ddlParent.SelectedIndex = 0;
            ddlIsParent.SelectedIndex = 0;
            txtIcon.Text = "";
            txtSorting.Text = "";
            chkActive.Checked = false;
        }

        private void DropDownProject()
        {
            dt = new DataTable();
            cc = new ClientClass();
            //cc.insertBlankIndex(dt);
            cc.getProject(dt);
            ddlProject.DataTextField = "PROJECT_DESC";
            ddlProject.DataValueField = "projectIdx";
            ddlProject.DataSource = dt;
            ddlProject.DataBind();
            ddlProject.Items.Insert(0, new ListItem("Select..", "-1"));

        }
        private void DropDownParent()
        {
            dt = new DataTable();
            cc = new ClientClass();            
            cc.getScreenParent(dt);
            ddlParent.DataTextField = "SCREEN_DESC";
            ddlParent.DataValueField = "IDX";
            ddlParent.DataSource = dt;
            ddlParent.DataBind();
            ddlParent.Items.Insert(0, new ListItem("Select..", "-1"));

        }

        public void fillgrid()
        {
            try
            {
                db = new dal();
                ds = new DataSet();
                cc = new ClientClass();
                cc.getScreen(ds);
                gvScreen.DataSource = ds;
                gvScreen.DataBind();

            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }        
    }
}