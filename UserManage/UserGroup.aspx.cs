using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Portfolio;

namespace ClientManagement
{
    public partial class UserGroup : System.Web.UI.Page
    {
        private dal db;
        private ClientClass cc;
        private DataTable dt;
        private DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                cc.UserGroup = txtGroup.Text;
                if (chkActive.Checked == true)
                {
                    cc.Active = "1";
                }
                else
                {
                    cc.Active = "0";
                }
                if (cc.GroupAlreadyExists() == true)
                {
                    string message1 = "alert('Group Already Exist.')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message1, true);
                    refreshText();
                }
                else {
                    cc.insertGroupUser();
                    string message = " Add Successfully.";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                    refreshText();
                    fillgrid();
                }
            

            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
            }
        }
        public void refreshText()
        {
            txtGroup.Text = "";
            chkActive.Checked = false;

        }

        public void fillgrid()
        {
            try
            {
                db = new dal();
                ds = new DataSet();
                cc = new ClientClass();
                cc.getGroup(ds);
                gvGroup.DataSource = ds;
                gvGroup.DataBind();

            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

        }
    }
}