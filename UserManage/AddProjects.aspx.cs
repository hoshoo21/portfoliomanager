using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio
{
    public partial class AddProjects : System.Web.UI.Page
    {
        private dal db;
        private ClientClass cc;
        private DataTable dt;
        private DataSet ds;
        string constr = System.Configuration.ConfigurationManager.AppSettings["DashBoard"];
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
                cc.ProjectDesc = txtProject.Text;
                if (chkActive.Checked == true)
                {
                    cc.Active = "1";
                }
                else
                {
                    cc.Active = "0";
                }

                if (cc.ProjectAlreadyExists() == true)
                {
                    string message1 = "alert('Project Already Exist.')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message1, true);
                    refreshText();

                }
                else
                {
                    cc.insertProjectDesc();
                    string message = " Add Successfully.";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

                    // lblMsg.Text = "Add Successfully";
                    refreshText();
                    fillgrid();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
            }
        }

        public void fillgrid()
        {
            try
            {
                db = new dal();
                ds = new DataSet();
                cc = new ClientClass();
                cc.getAllProject(ds);
                gvProject.DataSource = ds;
                gvProject.DataBind();

            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

        }



        public void refreshText()
        {
            txtProject.Text = "";
            chkActive.Checked = false;
        }

    }
}