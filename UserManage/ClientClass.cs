using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Portfolio
{
    public class ClientClass
    {
        private dal db;
        private OracleCommand cmd;
        private string _userId;
        public string userId { get { return _userId; } set { _userId = value; } }

        private string _userName;
        public string userName { get { return _userName; } set { _userName = value; } }

        private string _Password;
        public string Password { get { return _Password; } set { _Password = value; } }

        private string _email;
        public string email { get { return _email; } set { _email = value; } }

        private string _ContactNo;
        public string ContactNo { get { return _ContactNo; } set { _ContactNo = value; } }

        private string _UserGroup;
        public string UserGroup { get { return _UserGroup; } set { _UserGroup = value; } }

        private string _Active;
        public string Active { get { return _Active; } set { _Active = value; } }

        private string _MappingType;
        public string MappingType { get { return _MappingType; } set { _MappingType = value; } }

        private string _MappingActive;
        public string MappingActive { get { return _MappingActive; } set { _MappingActive = value; } }

        private string _ProjectDesc;
        public string ProjectDesc { get { return _ProjectDesc; } set { _ProjectDesc = value; } }

        private string _Screen;
        public string Screen { get { return _Screen; } set { _Screen = value; } }

        private string _ProjectIdx;
        public string ProjectIdx { get { return _ProjectIdx; } set { _ProjectIdx = value; } }
        private string _ProjectName;
        public string ProjectName { get { return _ProjectName; } set { _ProjectName = value; } }

        private string _UserType;
        public string UserType { get { return _UserType; } set { _UserType = value; } }
        private string _ImagePath;
        public string ImagePath { get { return _ImagePath; } set { _ImagePath = value; } }
        private string _date;
        public string date { get { return _date; } set { _date = value; } }

        private string _ClientCode;
        public string ClientCode { get { return _ClientCode; } set { _ClientCode = value; } }


        public void insertUser()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_InsertUser";
            cmd.Parameters.Add("@UserType", UserType);
            cmd.Parameters.Add("@userId", userId);
            cmd.Parameters.Add("@userName", userName);
            cmd.Parameters.Add("@Password", Password);
            cmd.Parameters.Add("@email", email);
            cmd.Parameters.Add("@ContactNo", ContactNo);
            cmd.Parameters.Add("@imgPath", ImagePath);
            cmd.Parameters.Add("@ClientCode", ClientCode);

            db.runPro(cmd);


        }
        public void insertGroupUser()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_InsertUserGroup";
            cmd.Parameters.Add("@UserGroup", UserGroup);
            cmd.Parameters.Add("@Active", Active);
            db.runPro(cmd);


        }
        public void insertProjectMapping()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_InsertProjectMapping";
            cmd.Parameters.Add("@ProjectIdx", ProjectIdx);
            cmd.Parameters.Add("@MappingType", MappingType);
            cmd.Parameters.Add("@Active", MappingActive);
            cmd.Parameters.Add("@userId", userId);
            db.runPro(cmd);


        }
        public void insertProjectDesc()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_InsertProjectDesc";
            cmd.Parameters.Add("@ProjectDesc", ProjectDesc);
            cmd.Parameters.Add("@Act", Active);
            db.runPro(cmd);


        }


        //public void insertScreen()
        //{
        //    db = new dal();
        //    cmd = new OracleCommand();
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.CommandText = "HICL_PRO_InsertScreen";
        //    cmd.Parameters.Add("@Screen", OracleDbType.NVarchar2).Value = Screen;
        //   // cmd.Parameters.Add("@projectIdx", OracleDbType.NVarchar2).Value = ProjectIdx;
        //    cmd.Parameters.Add("@Actv", OracleDbType.Int32).Value = Active;
        //    db.runPro(cmd);


        //}
        public void getProjects(DataTable dt, string ProjectName)
        {
            db = new dal();
            string qry = @"select P.PROJECT_DESC,HPM.PROJECT_ID, HPM.MAPPING_TYPE,HPM.USER_ID,HPM.IS_ACTIVE
 ,Case When HPM.IS_ACTIVE=1 then 'YES' else 'NO'  end P_Active
  from HICL_Project_Mappings HPM
  INNER JOIN HICL_Projects P ON P.IDX=HPM.PROJECT_ID
   where p.PROJECT_DESC='[ProjectName]' AND HPM.IS_ACTIVE = '1' order by PROJECT_ID desc".Replace("[ProjectName]", ProjectName);
            db.getData(qry, dt);
        }

        public void getScreenParent(DataTable dt)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_GETPARENTMENUSNAME";
            cmd.Parameters.Add("@PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getData(cmd, dt);
        }

        public void getProjectMapping(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_GetProjectMapping";
            cmd.Parameters.Add("@ProjectName", ProjectName);
            cmd.Parameters.Add("prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }

        //HICL_PRO_GetUserProjectMapping

        public bool MappingAlreadyExists()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_GetUserProjectMapping";
            cmd.Parameters.Add("@ProjectIdx", ProjectIdx);
            cmd.Parameters.Add("@userId", userId);
            cmd.Parameters.Add("@prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            DataSet ds = new DataSet();
            db.getDataProcedure(cmd, ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            return false;


        }
        public bool UserAlreadyExists()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_GetGisUser";
            cmd.Parameters.Add("@user_Id", userId);
            cmd.Parameters.Add("@user_name", userName);
            cmd.Parameters.Add("@prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            DataSet ds = new DataSet();
            db.getDataProcedure(cmd, ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            return false;


        }
        public bool ProjectAlreadyExists()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_DuplicateProject";
            cmd.Parameters.Add("@projects", ProjectDesc);
            cmd.Parameters.Add("@prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            DataSet ds = new DataSet();
            db.getDataProcedure(cmd, ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            return false;


        }
        public bool GroupAlreadyExists()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_DuplicateGroup";
            cmd.Parameters.Add("@groupdesc", UserGroup);
            cmd.Parameters.Add("@prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            DataSet ds = new DataSet();
            db.getDataProcedure(cmd, ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            return false;


        }


        public void getProjectMappingAll(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_GetProjectMappingALL";
            cmd.Parameters.Add("prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }
        public void insertScreen(DataTable dt, int IsActive, int ProjectIdx, string ScreenName, string Url, int ParentId, int IsParent, string Icon, decimal Sorting)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_INSERTSCREENS";
            cmd.Parameters.Add("@SCREENNAME_", OracleDbType.NVarchar2, ScreenName, ParameterDirection.Input);
            cmd.Parameters.Add("@PROJECTIDX_", OracleDbType.Int32, ProjectIdx, ParameterDirection.Input);
            cmd.Parameters.Add("@URL_", OracleDbType.NVarchar2, Url, ParameterDirection.Input);
            cmd.Parameters.Add("@PARENTIDX_", OracleDbType.Int32, ParentId, ParameterDirection.Input);
            cmd.Parameters.Add("@ISPARENT_", OracleDbType.Int32, IsParent, ParameterDirection.Input);
            cmd.Parameters.Add("@ICON_", OracleDbType.NVarchar2, Icon, ParameterDirection.Input);
            cmd.Parameters.Add("@SORTING_", OracleDbType.Decimal, Sorting, ParameterDirection.Input);
            cmd.Parameters.Add("@ISACTIVE_", OracleDbType.Int32, IsActive, ParameterDirection.Input);
            db.runPro(cmd);
        }

        public void getAllProject(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_GetProjects";
            cmd.Parameters.Add("prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }
        public void getScreen(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_GetScreen";
            cmd.Parameters.Add("prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }
        public void getGroup(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_UserGroup";
            cmd.Parameters.Add("prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }
        public void getControls(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_GETCONTROLS";
            cmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }
        public void getControlsGroupMapping(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "hicl_pro_getcntr_mappinggroup";
            cmd.Parameters.Add("prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }
        public void getUserDetail(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_PRO_UserDetails";
            cmd.Parameters.Add("prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }
        public void getUserType(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HICL_Pro_GetUserTypes";
            cmd.Parameters.Add("prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }



        public void getActivityDetail(DataSet ds)
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "";
            cmd.Parameters.Add("@user_id", userId);
            cmd.Parameters.Add("@ProjDesc", ProjectDesc);
            cmd.Parameters.Add("@Date", date);
            cmd.Parameters.Add("prc", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            db.getDataProcedure(cmd, ds);

        }





        public void getGISUserId(DataTable dt)
        {
            db = new dal();
            string qry = "select SUS_USERCODE,SUS_NAME from SH_SM_US_USER order by SUS_USERCODE asc ";
            db.getData(qry, dt);
        }


        public void getUserId(DataTable dt)
        {
            db = new dal();
            string qry = "select USERID,USERNAME from HICL_USERS order by USERID asc ";
            db.getData(qry, dt);
        }

        public void getProjectDrop(DataTable dt)
        {
            db = new dal();
            string qry = "select distinct IDX,PROJECT_DESC from HICL_PROJECTS";
            db.getData(qry, dt);
        }
        public void getProject(DataTable dt)
        {
            db = new dal();
            string qry = "select IDX as projectIdx, PROJECT_DESC from HICL_PROJECTS ";
            db.getData(qry, dt);
        }
        public void getScreensDrp(DataTable dt, string filter)
        {
            db = new dal();
            string qry = "SELECT ROWID, CAST(H.IDX as NVARCHAR2(100)) as IDX, H.IS_ACTIVE, H.SCREEN_DESC, H.PROJECTIDX FROM HIL.HICL_SCREENS H Where PROJECTIDX = '" + filter + "' AND IS_ACTIVE = 1 ORDER BY IDX";
            db.getData(qry, dt);
        }
        public void getUserGroupDrp(DataTable dt)
        {
            db = new dal();
            string qry = "SELECT ROWID, CAST(H.IDX as NVARCHAR2(100)) as IDX, H.GROUP_DESC, H.IS_ACTIVE FROM HIL.HICL_USERGROUPS H Where IS_ACTIVE = 1 ORDER BY IDX";
            db.getData(qry, dt);
        }
        public void getControlsDrp(DataTable dt)
        {
            db = new dal();
            string qry = "SELECT ROWID, CAST(H.IDX as NVARCHAR2(100)) as IDX, H.CONTROLS FROM HIL.HICL_CONTROLS H ORDER BY IDX";
            db.getData(qry, dt);
        }
        public void getTabsDrp(DataTable dt)
        {
            db = new dal();
            string qry = "SELECT H.IDX, H.TABNAME FROM HIL.HICL_TABS H WHERE H.ISACTIVE = 1";
            db.getData(qry, dt);
        }
        public void getTabsContentDrp(DataTable dt)
        {
            db = new dal();
            string qry = "SELECT H.IDX, H.DESCRIPTION FROM HIL.HICL_TABS_CONTENT H WHERE H.ISACTIVE = 1 ORDER BY IDX";
            db.getData(qry, dt);
        }
        public DataTable insertBlankIndex(DataTable dt)
        {
            DataRow dt_new = dt.NewRow();
            dt.Rows.InsertAt(dt_new, 0);


            return dt;
        }

        public void BindDropDown(DropDownList drpObject, object dataSource, string value, string text, string customSelectText = "-- Select --", string customSelectValue = "0")
        {
            drpObject.DataSource = dataSource;
            drpObject.DataTextField = text;
            drpObject.DataValueField = value;
            drpObject.DataBind();
            var li = new ListItem { Text = customSelectText, Value = customSelectValue };
            drpObject.Items.Insert(0, li);
        }

        public class BindControls
        {
            public string idx { get; set; }
            public string project_desc { get; set; }
            public string screen_desc { get; set; }
            public string controls { get; set; }
        }

        public class BindControlsGroupMapping
        {
            public string idx { get; set; }
            public string controls { get; set; }
            public string group_desc { get; set; }
        }
    }
}