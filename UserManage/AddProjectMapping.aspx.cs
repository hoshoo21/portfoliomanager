using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Portfolio;

namespace Portfolio
{
    public partial class AddProjectMapping : System.Web.UI.Page
    {
        private dal db;
        private ClientClass cc;
        private DataTable dt;
        private DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropdown();
                dropdownProject();
                dropdownProjectMapping();
                fillgridProjectMappingAll();


            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                db = new dal();
                dt = new DataTable();
                cc = new ClientClass();
                cc.MappingType = ddlMapping.SelectedItem.ToString();
                cc.userId = ddlUser.Text;
                cc.ProjectIdx = ddlProject.SelectedValue;
                if (chkActive.Checked == true)
                {
                    cc.MappingActive = "1";
                }
                else
                {
                    cc.MappingActive = "0";
                }

                //if (cc.MappingAlreadyExists() == true)
                //{
                //    string message1 = "alert('Record Already Exist.')";
                //    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message1, true);
                //    refreshText();
                //    fillgrid();
                //}
                //else
                //{
                    cc.insertProjectMapping();
                    string message = "alert('Add Successfully.')";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                    refreshText();
                    fillgrid();
                    fillgridProjectMappingAll();
              
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
            }
        }

        public void dropdownProjectMapping()
        {
            ddlMapping.Items.Insert(0, new ListItem("Select..", "-1"));
        }
        private void dropdown()
        {
            dt = new DataTable();
            cc = new ClientClass();
            cc.getUserId(dt);
            ddlUser.DataTextField = "USERNAME";
            ddlUser.DataValueField = "USERID";
            ddlUser.DataSource = dt;
            ddlUser.DataBind();
            ddlUser.Items.Insert(0, new ListItem("Select..", "-1"));

        }
        private void dropdownProject()
        {
            dt = new DataTable();
            cc = new ClientClass();
            cc.getProjectDrop(dt);
            ddlProject.DataTextField = "PROJECT_DESC";
            ddlProject.DataValueField = "IDX";

            ddlProject.DataSource = dt;
            ddlProject.DataBind();
            ddlProject.Items.Insert(0, new ListItem("Select..", "-1"));

        }

        public void refreshText()
        {

            ddlUser.SelectedIndex = ddlMapping.SelectedIndex = 0;
            ddlProject.SelectedIndex = 0;
            chkActive.Checked = false;
        }
        public void fillgrid()
        {
            try
            {
                string projName = ddlProject.SelectedItem.ToString();
                db = new dal();
                dt = new DataTable();
                cc = new ClientClass();
                cc.getProjects(dt, projName);
                gvProject.DataSource = dt;
                gvProject.DataBind();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

        }
        public void fillgridProjectMappingAll()
        {
            try
            {
                db = new dal();
                ds = new DataSet();
                cc = new ClientClass();
                cc.getProjectMappingAll(ds);
                gvProject.DataSource = ds;
                gvProject.DataBind();

            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }

        }

        protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
           fillgrid();
        }        
    }
}