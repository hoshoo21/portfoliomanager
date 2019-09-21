using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess;
using System.Data;
using Oracle.ManagedDataAccess.Client;


namespace Portfolio
{
    public class dal
    {

        private OracleConnection con;
        private OracleCommand cmd;
        private OracleDataAdapter adp;
        private string _compcik;
        public string compcik { get { return _compcik; } set { _compcik = value; } }

        private string _naicsCode;
        public string naicsCode { get { return _naicsCode; } set { _naicsCode = value; } }
        private string _compCode;
        public string compCode { get { return _compCode; } set { _compCode = value; } }

        private string _parameterType;
        public string parameterType { get { return _parameterType; } set { _parameterType = value; } }
      
        private string _year;
        public string year { get { return _year; } set { _year = value; } }
        private string _ContextCode;
        public string ContextCode { get { return _ContextCode; } set { _ContextCode = value; } }
        private string _fiscalYear;
        public string fiscalYear { get { return _fiscalYear; } set { _fiscalYear = value; } }
        private string _eleNature;
        public string eleNature { get { return _eleNature; } set { _eleNature = value; } }
        private string _eleName;
        public string eleName { get { return _eleName; } set { _eleName = value; } }

        private string _parentName;
        public string parentName { get { return _parentName; } set { _parentName = value; } }

        private string _eleVal1;
        public string eleVal1 { get { return _eleVal1; } set { _eleVal1 = value; } }

        private string _eleVal2;
        public string eleVal2 { get { return _eleVal2; } set { _eleVal2 = value; } }

        private string _CountCode;
        public string CountCode { get { return _CountCode; } set { _CountCode = value; } }

        private string _active;
        public string active { get { return _active; } set { _active = value; } }

        private string _eleVal3;
        public string eleVal3 { get { return _eleVal3; } set { _eleVal3 = value; } }

        private string _eleVal4;
        public string eleVal4 { get { return _eleVal4; } set { _eleVal4 = value; } }

        private string _eleVal5;
        public string eleVal5 { get { return _eleVal5; } set { _eleVal5 = value; } }


        private string _unitCode;
        public string unitCode { get { return _unitCode; } set { _unitCode = value; } }

        private string _decRounding;
        public string decRounding { get { return _decRounding; } set { _decRounding = value; } }


        private string _accType;
        public string accType { get { return _decRounding; } set { _accType = value; } }

        private string _ReptQua;


        public string ReptQua { get { return _ReptQua; } set { _ReptQua = value; } }

        private string _CreatDate;
        public string CreatDate { get { return _CreatDate; } set { _CreatDate = value; } }

        private string _Productidx;
        public string Productidx { get { return _Productidx; } set { _Productidx = value; } }


        private string _compName;
        public string compName { get { return _compName; } set { _compName = value; } }



        private string _compSymbol;
        public string compSymbol { get { return _compSymbol; } set { _compSymbol = value; } }


        private string _ntn;
        public string ntn { get { return _ntn; } set { _ntn = value; } }

        private string _indCode;
        public string indCode { get { return _indCode; } set { _indCode = value; } }
        private string _sector;
        public string sector { get { return _sector; } set { _sector = value; } }

        private string _countReg;
        public string countReg { get { return _countReg; } set { _countReg = value; } }

        private string _regNo;
        public string regNo { get { return _regNo; } set { _regNo = value; } }


        private string _PassEndDate;
        public string PassEndDate { get { return _PassEndDate; } set { _PassEndDate = value; } }


        private string _stateLoc;
        public string stateLoc { get { return _stateLoc; } set { _stateLoc = value; } }

        private string _sataInc;
        public string sataInc { get { return _sataInc; } set { _sataInc = value; } }

        private string _LocFlag;
        public string LocFlag { get { return _LocFlag; } set { _LocFlag = value; } }

        private string _annualRep;
        public string annualRep { get { return _annualRep; } set { _annualRep = value; } }

        private string _mc;
        public string mc { get { return _mc; } set { _mc = value; } }

        private string _oclause;
        public string oclause { get { return _oclause; } set { _oclause = value; } }

        private string _count;
        public string count { get { return _count; } set { _count = value; } }

        private string _stockExc;
        public string stockExc { get { return _stockExc; } set { _stockExc = value; } }

        private string _repCurrency;
        public string repCurrency { get { return _repCurrency; } set { _repCurrency = value; } }


        private string _structure;
        public string structure { get { return _structure; } set { _structure = value; } }

        private string _structureVal;
        public string structureVal { get { return _structureVal; } set { _structureVal = value; } }
       
        private string _Product;
        public string Product { get { return _Product; } set { _Product = value; } }
        private string _Active;
        public string Active { get { return _Active; } set { _Active = value; } }
        private string _EMG_CODE;
        public string EMG_CODE { get { return _EMG_CODE; } set { _EMG_CODE = value; } }
        private string _Category;
        public string Category { get { return _Category; } set { _Category = value; } }
        private string _CatCode;
        public string CatCode { get { return _CatCode; } set { _CatCode = value; } }
        private string _GeneralExpert;
        public string GeneralExpert { get { return _GeneralExpert; } set { _GeneralExpert = value; } }
        private string _Company;
        public string Company { get { return _Company; } set { _Company = value; } }
        private string _Ntn;
        public string Ntn { get { return _Ntn; } set { _Ntn = value; } }
        private string _CCODE;
        public string CCODE { get { return _CCODE; } set { _CCODE = value; } }
        private string _InSource;
        public string InSource { get { return _InSource; } set { _InSource = value; } }
        private string _IScode;
        public string IScode { get { return _IScode; } set { _IScode = value; } }


        private string _ptcode;
        public string ptcode { get { return _ptcode; } set { _ptcode = value; } }


        private string _paymentType;
        public string paymentType { get { return _paymentType; } set { _paymentType = value; } }

        private string _clientCode;
        public string clientCode { get { return _clientCode; } set { _clientCode = value; } }

        private string _clientname;
        public string clientname { get { return _clientname; } set { _clientname = value; } }

        private string _JoinClient;
        public string JoinClient { get { return _JoinClient; } set { _JoinClient = value; } }


        private string _Address;
        public string Address { get { return _Address; } set { _Address = value; } }


        private string _phoneNO;
        public string phoneNO { get { return _phoneNO; } set { _phoneNO = value; } }

        private string _nic;
        public string nic { get { return _nic; } set { _nic = value; } }

        private string _value2;
        public string value2 { get { return _value2; } set { _value2 = value; } }
        private string _symb;
        public string symb { get { return _symb; } set { _symb = value; } }

        private string _RSCODE;
        public string RSCODE { get { return _RSCODE; } set { _RSCODE = value; } }

        private string _Relationship;
        public string Relationship { get { return _Relationship; } set { _Relationship = value; } }

        private string _BDCODE;
        public string BDCODE { get { return _BDCODE; } set { _BDCODE = value; } }

        private string _Bank;
        public string Bank { get { return _Bank; } set { _Bank = value; } }

        private string _Broker;
        public string Broker { get { return _Broker; } set { _Broker = value; } }

      

        private string _rate1;
        public string rate1 { get { return _rate1; } set { _rate1 = value; } }

        private string _rate2;
        public string rate2 { get { return _rate2; } set { _rate2 = value; } }

        private string _ordertype;
        public string ordertype { get { return _ordertype; } set { _ordertype = value; } }
        private string _act;
        public string act { get { return _act; } set { _act = value; } }
        private string _creatuserid;
        public string creatuserid { get { return _creatuserid; } set { _creatuserid = value; } }

        private string _creatDate;
        public string creatDate { get { return _creatDate; } set { _creatDate = value; } }
     

        private string _purchaseDate;
        public string purchaseDate { get { return _purchaseDate; } set { _purchaseDate = value; } }

        private string _PurchaseQuant;
        public string PurchaseQuant { get { return _PurchaseQuant; } set { _PurchaseQuant = value; } }
        private string _Rate;
        public string Rate { get { return _Rate; } set { _Rate = value; } }
        private string _location;
        public string location { get { return _location; } set { _location = value; } }

        private string _brokercode;
        public string brokercode { get { return _brokercode; } set { _brokercode = value; } }
        private string _orderdate;
        public string orderdate { get { return _orderdate; } set { _orderdate = value; } }

        private string _phoneNo;
        public string phoneNo { get { return _phoneNo; } set { _phoneNo = value; } }

        private string _CondCode;
        public string CondCode { get { return _CondCode; } set { _CondCode = value; } }
        private string _email;
        public string email { get { return _email; } set { _email = value; } }
        private string _Condition;
        public string Condition { get { return _Condition; } set { _Condition = value; } }

        private string _ValueCode;
        public string ValueCode { get { return _ValueCode; } set { _ValueCode = value; } }
        private string _Value;
        public string Value { get { return _Value; } set { _Value = value; } }


        private string _critCode;
        public string critCode { get { return _critCode; } set { _critCode = value; } }

        private string _criteria;
        public string criteria { get { return _criteria; } set { _criteria = value; } }

        private string _ecgCode;
        public string ecgCode { get { return _ecgCode; } set { _ecgCode = value; } }
        private string _emgCode;
        public string emgCode { get { return _emgCode; } set { _emgCode = value; } }

        private string _orderType;
        public string orderType { get { return _orderType; } set { _orderType = value; } }
        private string _orderTypeCode;
        public string orderTypeCode { get { return _orderTypeCode; } set { _orderTypeCode = value; } }

        private string _ActionTypeCode;
        public string ActionTypeCode { get { return _ActionTypeCode; } set { _ActionTypeCode = value; } }

        private string _ActionType;
        public string ActionType { get { return _ActionType; } set { _ActionType = value; } }

        private string _Timming;
        public string Timming { get { return _Timming; } set { _Timming = value; } }

        private string _TimmingCode;
        public string TimmingCode { get { return _TimmingCode; } set { _TimmingCode = value; } }

        private string _OrderProgress;
        public string OrderProgress { get { return _OrderProgress; } set { _OrderProgress = value; } }
        private string _OrderProgressCode;
        public string OrderProgressCode { get { return _OrderProgressCode; } set { _OrderProgressCode = value; } }

        private string _orderid;
        public string orderid { get { return _orderid; } set { _orderid = value; } }

        private string _ExpertCriteriaGeneralCode;
        public string ExpertCriteriaGeneralCode { get { return _ExpertCriteriaGeneralCode; } set { _ExpertCriteriaGeneralCode = value; } }
        string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
        string constrXBRL = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
        public bool getData(string query, DataTable dt)
        {

            con = new OracleConnection(constr);
            cmd = new OracleCommand(query);
            cmd.Connection = con;
            adp = new OracleDataAdapter(cmd);
            con.Open();
            adp.Fill(dt);
            con.Close();
            return true;
        }
        public bool getDataXBRL(string query, DataTable dt)
        {

            con = new OracleConnection(constrXBRL);
            cmd = new OracleCommand(query);
            cmd.Connection = con;
            adp = new OracleDataAdapter(cmd);
            con.Open();
            adp.Fill(dt);
            con.Close();
            return true;
        }
        public bool getData(OracleCommand cmd, DataTable dt)
        {

            con = new OracleConnection(constr);

            cmd.Connection = con;
            adp = new OracleDataAdapter(cmd);
            con.Open();
            adp.Fill(dt);
            con.Close();
            return true;
        }



        public bool getData(string query, DataSet ds)
        {

            con = new OracleConnection(constr);
            cmd = new OracleCommand(query);
            cmd.Connection = con;
            adp = new OracleDataAdapter(cmd);
            con.Open();
            adp.Fill(ds);
            con.Close();
            return true;
        }
        public bool runPro(OracleCommand cmd)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return true;

        }
        public bool runProPortfolio(OracleCommand cmd)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return true;
            
        }
        public bool runProXbrl(OracleCommand cmd)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return true;

        }
        public string runProcAndGetValue(OracleCommand cmd)
        {
            con = new OracleConnection(constr);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteScalar();
            con.Close();
            return cmd.Parameters[0].Value.ToString();
        }

        public bool getDataProcedure(OracleCommand cmd, DataSet ds) //all data from a dataset
        {

            con = new OracleConnection(constr);
            cmd.Connection = con;
            adp = new OracleDataAdapter(cmd);
            con.Open();
            adp.Fill(ds);
            con.Close();
            return true;
        }



        //Product//
        public DataTable InsertProduct()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_InsertProduct";
                objCmd.Parameters.Add("@productname", Product);
                objCmd.Parameters.Add("@active", Active);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        public DataTable GetProductDetail()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetProduct";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteProduct()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteProduct";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@Pcode", Productidx);



                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateProduct()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PF_UpdateProduct";
                objCmd.Parameters.Add("@Pcode", Productidx);
                objCmd.Parameters.Add("@productname", Product);
                objCmd.Parameters.Add("@act", Active);



                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }

        //General Expert//

        public DataTable GetGeneralExpertDetail()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetGeneralExpert";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteGeneralExpert()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteGeneralExpert";
                objCmd.Parameters.Add("@emgCode", EMG_CODE);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateGeneralExpert()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateGeneralExpert";
                objCmd.Parameters.Add("@emgCode", EMG_CODE);
                objCmd.Parameters.Add("@proGenerlExptductname", GeneralExpert);
                objCmd.Parameters.Add("@act", Active);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }



        //Company//

        public DataTable GetCompanyDetail()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCompany";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteCompany()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteCompany";
                objCmd.Parameters.Add("@comCode", CCODE);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateCompany()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateCompany";
                objCmd.Parameters.Add("@comCode", CCODE);
                objCmd.Parameters.Add("@companyName", Company);
                objCmd.Parameters.Add("@ntn_no", Ntn);
                objCmd.Parameters.Add("@act", Active);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }



        //income sourece//
        public DataTable GetIncomeSource()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_GetIncomeSource";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteIncomeSource()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteIncomeSource";
                objCmd.Parameters.Add("@iscode", IScode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateIncomeSource()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateIncomeSource";
                objCmd.Parameters.Add("@iscode", IScode);
                objCmd.Parameters.Add("@insource", InSource);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }

        //Payment Type//


        public DataTable GetPayment()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_GetPaymentType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeletePayment()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeletePaymentType";
                objCmd.Parameters.Add("@ptcode", ptcode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdatePayment()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdatePaymentType";
                objCmd.Parameters.Add("@ptcode", ptcode);
                objCmd.Parameters.Add("@payType", paymentType);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }

        // Join CLient //


        public DataTable GetJointClient()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetJoinClient";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteJointClient()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteJoinClient";
                objCmd.Parameters.Add("@client_code", clientCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateJointClient()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateJoinClient";
                objCmd.Parameters.Add("@jointClient", JoinClient);
                objCmd.Parameters.Add("@adress", Address);
                objCmd.Parameters.Add("@phone_no", phoneNO);
                objCmd.Parameters.Add("@nic_no", nic);
                objCmd.Parameters.Add("@clientcode", clientCode);
                objCmd.Parameters.Add("@act", Active);

                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }

        public DataTable GetClientDet()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetClient";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        //RelationShip //
        public DataTable GetRelationShip()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetRelationship";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteRelationShip()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteRelationShip";
                objCmd.Parameters.Add("@rscode", RSCODE);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateRelationShip()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateRelationShip";
                objCmd.Parameters.Add("@relShip", Relationship);
                objCmd.Parameters.Add("@rscode", RSCODE);

                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        // Bank Detail///

        public DataTable GetBankDetail()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetBank";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteBankDetail()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteBank";
                objCmd.Parameters.Add("@bdcode", BDCODE);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateBankDetail()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateBank";
                objCmd.Parameters.Add("@bank", Bank);
                objCmd.Parameters.Add("@bdcode", BDCODE);

                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }



        // Broker///
        public DataTable GetBroker()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetBroker";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteBroker()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteBroker";
                objCmd.Parameters.Add("@brocode", brokercode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateBroker()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateBroker";
                objCmd.Parameters.Add("@broker", Broker);
                objCmd.Parameters.Add("@ntn_no", ntn);
                objCmd.Parameters.Add("@loc", location);
                objCmd.Parameters.Add("@phoNo", phoneNo);
                objCmd.Parameters.Add("@email", email);
                objCmd.Parameters.Add("@brokCode", brokercode);
                objCmd.Parameters.Add("@act", Active);

                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        // Condition ///
        public DataTable GetCondition()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCondition";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteCondition()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteCondition";
                objCmd.Parameters.Add("@CondCode", CondCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateCondition()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateCondition";
                objCmd.Parameters.Add("@Cond", Condition);
                objCmd.Parameters.Add("@act", Active);
                objCmd.Parameters.Add("@CondCode", CondCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        // Value////
        public DataTable GetValue()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetValue";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteValue()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteValue";
                objCmd.Parameters.Add("@valCode", ValueCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateValue()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateValue";
                objCmd.Parameters.Add("@val", Value);
                objCmd.Parameters.Add("@act", Active);
                objCmd.Parameters.Add("@ValCode", ValueCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        // Criteria///
        public DataTable GetCriteria()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCriteria";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        public DataTable GetCriteriaAll()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCriteriaALl";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public DataTable GetCriteriaDetail(string critValue)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCriteriaDetails";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@critCode", critValue+"%");
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteCriteria()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteCriteria";
                objCmd.Parameters.Add("@critCode", critCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateCriteria()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateCriteria";
                objCmd.Parameters.Add("@crit", criteria);
                objCmd.Parameters.Add("@act", Active);
                objCmd.Parameters.Add("@CritCode", critCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }

        public string DeleteClient()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_Deleteclient";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@clientcode", clientCode);



                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateClient()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateClient";
                objCmd.Parameters.Add("@Cname", clientname);
                objCmd.Parameters.Add("@nicNo", nic);
                objCmd.Parameters.Add("@NtnNo", ntn);
                objCmd.Parameters.Add("@act", Active);
                objCmd.Parameters.Add("@ClientCode", clientCode);

                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        ///Value Condition///
        public DataTable GetValCondition()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetvalueCondition";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        public string DeleteCondValue()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteCondValue";
                objCmd.Parameters.Add("@CondValcode", CondCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateValCondition()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateValCond";
                objCmd.Parameters.Add("@val", Value);
                objCmd.Parameters.Add("@crit", criteria);
                objCmd.Parameters.Add("@valCod", ValueCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        // Genral Expert MAster///
        public DataTable GetGenExptDetail()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetGeneralExpertDetail";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteGenExptDetail(string edgCode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteGeneralEpertDet";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@edgs", edgCode);


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }
        public string UpdateGenExptDetail(string company, string Product, string expertMastDet, string edgCode, string act,string category)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateGeneralExpertDet";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@comp", company);
                objCmd.Parameters.Add("@prod", Product);
                objCmd.Parameters.Add("@exptmast", expertMastDet);
                objCmd.Parameters.Add("@egdcode", edgCode);
                objCmd.Parameters.Add("@act", act);
                objCmd.Parameters.Add("@cat", category);

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }



        public DataTable GetCriteriaValue()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCriteriavalue";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@criCode", critCode);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }


        public DataTable GetGenExpertCrit()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_GetExpertCriteriaGeneral";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@emgcode", emgCode);
                objCmd.Parameters.Add("@parameterType", parameterType);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dt);

                }
                catch (Exception ex)
                {
                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }
            return dt;
        }
        //public DataTable GetGenExpertCrit()
        //{
        //    string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
        //    con = new OracleConnection(constr);
        //    DataSet dataset = new DataSet("Table1");
        //    using (OracleConnection objConn = new OracleConnection(constr))
        //    {
        //        OracleCommand objCmd = new OracleCommand();
        //        objCmd.Connection = objConn;
        //        objCmd.CommandText = "PF_GetExpertCriteriaGeneral";
        //        objCmd.CommandType = CommandType.StoredProcedure;
        //        objCmd.Parameters.Add("@emgcode", emgCode);
        //        objCmd.Parameters.Add("@parameterType", parameterType);
        //        objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

        //        try
        //        {
        //            objConn.Open();
        //            objCmd.ExecuteNonQuery();
        //            OracleDataAdapter da = new OracleDataAdapter(objCmd);
        //            da.Fill(dataset);
        //        }

        //        catch (Exception ex)

        //        {

        //            System.Console.WriteLine("Exception: {0}", ex.ToString());

        //        }

        //        objConn.Close();

        //    }
        //    if (dataset.Tables.Contains("Table1"))
        //    {
        //        return dataset.Tables[0];

        //    }
        //    else
        //    {
        //        return null;
        //    }
          
        //}


        //// Order Type///
        public DataTable GetOrderType()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetOrderType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteOrderType()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteOrderType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@orderTypecode", orderTypeCode);


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }
        public string UpdateOrderType()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateOrderType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@orderTypeCode", orderTypeCode);
                objCmd.Parameters.Add("@orderType", orderType);

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        /// Action Type///
        /// 

        public DataTable GetActionType()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetActionType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteActionType()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteActionType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@ActionTypeCode", ActionTypeCode);


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }
        public string UpdateActionType()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateActionType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@ActionTypeCode", ActionTypeCode);
                objCmd.Parameters.Add("@ActionType", ActionType);

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        /// Timming ///
        /// 


        public DataTable GetTimming()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetTimming";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteTimming()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteTimming";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@TimmingCode", TimmingCode);


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }
        public string UpdateTimming()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateTimming";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@TimmingCode", TimmingCode);
                objCmd.Parameters.Add("@Timming", Timming);

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }

        /// <summary>
        ///  Order Progress////
        ///  
        /// </summary>
        /// 
        public DataTable GetOrderProgress()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetOrderProgress";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteOrderProgress()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteOrderProgress";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@OrderProgressCode", OrderProgressCode);


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }
        public string UpdateOrderProgress()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateOrderProgress";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@OrderProgressCode", OrderProgressCode);
                objCmd.Parameters.Add("@OrderProgress", OrderProgress);

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        public DataTable GetOrders()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetOrders";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        public DataTable GetPurchaseOrder()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetPurchaseOrder";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@orderid", orderid);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        public string DeleteEGC()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteExpertGeneralCriteria";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@egcCode", ExpertCriteriaGeneralCode);


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }


        public string UpdateEGC()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateExpertGeneralCriteria";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@criteria", critCode);
                objCmd.Parameters.Add("@condition", CondCode);
                objCmd.Parameters.Add("@value1", Value);
                objCmd.Parameters.Add("@value2", value2);
                objCmd.Parameters.Add("@Active", Active);
                objCmd.Parameters.Add("@ExpertCriteriaGeneralCode", ExpertCriteriaGeneralCode);
                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        public string DeleteOrder()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteOrder";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@orderid", orderid);


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateOrder()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateOrder";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@clientCode", clientCode);
                objCmd.Parameters.Add("@ActionType", ActionType);
                objCmd.Parameters.Add("@symb", symb);
                objCmd.Parameters.Add("@orderdate", orderdate);
                objCmd.Parameters.Add("@PurchaseQuant", PurchaseQuant);
                objCmd.Parameters.Add("@rate1", rate1);
                objCmd.Parameters.Add("@rate2", rate2);
                objCmd.Parameters.Add("@orderType", orderType);
                objCmd.Parameters.Add("@orderid", orderid);
                objCmd.Parameters.Add("@OrderProgress", OrderProgress);
                
                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }


        public DataTable CriteroiaAlready(string critcode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_GetchkCritAlready";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@cricode", critcode);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }


        //Category//
     
        public DataTable GetCategory()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCategory";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string DeleteCategory()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteCategory";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@catcode", CatCode);



                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string UpdateCategory()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PF_UpdateCategory";
                objCmd.Parameters.Add("@catcode", CatCode);
                objCmd.Parameters.Add("@cat", Category);
                objCmd.Parameters.Add("@act", Active);



                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Update";
        }



        //Product//
      
        public DataTable GetSector()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetSector";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public DataTable GetCompanyXBRL()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCompany";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        public DataTable GetIndustory()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetIndustory";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        public DataTable GetstockExchange(string CountCode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetstockExchange";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@countCode", CountCode);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

      


        public string GInsertMultYearInterface()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertMultiYearInter";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@compcik", compcik);
                objCmd.Parameters.Add("@compCode", compCode);
                objCmd.Parameters.Add("@eleNature", eleNature);
                objCmd.Parameters.Add("@eleName", eleName);
                objCmd.Parameters.Add("@parentName", parentName);
                objCmd.Parameters.Add("@eleVal1", eleVal1);
                objCmd.Parameters.Add("@eleVal2", eleVal2);
                objCmd.Parameters.Add("@eleVal3", eleVal3);
                objCmd.Parameters.Add("@eleVal4", eleVal4);
                objCmd.Parameters.Add("@eleVal5", eleVal5);
                objCmd.Parameters.Add("@unitCode", unitCode);
                objCmd.Parameters.Add("@decRounding", decRounding);
                objCmd.Parameters.Add("@accType", accType);
                objCmd.Parameters.Add("@ReptQua", ReptQua);
                objCmd.Parameters.Add("@CreatDate", CreatDate);

                objCmd.Parameters.Add("@year_desc", year);
                objCmd.Parameters.Add("@contextCode", CondCode);
                objCmd.Parameters.Add("@fiscalYear", fiscalYear);

                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "Save";
        }
        public DataTable GetCountrySpecific()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCountrySpecific";
                objCmd.CommandType = CommandType.StoredProcedure;
                //objCmd.Parameters.Add("@CountCode", CountCode);

                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        public DataTable GetCountry()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCountry";
                objCmd.CommandType = CommandType.StoredProcedure;


                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }
        public DataTable GetCompanyDetailXBRL()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCompanyDetail";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@compCode", compCode);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }


        public string DeleteCompanyXBRL()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteCompany";
                objCmd.Parameters.Add("@compCode", compCode);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string InsertIncomeSource()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertCompany";
                objCmd.Parameters.Add("@compCode", compCode);
                objCmd.Parameters.Add("@compName", compName);
                objCmd.Parameters.Add("@compSymbol", compSymbol);
                objCmd.Parameters.Add("@regNo", regNo);
                objCmd.Parameters.Add("@ntnNo", ntn);
                objCmd.Parameters.Add("@indCode", indCode);
                objCmd.Parameters.Add("@sector", sector);
                objCmd.Parameters.Add("@countReg", countReg);
                objCmd.Parameters.Add("@PassEndDate", PassEndDate);
                objCmd.Parameters.Add("@stateLoc", stateLoc);
                objCmd.Parameters.Add("@sataInc", sataInc);
                //objCmd.Parameters.Add("@creatDate", DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss"));
                objCmd.Parameters.Add("@creUSer", "");
                objCmd.Parameters.Add("@LocFlag", LocFlag);
                objCmd.Parameters.Add("@annualRep", annualRep);
                objCmd.Parameters.Add("@mcCode", mc);
                objCmd.Parameters.Add("@oclause", oclause);
                objCmd.Parameters.Add("@countory", count);
                objCmd.Parameters.Add("@stockExc", stockExc);
                objCmd.Parameters.Add("@repCurrency", repCurrency);
                objCmd.Parameters.Add("@naicsCode", naicsCode);


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }
            return "ADD";
        }


        public string UpdateCompanyXBRL()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateCompany";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@compCode", compCode);
                objCmd.Parameters.Add("@compName", compName);
                objCmd.Parameters.Add("@compSymbol", compSymbol);
                objCmd.Parameters.Add("@regNo", regNo);
                objCmd.Parameters.Add("@ntnNo", ntn);
                objCmd.Parameters.Add("@indCode", indCode);
                objCmd.Parameters.Add("@sector", sector);
                objCmd.Parameters.Add("@countReg", countReg);
                objCmd.Parameters.Add("@PassEndDate", PassEndDate);
                objCmd.Parameters.Add("@stateLoc", stateLoc);
                objCmd.Parameters.Add("@sataInc", sataInc);
                DateTime UpdateDate = DateTime.Now;
                objCmd.Parameters.Add("@UpdateDate", UpdateDate);
                objCmd.Parameters.Add("@UpdateUSer", "");
                objCmd.Parameters.Add("@LocFlag", LocFlag);
                objCmd.Parameters.Add("@annualRep", annualRep);
                objCmd.Parameters.Add("@mcCode", mc);
                objCmd.Parameters.Add("@oclause", oclause);
                objCmd.Parameters.Add("@countory", count);
                objCmd.Parameters.Add("@stockExc", stockExc);
                objCmd.Parameters.Add("@repCurrency", repCurrency);
                objCmd.Parameters.Add("@naicsCode", naicsCode);


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();

                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }
            return "ADD";
        }

        public DataTable Getstructure()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetStructure";
                objCmd.CommandType = CommandType.StoredProcedure;

                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }


        public DataTable GetCompanes()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCompanes";
                objCmd.CommandType = CommandType.StoredProcedure;

                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }


        public DataTable GetStructVal()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetStructureVal";
                objCmd.CommandType = CommandType.StoredProcedure;

                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }


        public DataTable GetCompanyStructure()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCompanyStrucutre";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public string GETDeleteCountry()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteCountry";
                objCmd.Parameters.Add("@countrys", count);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }

        public string GETUpdateCountry()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateCountry";
                objCmd.Parameters.Add("@CountCode", CountCode);
                objCmd.Parameters.Add("@countrys", count);
                objCmd.Parameters.Add("@act", active);
                objCmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    objConn.Open();
                    objCmd.ExecuteNonQuery();
                    //OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    //da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return "delete";
        }
        public DataTable GetstockExchangeCountry()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetstockExchangeCountry";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@stockExCode", stockExc);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public DataTable GetReportingStuctCount()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetReportingStuctCount";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@CountryCode", CountCode);
                objCmd.Parameters.Add("@StructCode", stockExc);

                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }


        public DataTable GetQuestions()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetQuestions";
                objCmd.CommandType = CommandType.StoredProcedure;

                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }

        public DataTable GetAnswer(string questioCode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
            con = new OracleConnection(constr);
            DataSet dataset = new DataSet();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetAnswer";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@questioCode", questioCode);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    //objCmd.ExecuteNonQuery();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dataset);
                }

                catch (Exception ex)

                {

                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }

            return dataset.Tables[0];
        }


        public DataTable GetSpecificExpertCrit()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_GetExpertCriteriaSpec";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@emgcode", emgCode);
                objCmd.Parameters.Add("@parameterType", parameterType);
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                try
                {
                    objConn.Open();
                    OracleDataAdapter da = new OracleDataAdapter(objCmd);
                    da.Fill(dt);

                }
                catch (Exception ex)
                {
                    System.Console.WriteLine("Exception: {0}", ex.ToString());

                }

                objConn.Close();

            }
            return dt;
        }

    }
}