using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Portfolio.Controller
{
    public class GlobalClass
    {
        private dal db;
        private DataSet ds;

        private OracleConnection con;
        private OracleCommand cmd;
        private OracleDataAdapter adp;
        public string bData { get; set; }
        public class abc
        {
            public string ParameterFilter { get; set; }
        }
       public class CovarianceMatrix
        {
            public string ConvMatrix { get; set; }
        }
        
        private string _Productidx;
        public string Productidx { get { return _Productidx; } set { _Productidx = value; } }
        private string _Product;
        public string Product { get { return _Product; } set { _Product = value; } }
        private string _Active;
        public string Active { get { return _Active; } set { _Active = value; } }
        private string _GeneralExpert;
        public string GeneralExpert { get { return _GeneralExpert; } set { _GeneralExpert = value; } }
        private string _Company;
        public string Company { get { return _Company; } set { _Company = value; } }
        private string _Ntn;
        public string Ntn { get { return _Ntn; } set { _Ntn = value; } }
        private string _parameterType;
        public string parameterType { get { return _parameterType; } set { _parameterType = value; } }
        private string _clientname;
        public string clientname { get { return _clientname; } set { _clientname = value; } }
        private string _Gender;
        public string Gender { get { return _Gender; } set { _Gender = value; } }

        private string _nic;
        public string nic { get { return _nic; } set { _nic = value; } }
        private string _oldNo;
        public string oldNo { get { return _oldNo; } set { _oldNo = value; } }
        private string _Ptcode;
        public string Ptcode { get { return _Ptcode; } set { _Ptcode = value; } }

        private string _clientCategory;
        public string clientCategory { get { return _clientCategory; } set { _clientCategory = value; } }
        private string _islam;
        public string islam { get { return _islam; } set { _islam = value; } }

        private string _online;
        public string online { get { return _online; } set { _online = value; } }

        private string _Critcode;
        public string Critcode { get { return _Critcode; } set { _Critcode = value; } }
        private string _type;
        public string type { get { return _type; } set { _type = value; } }
        private string _Refer;
        public string Refer { get { return _Refer; } set { _Refer = value; } }
        private string _ContNo;
        public string ContNo { get { return _ContNo; } set { _ContNo = value; } }
        private string _email;
        public string email { get { return _email; } set { _email = value; } }

        private string _address;
        public string address { get { return _address; } set { _address = value; } }
        private string _userid;
        public string userid { get { return _userid; } set { _userid = value; } }
        private string _iscode;
        public string iscode { get { return _iscode; } set { _iscode = value; } }

        private string _incomeSource;
        public string incomeSource { get { return _incomeSource; } set { _incomeSource = value; } }

        private string _ptcode;
        public string ptcode { get { return _ptcode; } set { _ptcode = value; } }
        private string _PaymentType;
        public string PaymentType { get { return _PaymentType; } set { _PaymentType = value; } }


        private string _jointclient;
        public string jointclient { get { return _jointclient; } set { _jointclient = value; } }


        private string _relationship;
        public string relationship { get { return _relationship; } set { _relationship = value; } }

        private string _Bank;
        public string Bank { get { return _Bank; } set { _Bank = value; } }

        private string _Broker;
        public string Broker { get { return _Broker; } set { _Broker = value; } }




        private string _location;
        public string location { get { return _location; } set { _location = value; } }



        private string _phoneNo;
        public string phoneNo { get { return _phoneNo; } set { _phoneNo = value; } }


        private string _Condition;
        public string Condition { get { return _Condition; } set { _Condition = value; } }


        private string _Value;
        public string Value { get { return _Value; } set { _Value = value; } }

        private string _Value2;
        public string Value2 { get { return _Value2; } set { _Value2 = value; } }
        private string _Criteria;
        public string Criteria { get { return _Criteria; } set { _Criteria = value; } }
        private string _orderType;
        public string orderType { get { return _orderType; } set { _orderType = value; } }
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

        private string _clientCode;
        public string clientCode { get { return _clientCode; } set { _clientCode = value; } }
        private string _actionId;
        public string actionId { get { return _actionId; } set { _actionId = value; } }


        private string _orderDate;
        public string orderDate { get { return _orderDate; } set { _orderDate = value; } }

        private string _symb;
        public string symb { get { return _symb; } set { _symb = value; } }
        private string _qnt;
        public string qnt { get { return _qnt; } set { _qnt = value; } }


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
        private string _orderid;
        public string orderid { get { return _orderid; } set { _orderid = value; } }

        private string _purchaseDate;
        public string purchaseDate { get { return _purchaseDate; } set { _purchaseDate = value; } }

        private string _PurchaseQuant;
        public string PurchaseQuant { get { return _PurchaseQuant; } set { _PurchaseQuant = value; } }
        private string _Rate;
        public string Rate { get { return _Rate; } set { _Rate = value; } }

        private string _Category;
        public string Category { get { return _Category; } set { _Category = value; } }
        public void InsertProduct()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertProduct";
            cmd.Parameters.Add("@productname", Product);
            cmd.Parameters.Add("@active", Active);
            db.runProPortfolio(cmd);

        }
        public void InsertGeneralExpert()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertGeneralExpert";
            cmd.Parameters.Add("@GeneralExpt", GeneralExpert);
            cmd.Parameters.Add("@actv", Active);
            db.runProPortfolio(cmd);

        }
        public void InsertCompany()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertCompany";
            cmd.Parameters.Add("@comp", Company);
            cmd.Parameters.Add("@ntn_no", Ntn);
            cmd.Parameters.Add("@actv", Active);
            db.runProPortfolio(cmd);

        }
        public void InsertClient()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertClient";
            cmd.Parameters.Add("@clientname", clientname);
            cmd.Parameters.Add("@gend", Gender);
            cmd.Parameters.Add("@nic_no", nic);
            cmd.Parameters.Add("@ntn_no", Ntn);
            cmd.Parameters.Add("@old_no", oldNo);
            cmd.Parameters.Add("@csdate", DateTime.Now.ToString("dd-MMMM-yyyy hh:mm:ss"));
            cmd.Parameters.Add("@actv", Active);
            cmd.Parameters.Add("@iscode", iscode);
            cmd.Parameters.Add("@ptcode", Ptcode);
            cmd.Parameters.Add("@clientCate", clientCategory);
            cmd.Parameters.Add("@islam", islam);
            cmd.Parameters.Add("@CPonline", online);
            cmd.Parameters.Add("@refer", Refer);
            cmd.Parameters.Add("@ContNo", ContNo);
            cmd.Parameters.Add("@email_add", email);
            cmd.Parameters.Add("@addres", address);
            cmd.Parameters.Add("@username", "Kashif");
            db.runProPortfolio(cmd);

        }


        public void InsertIncomeSource()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertIncomeSource";
            cmd.Parameters.Add("@incSource", incomeSource);
            db.runProPortfolio(cmd);

        }

        public void InsertPayment()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertPaymentType";
            cmd.Parameters.Add("@PayType", PaymentType);
            db.runProPortfolio(cmd);

        }

        public void InsertJointClient()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertJoinClient";
            cmd.Parameters.Add("@jontClient", jointclient);
            cmd.Parameters.Add("@adress", address);
            cmd.Parameters.Add("@nic_no", nic);
            cmd.Parameters.Add("@ContNo", ContNo);
            cmd.Parameters.Add("@act", Active);
            db.runProPortfolio(cmd);

        }

        public void InsertRelationship()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertRelationShip";
            cmd.Parameters.Add("@relShip", relationship);
            db.runProPortfolio(cmd);

        }
        public void InsertBank()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertBank";
            cmd.Parameters.Add("@bank", Bank);
            db.runProPortfolio(cmd);

        }

        public void InsertBroker()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertBroker";
            cmd.Parameters.Add("@Broker", Broker);
            cmd.Parameters.Add("@Ntn_no", Ntn);
            cmd.Parameters.Add("@Loc", location);
            cmd.Parameters.Add("@contNo", phoneNo);
            cmd.Parameters.Add("@email_add", email);
            cmd.Parameters.Add("@act", Active);

            db.runProPortfolio(cmd);

        }
        public void InsertCondition()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertCondtion";
            cmd.Parameters.Add("@cond", Condition);
            cmd.Parameters.Add("@act", Active);
            db.runProPortfolio(cmd);

        }
        public void InsertValue()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertValue";
            cmd.Parameters.Add("@val", Value);
            cmd.Parameters.Add("@act", Active);
            db.runProPortfolio(cmd);

        }

        public void InsertCriteria()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertCriteria";
            cmd.Parameters.Add("@Critcode", Critcode);
            cmd.Parameters.Add("@Crit", Criteria);
            cmd.Parameters.Add("@Critype", type);
            cmd.Parameters.Add("@act", Active);
            db.runProPortfolio(cmd);

        }

        public void InsertValueCondition()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertValueCondition";
            cmd.Parameters.Add("@val", Value);
            cmd.Parameters.Add("@crit", Criteria);
            db.runProPortfolio(cmd);

        }
        public void InsertGenExptDetail()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertGenExpDetail";
            cmd.Parameters.Add("@GenExpMas", GeneralExpert);
            cmd.Parameters.Add("@prod", Product);
            cmd.Parameters.Add("@compa", Company);
            cmd.Parameters.Add("@acts", Active);
            cmd.Parameters.Add("@catcode", Category);
            
            db.runProPortfolio(cmd);

        }
        public void InsertExpertCriteriaGeneral()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertExpertCriteriaGen";
            cmd.Parameters.Add("@GenExpMasval", GeneralExpert);
            cmd.Parameters.Add("@crit", Criteria);
            cmd.Parameters.Add("@cond", Condition);
            cmd.Parameters.Add("@val1", Value);
            cmd.Parameters.Add("@val2", Value2);
            cmd.Parameters.Add("@act", Active);
            cmd.Parameters.Add("@parameterType", parameterType);

            db.runProPortfolio(cmd);

        }
        public void InsertExpertCriteriaSpecific()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertExpertCriteriaSpec";
            cmd.Parameters.Add("@GenExpMasval", GeneralExpert);
            cmd.Parameters.Add("@crit", Criteria);
            cmd.Parameters.Add("@cond", Condition);
            cmd.Parameters.Add("@val1", Value);
            cmd.Parameters.Add("@val2", Value2);
            cmd.Parameters.Add("@act", Active);
            cmd.Parameters.Add("@parameterType", parameterType);

            db.runProPortfolio(cmd);

        }
    
        public void InsertOrderType()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertOrderType";
            cmd.Parameters.Add("@orderType", orderType);
            db.runProPortfolio(cmd);

        }
        public void InsertActionType()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertActionType";
            cmd.Parameters.Add("@ActionType", ActionType);
            db.runProPortfolio(cmd);

        }
        public void InsertTimming()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertTimming";
            cmd.Parameters.Add("@Timming", Timming);
            db.runProPortfolio(cmd);

        }
        public void InsertOrderProgress()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_OrderProgress";
            cmd.Parameters.Add("@OrderProgress", OrderProgress);
            db.runProPortfolio(cmd);

        }
        public void InsertOrder()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertOrder";
            cmd.Parameters.Add("@clientCode", clientCode);
            cmd.Parameters.Add("@actionId", actionId);
            cmd.Parameters.Add("@orderDate", orderDate);
            cmd.Parameters.Add("@symb", symb);
            cmd.Parameters.Add("@qnt", qnt);
            cmd.Parameters.Add("@rate1", rate1);
            cmd.Parameters.Add("@rate2", rate2);
            cmd.Parameters.Add("@ordertype", ordertype);
            cmd.Parameters.Add("@act", act);
            cmd.Parameters.Add("@creatuserid", creatuserid);
            cmd.Parameters.Add("@creatDate", creatDate);
            cmd.Parameters.Add("@OrderProgress", OrderProgress);
            cmd.Parameters.Add("@Broker", Broker);

            db.runProPortfolio(cmd);

        }

        public void InsertPurchaseOrder()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertPurchaseOrder";
            cmd.Parameters.Add("@orderid", orderid);
            cmd.Parameters.Add("@purchaseDate", purchaseDate);
            cmd.Parameters.Add("@PurchaseQuant", PurchaseQuant);
            cmd.Parameters.Add("@Rate", Rate);
            db.runProPortfolio(cmd);

        }
        public void InsertCategory()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PF_InsertCategory";
            cmd.Parameters.Add("@cat", Category);
            cmd.Parameters.Add("@act", Active);
            db.runProPortfolio(cmd);

        }
    }
}