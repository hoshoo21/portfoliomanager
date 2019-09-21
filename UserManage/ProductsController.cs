using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Portfolio.Controller;

namespace Portfolio
{
    public class ProductsController : ApiController
    {
        public GlobalClass gc = new GlobalClass();
        dal objdal = new dal();

        private DataSet ds;

        private OracleConnection con;
        private OracleCommand objCmd;
        private OracleDataAdapter adp;
        private string _Productidx;
        public string Productidx { get { return _Productidx; } set { _Productidx = value; } }
        private string _EMG_CODE;
        public string EMG_CODE { get { return _EMG_CODE; } set { _EMG_CODE = value; } }
        private string _Product;
        public string Product { get { return _Product; } set { _Product = value; } }
        private string _Active;
        public string Active { get { return _Active; } set { _Active = value; } }

        private string _CCODE;
        public string CCODE { get { return _CCODE; } set { _CCODE = value; } }
        private string _Company;
        public string Company { get { return _Company; } set { _Company = value; } }
        private string _Category;
        public string Category { get { return _Category; } set { _Category = value; } }
        private string _Ntn;
        public string Ntn { get { return _Ntn; } set { _Ntn = value; } }

        private string _ExpertCriteriaGeneralCode;
        public string ExpertCriteriaGeneralCode { get { return _ExpertCriteriaGeneralCode; } set { _ExpertCriteriaGeneralCode = value; } }

        //Product//
        public System.Web.Http.Results.JsonResult<string> GETInsetProduct(string Product, string Active)

        {
            gc.Product = Product;
            gc.Active = Active;
            gc.InsertProduct();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETProduct()
        {

            DataTable dt = objdal.GetProductDetail();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETProductDelete(string PCode)
        {

            objdal.Productidx = PCode;
            objdal.DeleteProduct();
            return Json<string>("Delete Product");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateProduct(string PCODE, string Product, string Active)
        {

            objdal.Productidx = PCODE;
            objdal.Product = Product;
            objdal.Active = Active;
            objdal.UpdateProduct();
            return Json<string>("Updated");
        }

        //General Expert//

        public System.Web.Http.Results.JsonResult<string> GETInsertGeneralExpert(string GeneralExpert, string Active)

        {

            gc.GeneralExpert = GeneralExpert;
            gc.Active = Active;
            gc.InsertGeneralExpert();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETGeneralExpert()
        {

            DataTable dt = objdal.GetGeneralExpertDetail();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETGeneralExpertDelete(string EGCODE)
        {

            objdal.EMG_CODE = EGCODE;
            objdal.DeleteGeneralExpert();
            return Json<string>("Delete Product");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateGeneralExpert(string GeneralExpert, string Active, string EGCODE)
        {

            objdal.EMG_CODE = EGCODE;
            objdal.GeneralExpert = GeneralExpert;
            objdal.Active = Active;
            objdal.UpdateGeneralExpert();
            return Json<string>("Updated");
        }



        // Company///

        public System.Web.Http.Results.JsonResult<string> GETInsertCompany(string company, string ntn, string Active)

        {

            gc.Company = company;
            gc.Ntn = ntn;
            gc.Active = Active;
            gc.InsertCompany();
            return Json<string>("Insert");
        }

        public System.Web.Http.Results.JsonResult<DataTable> GETCompany()
        {

            DataTable dt = objdal.GetCompanyDetail();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETCompanyDelete(string CCODE)
        {

            objdal.CCODE = CCODE;
            objdal.DeleteCompany();
            return Json<string>("Delete Company");
        }

        public System.Web.Http.Results.JsonResult<string> GETUpdateCompany(string Company, string ntn, string Active, string CCODE)
        {

            objdal.CCODE = CCODE;
            objdal.Company = Company;
            objdal.Ntn = ntn;
            objdal.Active = Active;
            objdal.UpdateCompany();
            return Json<string>("Updated");
        }

        //client//
        public System.Web.Http.Results.JsonResult<string> GETInsertClient(string clientname, string gender,
            string nic, string ntn, string old, string active, string category, string Islamic,
            string online, string refer, string contNo, string email, string address)

        {
            gc.clientname = clientname;
            gc.Gender = gender;
            gc.nic = nic;
            gc.Ntn = ntn;
            gc.oldNo = old;
            gc.Active = active;
            gc.clientCategory = category;
            gc.islam = Islamic;
            gc.Refer = refer;
            gc.ContNo = contNo;
            gc.email = email;
            gc.address = address;
            gc.online = online;
            gc.Ptcode = "";
            gc.InsertClient();
            return Json<string>("Insert");
        }



        public System.Web.Http.Results.JsonResult<string> GETClientDelete(string clientcode)
        {

            objdal.clientCode = clientcode;
            objdal.DeleteClient();
            return Json<string>("Delete client");
        }

        public System.Web.Http.Results.JsonResult<string> GETClientUpdate(string clientname, string nic, string ntn, string active, string clientcode)
        {

            objdal.clientname = clientname;
            objdal.nic = nic;
            objdal.ntn = ntn;
            objdal.Active = active;
            objdal.clientCode = clientcode;
            objdal.UpdateClient();
            return Json<string>("Update Client");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETClient()
        {

            DataTable dt = objdal.GetClientDet();
            return Json<DataTable>(dt);
        }

        //income source//
        public System.Web.Http.Results.JsonResult<string> GETInsertIncomeSource(string incomeSource)

        {

            gc.incomeSource = incomeSource;
            gc.InsertIncomeSource();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETincomeSource()
        {

            DataTable dt = objdal.GetIncomeSource();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETIncomeSourceDelete(string iscode)
        {

            objdal.IScode = iscode;
            objdal.DeleteIncomeSource();
            return Json<string>("Delete Company");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateIncomeSource(string insource, string iscode)
        {


            objdal.InSource = insource;
            objdal.IScode = iscode;
            objdal.UpdateIncomeSource();
            return Json<string>("Updated");
        }


        // Payment///

        public System.Web.Http.Results.JsonResult<string> GETInsertPayment(string PaymentType)

        {

            gc.PaymentType = PaymentType;
            gc.InsertPayment();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETPayment()
        {

            DataTable dt = objdal.GetPayment();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETPaymentDelete(string ptcode)
        {

            objdal.ptcode = ptcode;
            objdal.DeletePayment();
            return Json<string>("Delete Company");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdatePayment(string PaymentType, string ptcode)
        {


            objdal.paymentType = PaymentType;
            objdal.ptcode = ptcode;
            objdal.UpdatePayment();
            return Json<string>("Updated");
        }

        //Joint Client//


        public System.Web.Http.Results.JsonResult<string> GETInsertJointClient(string jointclient, string address, string nic, string phoneNO, string active)

        {

            gc.jointclient = jointclient;
            gc.address = address;
            gc.nic = nic;
            gc.ContNo = phoneNO;
            gc.Active = active;
            gc.InsertJointClient();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETJointClient()
        {

            DataTable dt = objdal.GetJointClient();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETJointClientDelete(string clientcode)
        {

            objdal.clientCode = clientcode;
            objdal.DeleteJointClient();
            return Json<string>("Delete Company");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateJointClient(string jointclient, string address, string phoneNO, string nic, string active, string clientcode)
        {


            objdal.JoinClient = jointclient;
            objdal.Address = address;
            objdal.phoneNO = phoneNO;
            objdal.nic = nic;
            objdal.clientCode = clientcode;
            objdal.Active = active;
            objdal.UpdateJointClient();
            return Json<string>("Updated");
        }


        //relation ship//

        public System.Web.Http.Results.JsonResult<string> GETInsertRelationship(string relationship)


        {

            gc.relationship = relationship;
            gc.InsertRelationship();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETRelationShip()
        {

            DataTable dt = objdal.GetRelationShip();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETRelationShipDelete(string RSCODE)
        {

            objdal.RSCODE = RSCODE;
            objdal.DeleteRelationShip();
            return Json<string>("Delete Company");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateRelationShip(string relationship, string RSCODE)
        {


            objdal.Relationship = relationship;
            objdal.RSCODE = RSCODE;
            objdal.UpdateRelationShip();
            return Json<string>("Updated");
        }


        // bank Detail///
        public System.Web.Http.Results.JsonResult<string> GETInsertBankDetail(string bank)
        {
            gc.Bank = bank;
            gc.InsertBank();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETBankDetail()
        {

            DataTable dt = objdal.GetBankDetail();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETBankDetailDelete(string BDCODE)
        {

            objdal.BDCODE = BDCODE;
            objdal.DeleteBankDetail();
            return Json<string>("Delete Company");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateBankDetail(string bank, string BDCODE)
        {
            objdal.Bank = bank;
            objdal.BDCODE = BDCODE;
            objdal.UpdateBankDetail();
            return Json<string>("Updated");
        }


        // Broker //

        public System.Web.Http.Results.JsonResult<string> GETInsertBroker(string Broker, string ntn, string location, string phoneNo, string email, string active)
        {
            gc.Broker = Broker;
            gc.Ntn = ntn;
            gc.location = location;
            gc.phoneNo = phoneNo;
            gc.email = email;
            gc.Active = active;

            gc.InsertBroker();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETBroker()
        {

            DataTable dt = objdal.GetBroker();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETBrokerDelete(string brokerCODE)
        {

            objdal.brokercode = brokerCODE;
            objdal.DeleteBroker();
            return Json<string>("Delete Company");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateBroker(string broker, string ntn, string location, string phoneNo, string email, string brokerCODE, string active)
        {
            objdal.Broker = broker;
            objdal.ntn = ntn;
            objdal.location = location;
            objdal.phoneNo = phoneNo;
            objdal.email = email;
            objdal.brokercode = brokerCODE;
            objdal.Active = active;
            objdal.UpdateBroker();
            return Json<string>("Updated");
        }




        //Condition///
        public System.Web.Http.Results.JsonResult<string> GETInsertCondition(string condition, string active)
        {
            gc.Condition = condition;
            gc.Active = active;
            gc.InsertCondition();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETCondition()
        {

            DataTable dt = objdal.GetCondition();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETConditionDelete(string CondCODE)
        {

            objdal.CondCode = CondCODE;
            objdal.DeleteCondition();
            return Json<string>("Delete Company");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateCondition(string condition, string active, string CondCODE)
        {

            objdal.Condition = condition;
            objdal.Active = active;
            objdal.CondCode = CondCODE;
            objdal.UpdateCondition();
            return Json<string>("Updated");
        }


        // Value///

        public System.Web.Http.Results.JsonResult<string> GETInsertValue(string value, string active)
        {
            gc.Value = value;
            gc.Active = active;
            gc.InsertValue();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETValue()
        {

            DataTable dt = objdal.GetValue();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETValueDelete(string ValCODE)
        {

            objdal.ValueCode = ValCODE;
            objdal.DeleteValue();
            return Json<string>("Delete value");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateValue(string value, string active, string ValCODE)
        {

            objdal.Value = value;
            objdal.Active = active;
            objdal.ValueCode = ValCODE;
            objdal.UpdateValue();
            return Json<string>("Updated");
        }


        //Criteria///
        public System.Web.Http.Results.JsonResult<string> GETInsertCriteria(string critCode, string criteria, string type, string active)
        {
            gc.Criteria = criteria;
            gc.Active = active;
            gc.Critcode = critCode;
            gc.type = type;
            gc.InsertCriteria();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETCriteria()
        {

            DataTable dt = objdal.GetCriteria();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETCriteriaAll()
        {

            DataTable dt = objdal.GetCriteriaAll();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETCriteriaDetail(string critValue)
        {

            DataTable dt = objdal.GetCriteriaDetail(critValue);
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETCriteriaDelete(string CriteriaCODE)
        {

            objdal.critCode = CriteriaCODE;
            objdal.DeleteCriteria();
            return Json<string>("Delete value");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateCriteria(string criteria, string active, string CriteriaCODE)
        {

            objdal.criteria = criteria;
            objdal.Active = active;
            objdal.critCode = CriteriaCODE;
            objdal.UpdateCriteria();
            return Json<string>("Updated");
        }


        // insert value Condition///

        public System.Web.Http.Results.JsonResult<string> GETInsertValueCond(string value, string Criteria)
        {
            gc.Value = value;
            gc.Criteria = Criteria;
            gc.InsertValueCondition();
            return Json<string>("Insert");
        }

        public System.Web.Http.Results.JsonResult<DataTable> GETValueCondition()
        {

            DataTable dt = objdal.GetValCondition();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETValueCondDelete(string CondValCode)
        {

            objdal.CondCode = CondValCode;
            objdal.DeleteCondValue();
            return Json<string>("Delete value");
        }

        public System.Web.Http.Results.JsonResult<string> GETUpdateValueCondition(string value, string Criteria, string CondValCode)
        {

            objdal.Value = value;
            objdal.criteria = Criteria;
            objdal.ValueCode = CondValCode;
            objdal.UpdateValCondition();
            return Json<string>("Updated");
        }

        // insert General Expert Detail  //

        public System.Web.Http.Results.JsonResult<string> GETInsertGenExpertDet(string ExpertMaster, string Product, string Company, string active, string Category)
        {
            gc.GeneralExpert = ExpertMaster;
            gc.Product = Product;
            gc.Company = Company;
            gc.Active = active;
            gc.Category = Category;
            gc.InsertGenExptDetail();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETGenExptMast()
        {

            DataTable dt = objdal.GetGenExptDetail();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETGenExptDelete(string edgCode)
        {

            objdal.DeleteGenExptDetail(edgCode);
            return Json<string>("Delete value");
        }
        public System.Web.Http.Results.JsonResult<string> GETGenExptUpdate(string company, string Product, string expertMastDet, string category, string edgCode, string active)
        {

            objdal.UpdateGenExptDetail(company, Product, expertMastDet, edgCode, active, category);
            return Json<string>("Updated");
        }

        public System.Web.Http.Results.JsonResult<DataTable> GETGenCriteriaValue(string criCode)
        {
            objdal.critCode = criCode;
            DataTable dt = objdal.GetCriteriaValue();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETInsertExpertCriteriaGenereal(string edgcodeinsert, string Criteria, string condition,
             string val1, string val2, string active, string parametertype)
        {
            gc.GeneralExpert = edgcodeinsert;
            gc.Criteria = Criteria;
            gc.Condition = condition;
            gc.Value = val1;
            gc.Value2 = val2;
            gc.Active = active;
            gc.parameterType = parametertype;
            gc.InsertExpertCriteriaGeneral();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETGenCriteriaGeneral(string edgcodeinsert, string parametertype)
        {
            objdal.emgCode = edgcodeinsert;
            objdal.parameterType = parametertype;
            DataTable dt = objdal.GetGenExpertCrit();
            return Json<DataTable>(dt);
        }

        /// <summary>
        ///  Order Type
        /// </summary>
        public System.Web.Http.Results.JsonResult<string> GETInsetOrderType(string orderType)

        {
            gc.orderType = orderType;
            gc.InsertOrderType();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETOrderType()
        {

            DataTable dt = objdal.GetOrderType();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETDeleteOrderType(string orderTypeCode)
        {

            objdal.orderTypeCode = orderTypeCode;
            objdal.DeleteOrderType();
            return Json<string>("Delete Product");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateOrderType(string orderType, string orderTypeCode)
        {

            objdal.orderTypeCode = orderTypeCode;
            objdal.orderType = orderType;
            objdal.UpdateOrderType();
            return Json<string>("Updated");
        }
        /// Action Type///
        /// 
        public System.Web.Http.Results.JsonResult<string> GETInsetActionType(string ActionType)

        {
            gc.ActionType = ActionType;
            gc.InsertActionType();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETActionType()
        {

            DataTable dt = objdal.GetActionType();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETDeleteActionType(string actionTypeCode)
        {

            objdal.ActionTypeCode = actionTypeCode;
            objdal.DeleteActionType();
            return Json<string>("Delete Product");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateActionType(string actionType, string actionTypeCode)
        {

            objdal.ActionTypeCode = actionTypeCode;
            objdal.ActionType = actionType;
            objdal.UpdateActionType();
            return Json<string>("Updated");
        }


        /// Timing////
        /// 
        public System.Web.Http.Results.JsonResult<string> GETInsetTimming(string Timming)

        {
            gc.Timming = Timming;
            gc.InsertTimming();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETTimming()
        {

            DataTable dt = objdal.GetTimming();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETDeleteTimming(string TimmingCode)
        {

            objdal.TimmingCode = TimmingCode;
            objdal.DeleteTimming();
            return Json<string>("Delete Product");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateTimming(string Timming, string timmingCode)
        {

            objdal.TimmingCode = timmingCode;
            objdal.Timming = Timming;
            objdal.UpdateTimming();
            return Json<string>("Updated");
        }

        /// Order Progress ///
        /// 
        public System.Web.Http.Results.JsonResult<string> GETInsetOrderProgress(string OrderProgress)

        {
            gc.OrderProgress = OrderProgress;
            gc.InsertOrderProgress();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETOrderProgress()
        {

            DataTable dt = objdal.GetOrderProgress();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETDeleteOrderProgress(string orderProgCode)
        {

            objdal.OrderProgressCode = orderProgCode;
            objdal.DeleteOrderProgress();
            return Json<string>("Delete Product");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateOrderProgress(string OrderProgress, string orderProgCode)
        {

            objdal.OrderProgress = OrderProgress;
            objdal.OrderProgressCode = orderProgCode;
            objdal.UpdateOrderProgress();
            return Json<string>("Updated");
        }


        /// Insert Order ///
        /// 

        public System.Web.Http.Results.JsonResult<string> GETInsertOrder(string clientid,
            string ActionTypeid, string ddlSymbolid, string orderDate, string quantity, string rate1
            , string rate2, string ddlOrderTypeid, string ddlTimmingid, string ddlBrokerid, string ddlOrderProgressid, string Active)
        {

            GlobalClass gc = new GlobalClass();
            string creatuserid = "Kashif";
            string creatDate = DateTime.Now.ToString("yyyy-MMMM-dd hh:mm:ss");
            gc.clientCode = clientid;
            gc.actionId = ActionTypeid;
            gc.orderDate = orderDate;
            gc.symb = ddlSymbolid;
            gc.qnt = quantity;
            gc.rate1 = rate1;
            gc.rate2 = rate2;
            gc.ordertype = ddlOrderTypeid;
            gc.Active = Active;
            gc.creatuserid = creatuserid;
            gc.creatDate = creatDate;
            gc.OrderProgress = ddlOrderProgressid;
            gc.Broker = ddlBrokerid;

            gc.InsertOrder();
            return Json<string>("Add Order");
        }


        public System.Web.Http.Results.JsonResult<DataTable> GetOrders()
        {

            DataTable dt = objdal.GetOrders();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GetInsertPurchase(string orderid, string purchaseDate, string PurchaseQuant, string Rate)

        {
            gc.orderid = orderid;
            gc.purchaseDate = purchaseDate;
            gc.PurchaseQuant = PurchaseQuant;
            gc.Rate = Rate;
            gc.InsertPurchaseOrder();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetPurchaseOrders(string orderid)
        {
            objdal.orderid = orderid;
            DataTable dt = objdal.GetPurchaseOrder();
            return Json<DataTable>(dt);
        }



        public System.Web.Http.Results.JsonResult<string> GETDeleteGeneralExptCriteria(string ExpertCriteriaGeneralCode)
        {

            objdal.ExpertCriteriaGeneralCode = ExpertCriteriaGeneralCode;
            objdal.DeleteEGC();
            return Json<string>("Delete EXpert General Criteria");
        }

        public System.Web.Http.Results.JsonResult<string> GETUpdateGeneralExptCriteria(string
            Criteria, string condition, string val1, string val2, string active, string ExpertGenCritCode)
        {

            objdal.critCode = Criteria;
            objdal.CondCode = condition;
            objdal.Value = val1;
            objdal.value2 = val2;
            objdal.Active = active;
            objdal.ExpertCriteriaGeneralCode = ExpertGenCritCode;
            objdal.UpdateEGC();
            return Json<string>("Updated");
        }
        public System.Web.Http.Results.JsonResult<string> GETDeleteOrder(string orderid)
        {

            objdal.orderid = orderid;
            objdal.DeleteOrder();
            return Json<string>("Delete EXpert General Criteria");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateOrders(string client, string
          actionType, string symbol, string orderDate, string quantity, string rate1, string rate2, string orderType, string orderid, string orderProgres)
        {

            objdal.clientCode = client;
            objdal.ActionType = actionType;
            objdal.symb = symbol;
            objdal.orderdate = orderDate;
            objdal.PurchaseQuant = quantity;
            objdal.rate1 = rate1;
            objdal.rate2 = rate2;
            objdal.orderType = orderType;
            objdal.orderid = orderid;
            objdal.OrderProgress = orderProgres;

            objdal.UpdateOrder();
            return Json<string>("Updated");
        }

        public System.Web.Http.Results.JsonResult<DataTable> GETCriteriaAlready(string critcode)
        {

            dal objdal = new dal();
            DataTable dt = objdal.CriteroiaAlready(critcode);
            return Json<DataTable>(dt);
        }




        // Category//

        public System.Web.Http.Results.JsonResult<string> GETInsetCategory(string Category, string Active)

        {
            gc.Category = Category;
            gc.Active = Active;
            gc.InsertCategory();
            return Json<string>("Insert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETCategory()
        {

            DataTable dt = objdal.GetCategory();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<string> GETCategoryDelete(string catcode)
        {

            objdal.CatCode = catcode;
            objdal.DeleteCategory();
            return Json<string>("Delete Product");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateCategory(string category, string Active, string catcode)
        {

            objdal.CatCode = catcode;
            objdal.Category = category;
            objdal.Active = Active;
            objdal.UpdateCategory();
            return Json<string>("Updated");
        }


        //public System.Web.Http.Results.JsonResult<DataTable> GetSeacrhConditionData(string SearchconditionCol,string condition,string val1)
        //{
        //    string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
        //    con = new OracleConnection(constr);
        //    DataTable dt = new DataTable();
        //    using (OracleConnection objConn = new OracleConnection(constr))
        //    {
        //        OracleCommand objCmd = new OracleCommand();
        //        objCmd.Connection = objConn;
        //        objCmd.CommandText = "GetConditionWiseData";
        //        objCmd.CommandType = CommandType.StoredProcedure;
        //        objCmd.Parameters.Add("@SearchconditionCol", SearchconditionCol);
        //        objCmd.Parameters.Add("@cond", condition);
        //        objCmd.Parameters.Add("@val1", val1);

        //        objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

        //        try
        //        {
        //            objConn.Open();
        //            OracleDataAdapter da = new OracleDataAdapter(objCmd);
        //            da.Fill(dt);

        //        }
        //        catch (Exception ex)
        //        {
        //            System.Console.WriteLine("Exception: {0}", ex.ToString());

        //        }

        //        objConn.Close();

        //    }
        //    return Json<DataTable>(dt);
        //}

        public System.Web.Http.Results.JsonResult<DataTable> GetConditionColumn(string CriteriaCode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "Get_PF_ConditionColumn";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@CritCode", CriteriaCode);
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
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetSeacrhAllGeneralExpert(string WhereConditionMultiColumn,string paraType)
        {
            DataTable dt = new DataTable();
            dal db = new dal();
            db = new dal();
            string qry = @"select ECG.ECG_CODE,ECG.EMG_CODE,C.DESCRIPTION as criteria,C.CRITERIA_CODE ,Con.DESCRIPTION as condition,Con.CONDITON_CODE,V.VALUE_CODE,V2.VALUE_CODE,
 V.DESCERIPTION as value1,V2.DESCERIPTION as Value2,ECG.ACTIVE,C.SECTOR_DESC  from PF_PF_EXPERT_CRITERIA_GENERAL ECG
left outer join PF_CRITERIA C on C.CRITERIA_CODE=ECG.CRITERIA_CODE
left outer join PF_CONDITON Con on Con.CONDITON_CODE=ECG.CONDITON_CODE
left outer join PF_VALUES V on V.VALUE_CODE=ECG.VALUE_CODE1
left outer join PF_VALUES V2 on V2.VALUE_CODE=ECG.VALUE_CODE2

where" + " " + WhereConditionMultiColumn + " and PARAMETER_TYPE='"+ paraType + "' ";
            db.getData(qry, dt);
            return Json<DataTable>(dt);


        }


        public System.Web.Http.Results.JsonResult<DataTable> GetSeacrhConditionData(string whereCondition)
        {
            DataTable dt = new DataTable();
            dal db = new dal();
            db = new dal();
            string qry = @"select distinct COMPANY_NAME,COMPANY_SYMBOL,PRICE,CHANGEVAL,RELVOLUME,MC,INDUSTRY_DESC,SECTOR_DESC from WH_YOONEK Where" + " " + whereCondition + "";
            db.getDataXBRL(qry, dt);
            return Json<DataTable>(dt);


        }
        public System.Web.Http.Results.JsonResult<DataTable> GetSeacrhConstraintData(string whereCondition)
        {
            DataTable dt = new DataTable();
            dal db = new dal();
            db = new dal();
            string qry = @"select distinct COMPANY_NAME,COMPANY_SYMBOL,PRICE,CHANGEVAL,RELVOLUME,MC,INDUSTRY_DESC,SECTOR_DESC from PARAMETERFILTER Where" + " " + whereCondition + "";
            db.getDataXBRL(qry, dt);
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<string> GetUpdateCriteriacondition(string criteria, string CriteriaMap)

        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateCriteriaCond";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@criteria", criteria);
                objCmd.Parameters.Add("@CriteriaMap", CriteriaMap);


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
            return Json<string>("Add Question");
        }


        // Pfolio Product //
        public System.Web.Http.Results.JsonResult<string> GetInsertPfolioProduct(string product)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_InsertPfolioProduct";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@product", product);


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
            return Json<string>("Add Product");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetPfolioProduct()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetPfolioProduct";
                objCmd.CommandType = CommandType.StoredProcedure;
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
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<string> GetDeletePfolioProduct(string productCode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeletePfolioProduct";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@productCode", productCode);


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
            return Json<string>("Add Product");
        }
        public System.Web.Http.Results.JsonResult<string> GetUpdatePfolioProduct(string product, string productCode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdatePfolioProduct";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@product", product);
                objCmd.Parameters.Add("@productCode", productCode);


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
            return Json<string>("Add Product");
        }


        // asset Nature//
        public System.Web.Http.Results.JsonResult<string> GetInsertAssetNature(string assetnature)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_InsertassetNature";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@assetnature", assetnature);


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
            return Json<string>("Add Product");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetAssetNature()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetAssetNature";
                objCmd.CommandType = CommandType.StoredProcedure;
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
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<string> GetDeleteAssetNature(string assetnatureCode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteAssetNAture";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@assetnatureCode", assetnatureCode);


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
            return Json<string>("Add Product");
        }
        public System.Web.Http.Results.JsonResult<string> GetUpdateAssetNature(string assetnature, string assestnautreCode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateAssetNature";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@assetNatureCode", assestnautreCode);
                objCmd.Parameters.Add("@assetNature", assetnature);



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
            return Json<string>("Add Product");
        }


        // Product  class Weight//
        public System.Web.Http.Results.JsonResult<string> GetInsertProdClassWeight(string prodCode, string prodScore, string assetCode, string weightPer)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_InsertProdClassWeight";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@prodCode", prodCode);
                objCmd.Parameters.Add("@prodScore", prodScore);
                objCmd.Parameters.Add("@assetCode", assetCode);
                objCmd.Parameters.Add("@weightPer", weightPer);


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
            return Json<string>("Add Product");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetProdClassWeight()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetProductClasWeight";
                objCmd.CommandType = CommandType.StoredProcedure;
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
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<string> GetDeleteProdClassWeight(string IDX)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteProdClassWeight";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@classWeightIdx", IDX);


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
            return Json<string>("Add Product");
        }
        public System.Web.Http.Results.JsonResult<string> GetUpdateProdClassWeight(string classWeightCode, string prodCode, string prodScore, string assetCode, string weightPer)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateClassWeight";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@prodCode", prodCode);
                objCmd.Parameters.Add("@prodScore", prodScore);
                objCmd.Parameters.Add("@assetCode", assetCode);
                objCmd.Parameters.Add("@weightPer", weightPer);
                objCmd.Parameters.Add("@classWeightIdx", classWeightCode);



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
            return Json<string>("Add Product");
        }


        // Specific Expert MAster//
        public System.Web.Http.Results.JsonResult<string> GetInsertSpecifictMaster(string SpecificExpert, string Active)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_InsertSpecificExpert";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@SpecificExpert", SpecificExpert);
                objCmd.Parameters.Add("@act", Active);



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
            return Json<string>("Add Product");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetSpecifictMaste()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetSpecificExpertMaster";
                objCmd.CommandType = CommandType.StoredProcedure;
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
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<string> GetDeleteSpecifictMaste(string emscode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteSpecificExpertMAster";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@emscode", emscode);


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
            return Json<string>("Add Product");
        }
        public System.Web.Http.Results.JsonResult<string> GetUpdateSpecifictMaste(string SpecificExpert, string Active, string emscode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateSpecificEM";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@SpecificExpert", SpecificExpert);
                objCmd.Parameters.Add("@act", Active);
                objCmd.Parameters.Add("@emscode", emscode);




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
            return Json<string>("Add Product");
        }


        // Specific Expert Detail///
        [HttpGet]
        [Route("api/Products/GETInsertSpecifictExpertDetail")]
        public string GETInsertSpecifictExpertDetail(string expertmaster, string client)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_InsertSpecificExpertDetail";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@expertmaster", expertmaster);
                objCmd.Parameters.Add("@client", client);
                DateTime date = DateTime.Now;

                objCmd.Parameters.Add("@clientdate", date);



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
            return "";
            ////    return Request.CreateResponse(HttpStatusCode.OK,"Insert Specific Expert");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetSpecifictExpertDetail()
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetSpecificExpertDetail";
                objCmd.CommandType = CommandType.StoredProcedure;
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
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<string> GetDeleteSpecificExpertDetail(string edsCode)
        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteSED";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@edsCode", edsCode);


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
            return Json<string>("Add Product");
        }



        public System.Web.Http.Results.JsonResult<string> GetUpdateSpecifictExpertDetail(string SEM, string product, string company,
            string category, string client, string active, string edsCode)

        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateSED";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@SEM", SEM);
                objCmd.Parameters.Add("@product", product);
                objCmd.Parameters.Add("@company", company);
                objCmd.Parameters.Add("@cat", category);
                objCmd.Parameters.Add("@client", client);
                objCmd.Parameters.Add("@act", active);
                objCmd.Parameters.Add("@edsCode", edsCode);





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
            return Json<string>("Add Specific Expert Detail");
        }


        public System.Web.Http.Results.JsonResult<string> GetInsertSpecificCriteria(string EDSCode, string Criteria, string condition,
            string val1, string val2, string active, string parametertype)

        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_InsertExpertCriteriaSpec";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@EDSCode", EDSCode);
                objCmd.Parameters.Add("@crit", Criteria);
                objCmd.Parameters.Add("@cond", condition);
                objCmd.Parameters.Add("@val1", val1);
                objCmd.Parameters.Add("@val2", val2);
                objCmd.Parameters.Add("@act", Active);
                objCmd.Parameters.Add("@parameterType", parametertype);




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
            return Json<string>("Add Specific Expert Detail");
        }

        public System.Web.Http.Results.JsonResult<string> GetUpdateClient(string clientname, string gender,
            string nic, string ntn, string old, string active, string category, string Islamic,
            string online, string refer, string contNo, string email, string address, string clientcode)

        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_UpdateClient";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@clientname", clientname);
                objCmd.Parameters.Add("@gend", gender);
                objCmd.Parameters.Add("@nic_no", nic);
                objCmd.Parameters.Add("@ntn_no", ntn);
                objCmd.Parameters.Add("@old_no", old);
                objCmd.Parameters.Add("@csdate", DateTime.Now.ToString("dd-MMMM-yyyy hh:mm:ss"));
                objCmd.Parameters.Add("@actv", active);
                objCmd.Parameters.Add("@iscode", "");
                objCmd.Parameters.Add("@ptcode", "");
                objCmd.Parameters.Add("@clientCate", category);
                objCmd.Parameters.Add("@islam", Islamic);
                objCmd.Parameters.Add("@CPonline", online);
                objCmd.Parameters.Add("@refer", refer);
                objCmd.Parameters.Add("@ContNo", contNo);
                objCmd.Parameters.Add("@email_add", email);
                objCmd.Parameters.Add("@addres", address);
                objCmd.Parameters.Add("@username", "Kashif");
                objCmd.Parameters.Add("@clientcode", clientcode);



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
            return Json<string>("Add Specific Expert Detail");
        }

        public System.Web.Http.Results.JsonResult<string> GETInsertExpertCriteriaSpecific(string EDSCode, string Criteria, string condition,
          string val1, string val2, string active, string parametertype)
        {
            gc.GeneralExpert = EDSCode;
            gc.Criteria = Criteria;
            gc.Condition = condition;
            gc.Value = val1;
            gc.Value2 = val2;
            gc.Active = active;
            gc.parameterType = parametertype;
            gc.InsertExpertCriteriaGeneral();
            return Json<string>("Insert");
        }
        //public System.Web.Http.Results.JsonResult<DataTable> GETGenCriteriaSpecific(string WhereConditionMultiColumn)
        //{
        //    //objdal.emgCode = EDSCode;
        //    objdal.parameterType = parametertype;
        //    DataTable dt = objdal.GetSpecificExpertCrit();
        //    return Json<DataTable>(dt);
        //}


        public System.Web.Http.Results.JsonResult<string> GETDeleteSpecificExptCriteria(string SpecificExpertCriteriaCode, string parameterType)

        {
            string constr = System.Configuration.ConfigurationManager.AppSettings["connString"];
            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "PF_DeleteExpertSpecificCri";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@escCode", SpecificExpertCriteriaCode);
                objCmd.Parameters.Add("@parameterType", parameterType);


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
            return Json<string>("Delete Spcific criteria");
        }


        public System.Web.Http.Results.JsonResult<string> GETInsertExpertCriteriaSpecificConstraint(string EDSCode, string Criteria, string condition,
        string val1, string val2, string active, string parametertype)
        {
            gc.GeneralExpert = EDSCode;
            gc.Criteria = Criteria;
            gc.Condition = condition;
            gc.Value = val1;
            gc.Value2 = val2;
            gc.Active = active;
            gc.parameterType = parametertype;
            gc.InsertExpertCriteriaGeneral();
            return Json<string>("Insert");
        }

    }







}
