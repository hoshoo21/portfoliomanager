using System;

using Oracle.ManagedDataAccess.Client;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Data;
using System.Net.Http;
using System.Web.Http;
using System.Globalization;
using Portfolio.Controller;
using Newtonsoft.Json;
using UserManage;

namespace Portfolio
{
    public class XBRLController : ApiController
    {
        dal objdal = new dal();
        private OracleConnection con;
        private OracleCommand cmd;
        private OracleDataAdapter adp;
        private DataSet ds;
        string constr = System.Configuration.ConfigurationManager.AppSettings["connStringXBRL"];
        public System.Web.Http.Results.JsonResult<DataTable> GETSector()
        {

            DataTable dt = objdal.GetSector();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GETIndustory()
        {

            DataTable dt = objdal.GetIndustory();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetstockExchange(string countryCode)
        {

            DataTable dt = objdal.GetstockExchange(countryCode);
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetCompany()
        {

            DataTable dt = objdal.GetCompanyXBRL();
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<string> GETDeleteCompany(string compayCode)
        {

            objdal.compCode = compayCode;
            objdal.DeleteCompanyXBRL();
            return Json<string>("Delete Company");
        }

        public System.Web.Http.Results.JsonResult<DataTable> GetCompanyDetail(string compayCode)
        {

            objdal.compCode = compayCode;
            DataTable dt = objdal.GetCompanyDetailXBRL();
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<string> GetExportData(string compCode, string compcik, string eleName,

            string parentName, string eleVal1, string unitCode, string decRounding,
            string accType, string year, string ReptQua, string ContextCode, string fiscalYear,
            string eleNature, string eleVal2, string eleVal3, string eleVal4,
            string eleVal5,
           string CreatDate
            )
        {

            objdal.compcik = compcik;
            objdal.compCode = compCode;
            objdal.eleNature = eleNature;
            objdal.eleName = eleName;
            objdal.parentName = parentName;
            objdal.eleVal1 = eleVal1;
            objdal.eleVal2 = eleVal2;
            objdal.eleVal3 = eleVal3;
            objdal.eleVal4 = eleVal4;
            objdal.eleVal5 = eleVal5;
            objdal.unitCode = unitCode;
            objdal.decRounding = decRounding;
            objdal.accType = accType;
            objdal.ReptQua = ReptQua;
            objdal.CreatDate = CreatDate;
            objdal.year = year;
            objdal.CondCode = ContextCode;
            objdal.fiscalYear = fiscalYear;
            objdal.GInsertMultYearInterface();


            return Json<string>("Save");
        }

        public System.Web.Http.Results.JsonResult<DataTable> GetCountry()
        {

            DataTable dt = objdal.GetCountry();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetCountrySpecific()
        {
            //objdal.CountCode = countryCode;
            DataTable dt = objdal.GetCountrySpecific();
            return Json<DataTable>(dt);
        }


        public System.Web.Http.Results.JsonResult<string> GetInsertCompany(string compCode, string compName, string compSymbol,

         string regNo, string ntn, string indCode,
         string sector, string countReg, string PassEndDate,
         string stateLoc, string sataInc, string LocFlag,
         string annualRep, string mc, string oclause,
         string count, string stockExc, string repCurrency, string naics)


        {

            GlobalXBRL gc = new GlobalXBRL();
            gc.compCode = compCode;
            gc.compName = compName;
            gc.compSymbol = compSymbol;
            gc.regNo = regNo;
            gc.ntn = ntn;
            gc.indCode = indCode;
            gc.sector = sector;
            gc.countReg = countReg;
            gc.PassEndDate = PassEndDate;
            gc.stateLoc = stateLoc;
            gc.sataInc = sataInc;
            gc.LocFlag = LocFlag;
            gc.annualRep = annualRep;
            gc.mc = mc;
            gc.oclause = oclause;
            gc.count = count;
            gc.stockExc = stockExc;
            gc.repCurrency = repCurrency;
            gc.naics = naics;
            gc.InsertCompany();
            return Json<string>("Save");
            //Insert Company///

        }
        public System.Web.Http.Results.JsonResult<string> GetUpdateCompany(string compCode, string compName, string compSymbol,

       string regNo, string ntn, string indCode,
       string sector, string countReg, string PassEndDate,
       string stateLoc, string sataInc, string LocFlag,
       string annualRep, string mc, string oclause,
       string count, string stockExc, string repCurrency, string naics)


        {

            objdal = new dal();
            objdal.compCode = compCode;
            objdal.compName = compName;
            objdal.compSymbol = compSymbol;
            objdal.regNo = regNo;
            objdal.ntn = ntn;
            objdal.indCode = indCode;
            objdal.sector = sector;
            objdal.countReg = countReg;
            objdal.PassEndDate = PassEndDate;
            objdal.stateLoc = stateLoc;
            objdal.sataInc = sataInc;
            objdal.LocFlag = LocFlag;
            objdal.annualRep = annualRep;
            objdal.mc = mc;
            objdal.oclause = oclause;
            objdal.count = count;
            objdal.stockExc = stockExc;
            objdal.repCurrency = repCurrency;
            objdal.naicsCode = naics;
            objdal.UpdateCompanyXBRL();
            return Json<string>("Update");

        }


        public System.Web.Http.Results.JsonResult<DataTable> Getstructure()
        {

            DataTable dt = objdal.Getstructure();
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<DataTable> GetCompanes()
        {

            DataTable dt = objdal.GetCompanes();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetStructVal()
        {

            DataTable dt = objdal.GetStructVal();
            return Json<DataTable>(dt);
        }

        public System.Web.Http.Results.JsonResult<string> GetInsertStructure(string country, string strucutre, string structVal, string structDesc, string level)


        {

            GlobalXBRL gc = new GlobalXBRL();

            gc.count = country;
            gc.structure = strucutre;
            gc.structureVal = structVal;
            gc.structDesc = structDesc;
            gc.level = level;
            gc.InsertStructure();
            return Json<string>("Insert Struture");

        }


        public System.Web.Http.Results.JsonResult<DataTable> GetCompanyStructure()
        {



            DataTable dt = objdal.GetCompanyStructure();
            return Json<DataTable>(dt);
        }


        public System.Web.Http.Results.JsonResult<string> GetInsertCountry(string country, string active)


        {

            GlobalXBRL gc = new GlobalXBRL();
            gc.count = country;
            gc.active = active;

            gc.InsertCountry();
            return Json<string>("Insert Country");

        }
        public System.Web.Http.Results.JsonResult<string> GETDeleteCountry(string countryCode)
        {

            objdal.count = countryCode;
            objdal.GETDeleteCountry();
            return Json<string>("Delete Country");
        }
        public System.Web.Http.Results.JsonResult<string> GETUpdateCountry(string countryCode, string country, string active)
        {

            objdal.CountCode = countryCode;
            objdal.count = country;
            objdal.active = active;
            objdal.GETUpdateCountry();
            return Json<string>("Delete Country");
        }


        public System.Web.Http.Results.JsonResult<DataTable> GetstockExchangeCountry(string stockExCode)
        {
            objdal.stockExc = stockExCode;
            DataTable dt = objdal.GetstockExchangeCountry();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetReportingStuctCount(string countryCode, string stockExc)
        {
            objdal.stockExc = stockExc;
            objdal.CountCode = countryCode;
            DataTable dt = objdal.GetReportingStuctCount();
            return Json<DataTable>(dt);
        }


        public System.Web.Http.Results.JsonResult<DataTable> GetQuestions()
        {


            DataTable dt = objdal.GetQuestions();
            return Json<DataTable>(dt);
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetAnswer(string questionCode)
        {


            DataTable dt = objdal.GetAnswer(questionCode);
            return Json<DataTable>(dt);
        }


        public System.Web.Http.Results.JsonResult<DataTable> GetComReptStruct(string compayCode)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetComReptStruct";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@CompanyCode", compayCode);
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

        public System.Web.Http.Results.JsonResult<DataTable> GetReprotingStructureDetail(string country, string strcture)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetReprtStructDet";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@CountryCode", country);
                objCmd.Parameters.Add("@structName", strcture);
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


        public System.Web.Http.Results.JsonResult<string> GetCopyReportingStructure(string Copycountry, string Copystrcture
            , string structval, string structureDesc, string level
            )
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "CopyReportingStructureDet";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@countryCode", Copycountry);
                objCmd.Parameters.Add("@structureCode", Copystrcture);
                objCmd.Parameters.Add("@structureVal", structval);
                objCmd.Parameters.Add("@structureDesc", structureDesc);
                objCmd.Parameters.Add("@StructLevel", level);
                DateTime createdDate = DateTime.Now;
                objCmd.Parameters.Add("@createDate", createdDate);

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
            return Json<string>("copy");
        }


        public System.Web.Http.Results.JsonResult<string> GetInsertQuestion(string question, string QuestType)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertQuestion";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@question", question);
                objCmd.Parameters.Add("@QuestType", QuestType);

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

        public System.Web.Http.Results.JsonResult<DataTable> GetQuestionDesc()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetQuestionDesc";
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
        public System.Web.Http.Results.JsonResult<DataTable> GetQuestionType()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetQuestionType";
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

        public System.Web.Http.Results.JsonResult<string> GetDeleteQuestion(string QUESTION_CODE)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteQuestion";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@questCode", QUESTION_CODE);


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
            return Json<string>("Delete Question");
        }


        public System.Web.Http.Results.JsonResult<string> GetUpdateQuestion(string question, string QuestType, string questCode)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateQuestion";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@questCode", questCode);
                objCmd.Parameters.Add("@questDesc", question);
                objCmd.Parameters.Add("@questType", QuestType);

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

        public System.Web.Http.Results.JsonResult<string> GetInsertAns(string ans, string points, string Quesal)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertAns";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@ans", ans);
                objCmd.Parameters.Add("@points", points);
                objCmd.Parameters.Add("@Quesal", Quesal);
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

        public System.Web.Http.Results.JsonResult<DataTable> GetAnsDesc()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetAnsDesc";
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
        public System.Web.Http.Results.JsonResult<string> GetDeleteAns(string IDX)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteAns";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@AnsCode", IDX);


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
            return Json<string>("Delete Question");
        }

        public System.Web.Http.Results.JsonResult<string> GetUpdateAns(string ans, string points, string QuesVal, string AnsCode)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateAns";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@questDesc", QuesVal);
                objCmd.Parameters.Add("@AnsDesc", ans);
                objCmd.Parameters.Add("@pointsDesc", points);
                objCmd.Parameters.Add("@AnsId", AnsCode);

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


        public System.Web.Http.Results.JsonResult<string> GetInsertQuestionType(string QuestionType)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertQuestionType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@QuestionType", QuestionType);

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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetDeleteQuestionType(string QUESTION_TYPE_CODE)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteQuesType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@questCode", QUESTION_TYPE_CODE);


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
            return Json<string>("Delete Question");
        }


        public System.Web.Http.Results.JsonResult<string> GetUpdateQuestionType(string Questype, string QuestTypeCode)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateQuesType";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@QuestTypeCode", QuestTypeCode);
                objCmd.Parameters.Add("@Questype", Questype);

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

        public System.Web.Http.Results.JsonResult<string> GetInsertInvestorStatus(string timeHorizonScore, string RiskToleranceScore, string status)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsetInvestorStatus";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@timeHorizonScore", timeHorizonScore);
                objCmd.Parameters.Add("@RiskToleranceScore", RiskToleranceScore);
                objCmd.Parameters.Add("@status", status);

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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetDeleteInvestorStatus(string IDX)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteInvestorStatus";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@InvestCode", IDX);


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
            return Json<string>("Delete Question");
        }


        public System.Web.Http.Results.JsonResult<string> GetUpdateInvestorStatus(string timeHorizonScore, string RiskToleranceScore, string status, string InvestorCode)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateInvestorStatus";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@timeHorizonScore", timeHorizonScore);
                objCmd.Parameters.Add("@RiskToleranceScore", RiskToleranceScore);
                objCmd.Parameters.Add("@statusDesc", status);
                objCmd.Parameters.Add("@InvestorCode", InvestorCode);

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

        public System.Web.Http.Results.JsonResult<DataTable> GetInvestorStatus()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetInvestorStatus";
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
        public System.Web.Http.Results.JsonResult<DataTable> GetInvestorStatusResult(string totalHorizon, string TotalRisk)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetInvestorStatusResult";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@horizonScore", totalHorizon);
                objCmd.Parameters.Add("@riskScore", TotalRisk);

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
        public System.Web.Http.Results.JsonResult<DataTable> GetHoriozQuest()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetHorizonQuestion";
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
        public System.Web.Http.Results.JsonResult<DataTable> GetAssociation()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetAssociation";
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

        public System.Web.Http.Results.JsonResult<string> GetUpdateAssociation(string AssociationName, string StandardAssociation,
            string EffectiveTodate
            , string EffectiveEnddate, string AssociationCode)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateAssociation";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@AssociationName", AssociationName);
                objCmd.Parameters.Add("@StandardAssociation", StandardAssociation);
                objCmd.Parameters.Add("@EffectiveTodate", EffectiveTodate);
                objCmd.Parameters.Add("@EffectiveEnddate", EffectiveEnddate);
                objCmd.Parameters.Add("@AssociationCode", AssociationCode);

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

        public System.Web.Http.Results.JsonResult<string> GetInsertAssociation(string AssociationName, string StandardAssociation,
            string EffectiveTodate, string EffectiveEnddate)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsetAssociation";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@AssociationName", AssociationName);
                objCmd.Parameters.Add("@StandardAssociation", StandardAssociation);
                objCmd.Parameters.Add("@EffectiveTodate", EffectiveTodate);
                objCmd.Parameters.Add("@EffectiveEnddate", EffectiveEnddate);

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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetDeleteAssociation(string ASSOCIATION_CODE)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteAssociation";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@AssociationCode", ASSOCIATION_CODE);


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
            return Json<string>("Delete Question");
        }



        public System.Web.Http.Results.JsonResult<DataTable> GetVaraible()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetVariable";
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

        public System.Web.Http.Results.JsonResult<string> GetUpdateVaraible(string VariableCode, string VariableName,
            string Variablequery
            , string EffToDate, string EffectiveEnddate, string VariableType, string VariableQueryDetail)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateVariable";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@VariableCode", VariableCode);
                objCmd.Parameters.Add("@VariableName", VariableName);
                objCmd.Parameters.Add("@Variablequery", Variablequery);
                objCmd.Parameters.Add("@EffToDate", EffToDate);
                objCmd.Parameters.Add("@EffectiveEnddate", EffectiveEnddate);
                objCmd.Parameters.Add("@VariableType", VariableType);
                objCmd.Parameters.Add("@VariableQueryDetail", VariableQueryDetail);
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

        public System.Web.Http.Results.JsonResult<string> GetInsertVaraible(string VariableCode, string VariableName,
            string Variablequery, string EffToDate, string EffectiveEnddate, string VariableType, string VariableQueryDetail)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsetVariable";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@VariableCode", VariableCode);
                objCmd.Parameters.Add("@VariableName", VariableName);
                objCmd.Parameters.Add("@Variablequery", Variablequery);
                objCmd.Parameters.Add("@EffToDate", EffToDate);
                objCmd.Parameters.Add("@EffectiveEnddate", EffectiveEnddate);
                objCmd.Parameters.Add("@VariableType", VariableType);
                objCmd.Parameters.Add("@VariableQueryDetail", VariableQueryDetail);
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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetDeleteVaraible(string VARIABLE_CODE)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteVariable";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@variableCode", VARIABLE_CODE);


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
            return Json<string>("Delete Question");
        }



        public System.Web.Http.Results.JsonResult<DataTable> GetFormula()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetFormula";
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

        public System.Web.Http.Results.JsonResult<string> GetUpdateFormula(string StanderType, string FormulaCode,
            string FormulaName, string NumeratorCode, string DenominatorCode, string EffToDate, string EffectiveEnddate, string FormulaType)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateFromula";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@StanderType", StanderType);
                objCmd.Parameters.Add("@FormulaCode", FormulaCode);
                objCmd.Parameters.Add("@FormulaName", FormulaName);
                objCmd.Parameters.Add("@NumeratorCode", NumeratorCode);
                objCmd.Parameters.Add("@DenominatorCode", DenominatorCode);
                objCmd.Parameters.Add("@EffToDate", EffToDate);
                objCmd.Parameters.Add("@EffectiveEnddate", EffectiveEnddate);
                objCmd.Parameters.Add("@FormulaType", FormulaType);
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

        public System.Web.Http.Results.JsonResult<string> GetInsertFormula(string StanderType, string FormulaCode,
            string FormulaName, string NumeratorCode, string DenominatorCode, string EffToDate, string EffectiveEnddate, string FormulaType)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsetFormula";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@StanderType", StanderType);
                objCmd.Parameters.Add("@FormulaCode", FormulaCode);
                objCmd.Parameters.Add("@FormulaName", FormulaName);
                objCmd.Parameters.Add("@NumeratorCode", NumeratorCode);
                objCmd.Parameters.Add("@DenominatorCode", DenominatorCode);
                objCmd.Parameters.Add("@EffToDate", EffToDate);
                objCmd.Parameters.Add("@EffectiveEnddate", EffectiveEnddate);
                objCmd.Parameters.Add("@FormulaType", FormulaType);
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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetDeleteFormula(string FORMULA_CODE, string STANDARD_TYPE)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteFormula";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@formulaCode", FORMULA_CODE);
                objCmd.Parameters.Add("@standType", STANDARD_TYPE);


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
            return Json<string>("Delete Question");
        }





        public System.Web.Http.Results.JsonResult<DataTable> GetFinancial()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetFinancial";
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

        public System.Web.Http.Results.JsonResult<string> GetUpdateFinancial(string FinancialCode, string FinancialAnalysis,
            string FinancialType, string FinancialNature, string EffToDate, string EffEndDate)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateFinancial";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@FinancialCode", FinancialCode);
                objCmd.Parameters.Add("@FinancialAnalysis", FinancialAnalysis);
                objCmd.Parameters.Add("@FinancialType", FinancialType);
                objCmd.Parameters.Add("@FinancialNature", FinancialNature);
                objCmd.Parameters.Add("@EffToDate", EffToDate);
                objCmd.Parameters.Add("@EffEndDate", EffEndDate);

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

        public System.Web.Http.Results.JsonResult<string> GetInsertFinancial(string FinancialCode, string FinancialAnalysis,
            string FinancialType, string FinancialNature, string EffToDate, string EffEndDate)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsetFinancial";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@FinancialCode", FinancialCode);
                objCmd.Parameters.Add("@FinancialAnalysis", FinancialAnalysis);
                objCmd.Parameters.Add("@FinancialType", FinancialType);
                objCmd.Parameters.Add("@FinancialNature", FinancialNature);
                objCmd.Parameters.Add("@EffToDate", EffToDate);
                objCmd.Parameters.Add("@EffEndDate", EffEndDate);
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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetDeleteFinancial(string Financial_CODE)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteFinancial";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@financialCode", Financial_CODE);


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
            return Json<string>("Delete Question");
        }



        public System.Web.Http.Results.JsonResult<DataTable> GetStandard()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "StandardSetup";
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

        public System.Web.Http.Results.JsonResult<string> GetUpdateStandard(string StandardType, string StandardName,
            string AssociationCode, string EffToDate, string EffEndDate, string StandardCode)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateStandard";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@StandardType", StandardType);
                objCmd.Parameters.Add("@StandardName", StandardName);
                objCmd.Parameters.Add("@AssociationCode", AssociationCode);
                objCmd.Parameters.Add("@EffToDate", EffToDate);
                objCmd.Parameters.Add("@EffEndDate", EffEndDate);
                objCmd.Parameters.Add("@StandardCode", StandardCode);


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

        public System.Web.Http.Results.JsonResult<string> GetInsertStandard(string StandardType, string StandardName,
            string AssociationCode, string EffToDate, string EffEndDate)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsetStandard";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@StandardType", StandardType);
                objCmd.Parameters.Add("@StandardName", StandardName);
                objCmd.Parameters.Add("@AssociationCode", AssociationCode);
                objCmd.Parameters.Add("@EffToDate", EffToDate);
                objCmd.Parameters.Add("@EffEndDate", EffEndDate);

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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetDeleteStandard(string STANDARDCODE)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteStandard";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@STANDARDCODE", STANDARDCODE);


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
            return Json<string>("Delete Question");
        }



        public System.Web.Http.Results.JsonResult<DataTable> GetAsset()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetAsset";
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

        public System.Web.Http.Results.JsonResult<string> GetUpdateAsset(string Asset, string AssetCode
           )
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateAsset";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@AssetDesc", Asset);
                objCmd.Parameters.Add("@AssetCode", AssetCode);


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

        public System.Web.Http.Results.JsonResult<string> GetInsertAsset(string Asset)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertAssetDef";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@assetdesc", Asset);


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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetDeleteAsset(string ASSET_IDX)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteAsset";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@AssetCode", ASSET_IDX);


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
            return Json<string>("Delete Question");
        }



        public System.Web.Http.Results.JsonResult<DataTable> GetAssetMapRisk()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetAssetMapRiskTolerence";
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

        public System.Web.Http.Results.JsonResult<string> GetUpdateAssetMapRisk(string riskTol, string Asset, string ScoreFrom
            , string ScoreTo, string AssetPer, string AssetMapRiskTolCode)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateAssetMapRiskTol";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@riskTolCode", riskTol);
                objCmd.Parameters.Add("@Scorefrom", ScoreFrom);
                objCmd.Parameters.Add("@ScoreTo", ScoreTo);
                objCmd.Parameters.Add("@AssetCode", Asset);
                objCmd.Parameters.Add("@AssetPer", AssetPer);
                objCmd.Parameters.Add("@AssetMapRiskTolCode", AssetMapRiskTolCode);

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

        public System.Web.Http.Results.JsonResult<string> GetInsertAssetMapRisk(string riskTol, string Asset, string ScoreFrom
            , string ScoreTo, string AssetPer)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertAssetMapTolerence";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@riskTolCode", riskTol);
                objCmd.Parameters.Add("@Scorefrom", ScoreFrom);
                objCmd.Parameters.Add("@ScoreTo", ScoreTo);
                objCmd.Parameters.Add("@AssetCode", Asset);
                objCmd.Parameters.Add("@AssetPer", AssetPer);


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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetDeleteAssetMapRisk(string IDX)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteAssetMapRiskTolerence";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@riskMapAssetCode", IDX);


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
            return Json<string>("Delete Question");
        }


        public System.Web.Http.Results.JsonResult<DataTable> GetRiskTolerence()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetRiskTolerence";
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


        public System.Web.Http.Results.JsonResult<DataTable> GetAssetChart(string totalScore, string InestorStatus)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetAssetChart";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@totalScore", totalScore);
                objCmd.Parameters.Add("@riskTol", InestorStatus);
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
        public System.Web.Http.Results.JsonResult<DataTable> GetStandardType()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetStandardType";
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
        public System.Web.Http.Results.JsonResult<DataTable> GetMonthlyElement()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetElementValue";
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

        public System.Web.Http.Results.JsonResult<string> GetInsertMonthlyElementValue(string companyCode, string Reportingcode, string ReportingMonth,
           string ReportingYear, string StandardType, string ElementName, string ContextCode, string ContextId,
          string UnitCode, string DescimalRounding, string ElementValue, string ElementLabel, string FinancialYear, string ContextLabel)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertMonthlyElementValue";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@companyCode", companyCode);
                objCmd.Parameters.Add("@Reportingcode", Reportingcode);
                objCmd.Parameters.Add("@ReportingMonth", ReportingMonth);

                objCmd.Parameters.Add("@ReportingYear", ReportingYear);
                objCmd.Parameters.Add("@StandardType", StandardType);
                objCmd.Parameters.Add("@ElementName", ElementName);
                objCmd.Parameters.Add("@ContextCode", ContextCode);
                objCmd.Parameters.Add("@ContextId", ContextId);
                objCmd.Parameters.Add("@UnitCode", UnitCode);
                objCmd.Parameters.Add("@DescimalRounding", DescimalRounding);
                objCmd.Parameters.Add("@ElementValue", ElementValue);
                objCmd.Parameters.Add("@ElementLabel", ElementLabel);
                objCmd.Parameters.Add("@FinancialYear", FinancialYear);
                DateTime createdDate = DateTime.Now;
                objCmd.Parameters.Add("@createDate", createdDate);
                objCmd.Parameters.Add("@ContextLabel", ContextLabel);

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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetStockPrice(string stockname, string tractDate, string stocstockhigh,
            string stockLow, string stockOpen, string stockClose, string stockvolume, string stockadjClose)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                string tractDateSet = DateTime.ParseExact(tractDate, "dd'/'MM'/'yyyy", CultureInfo.InvariantCulture).ToString("dd'-'MMM'-'yyyy");

                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertStockHistory";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@stockname", stockname);
                objCmd.Parameters.Add("@tractDate", tractDateSet);
                objCmd.Parameters.Add("@stocstockhigh", stocstockhigh);
                objCmd.Parameters.Add("@stockLow", stockLow);
                objCmd.Parameters.Add("@stockOpen", stockOpen);
                objCmd.Parameters.Add("@stockClose", stockClose);
                objCmd.Parameters.Add("@stockvolume", stockvolume);
                objCmd.Parameters.Add("@stockadjClose", stockadjClose);
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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetStockHistoryUSA(string stockname, string tractDate, string stocstockhigh,
           string stockLow, string stockOpen, string stockClose, string stockvolume, string stockadjClose)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                string tractDateSet = DateTime.ParseExact(tractDate, "dd'/'MM'/'yyyy", CultureInfo.InvariantCulture).ToString("dd'-'MMM'-'yyyy");

                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertStockHistoryUSA";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@stockname", stockname);
                objCmd.Parameters.Add("@tractDate", tractDateSet);
                objCmd.Parameters.Add("@stocstockhigh", stocstockhigh);
                objCmd.Parameters.Add("@stockLow", stockLow);
                objCmd.Parameters.Add("@stockOpen", stockOpen);
                objCmd.Parameters.Add("@stockClose", stockClose);
                objCmd.Parameters.Add("@stockvolume", stockvolume);
                objCmd.Parameters.Add("@stockadjClose", stockadjClose);
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
            return Json<string>("Add Question Type");
        }
        // Elemennt Nature/
        public System.Web.Http.Results.JsonResult<string> GetInsertElementNature(string elementName, string elementNatureName, string GenericElement)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertElementNature";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@elementName", elementName);
                objCmd.Parameters.Add("@elementNatureName", elementNatureName);
                objCmd.Parameters.Add("@GenericElement", GenericElement);

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
            return Json<string>("Add Question Type");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetElementNature()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetElementNature";
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

        public System.Web.Http.Results.JsonResult<string> GetDeleteElementNature(string ElementNature_CODE, string elementname)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteElementNature";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@ElementNature_CODE", ElementNature_CODE);
                objCmd.Parameters.Add("@elementName", elementname);


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
            return Json<string>("Delete Element Nature");
        }

        public System.Web.Http.Results.JsonResult<string> GetUpdateElementNature(string elementName, string elementNatureName, string GenericElement)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateElementNature";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@elementName", elementName);
                objCmd.Parameters.Add("@elementNatureName", elementNatureName);
                objCmd.Parameters.Add("@GenericElement", GenericElement);
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
        // Element MAster sheet//


        public System.Web.Http.Results.JsonResult<string> GetInsertElementMasterSheet(string elementName, string MappingNature, string ElementGenericName, string ParentName)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertElementGenericSheet";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@elementName", elementName);
                objCmd.Parameters.Add("@MappingNature", MappingNature);
                objCmd.Parameters.Add("@ElementGenericName", ElementGenericName);
                objCmd.Parameters.Add("@ParentName", ParentName);

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
            return Json<string>("Add Question Type");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetElementMAsterSheet()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetElementMasterSheet";
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

        public System.Web.Http.Results.JsonResult<string> GetDeleteElementMAsterSheet(string ElementMasterSheet_CODE, string elementname)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteElementMasterSheet";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@ElementNature_CODE", ElementMasterSheet_CODE);
                objCmd.Parameters.Add("@elementname", elementname);


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
            return Json<string>("Delete Element Nature");
        }

        public System.Web.Http.Results.JsonResult<string> GetUpdateElementMAsterSheet(string elementName, string MappingNature, string ElementGenericName, string ParentName)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateElementMAsterSheet";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@elementName", elementName);
                objCmd.Parameters.Add("@MappingNature", MappingNature);
                objCmd.Parameters.Add("@elementNatureName", ElementGenericName);
                objCmd.Parameters.Add("@parenName", ParentName);
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



        public System.Web.Http.Results.JsonResult<DataTable> GetUSerType()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetUsersType";
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
        public System.Web.Http.Results.JsonResult<DataTable> GetUSers()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetUsers";
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


        public System.Web.Http.Results.JsonResult<string> GetInsertUSer(string userid, string password, string userType, string pageAllow,
            string mangerid, string email, string contNo, string extUSer,
            string imgPath, string clientCode, string outlokPAs, string nameDesc)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsetUser";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@user_id", userid);
                objCmd.Parameters.Add("@pass", password);
                objCmd.Parameters.Add("@user_Type", userType);
                objCmd.Parameters.Add("@page_Allow", pageAllow);
                objCmd.Parameters.Add("@manger_id", mangerid);
                objCmd.Parameters.Add("@emailid", email);
                objCmd.Parameters.Add("@contNo", contNo);
                objCmd.Parameters.Add("@extUSer", extUSer);
                objCmd.Parameters.Add("@imgPath", imgPath);
                objCmd.Parameters.Add("@client_Code", clientCode);
                objCmd.Parameters.Add("@outlokPAs", outlokPAs);
                objCmd.Parameters.Add("@name_Desc", nameDesc);

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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<string> GetUpdateUSer(string userid, string password, string userType, string pageAllow,
           string mangerid, string email, string contNo, string extUSer,
           string imgPath, string clientCode, string outlokPAs, string nameDesc)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateUser";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@user_id", userid);
                objCmd.Parameters.Add("@pass", password);
                objCmd.Parameters.Add("@user_Type", userType);
                objCmd.Parameters.Add("@page_Allow", pageAllow);
                objCmd.Parameters.Add("@manger_id", mangerid);
                objCmd.Parameters.Add("@emailid", email);
                objCmd.Parameters.Add("@contNo", contNo);
                objCmd.Parameters.Add("@extUSer", extUSer);
                objCmd.Parameters.Add("@imgPath", imgPath);
                objCmd.Parameters.Add("@client_Code", clientCode);
                objCmd.Parameters.Add("@outlokPAs", outlokPAs);
                objCmd.Parameters.Add("@name_Desc", nameDesc);

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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetDeleteUSer(string USERID)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteUser";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@user_id", USERID);


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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<DataTable> GetCompanySymbol()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetCompanySymbol";
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
        public System.Web.Http.Results.JsonResult<DataTable> GetProject()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetProject";
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

        public System.Web.Http.Results.JsonResult<DataTable> GetUserTickerMap()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetUserTrickerMap";
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


        public System.Web.Http.Results.JsonResult<DataTable> GetUserControl()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetUserControl";
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

        public System.Web.Http.Results.JsonResult<string> GetInsertUSerControl(string controlname)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertUSerControl";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@usercont", controlname);


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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetDeleteUSerControl(string CONTROLID)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteUserControl";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@userContid", CONTROLID);


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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetUpdateUSerControl(string controlidx, string controlname)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateUSerControl";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@controlidx", controlidx);
                objCmd.Parameters.Add("@contname", controlname);


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
            return Json<string>("Add Question Type");
        }

        // USer Project//

        public System.Web.Http.Results.JsonResult<DataTable> GetUserProject()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetUserProject";
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

        public System.Web.Http.Results.JsonResult<string> GetInsertUSerProject(string project)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertUSerProject";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@projectname", project);


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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetDeleteUSerProject(string PRJID)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteUserProject";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@Projectid", PRJID);


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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetUpdateUSerProject(string projectidx, string Projectname)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateUSerCProject";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@projectidx", projectidx);
                objCmd.Parameters.Add("@Projectname", Projectname);


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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetInsertUSertickerMap(string user, string project, string symbol)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertUSerTickerMAp";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@username", user);
                objCmd.Parameters.Add("@projectname", project);
                objCmd.Parameters.Add("@symb", symbol);


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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetDeleteUSertickerMap(string USERID, string COMPANY_SYMBOL)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteUserTickerMap";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@username", USERID);
                objCmd.Parameters.Add("@symb", COMPANY_SYMBOL);


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
            return Json<string>("Add Question Type");
        }


        //user control MApp//
        public System.Web.Http.Results.JsonResult<string> GetInsertUSerControlMap(string user, string project, string controlname)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsertUSerControlMAp";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@username", user);
                objCmd.Parameters.Add("@projectname", project);
                objCmd.Parameters.Add("@controlname", controlname);


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
            return Json<string>("Add Question Type");
        }
        public System.Web.Http.Results.JsonResult<DataTable> GetUserControlMap()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetUserControlMap";
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

        public System.Web.Http.Results.JsonResult<string> GetDeleteUSerControlMap(string USERID, string CONTROL)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteUserControlMap";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@username", USERID);
                objCmd.Parameters.Add("@cont", CONTROL);


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
            return Json<string>("Add Question Type");
        }


        public System.Web.Http.Results.JsonResult<DataTable> GetAssociationList(
          )
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "GetAssocaitonList";
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


        // Standard Type///
        public System.Web.Http.Results.JsonResult<DataTable> GetStandardTypeList()
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "StandardTypeSetup";
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

        public System.Web.Http.Results.JsonResult<string> GetInsertStandardType(string StandardType)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "InsetStandardTypeList";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@StandardType", StandardType);


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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetDeleteStandardType(string standardTypeCode)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteStandardTypeList";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@standardTypeCode", standardTypeCode);


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
            return Json<string>("Add Question Type");
        }

        public System.Web.Http.Results.JsonResult<string> GetUpdateStandardType(string standardtypeCode, string controlname)
        {

            con = new OracleConnection(constr);
            DataTable dt = new DataTable();
            using (OracleConnection objConn = new OracleConnection(constr))
            {
                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "UpdateStandardTypeList";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("@standardtypeCode", standardtypeCode);
                objCmd.Parameters.Add("@controlname", controlname);


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
            return Json<string>("Add Question Type");
        }

        [HttpPost]
        public string DelteConstraintDataPrevious()
        {

            con = new OracleConnection(constr);

            using (OracleConnection objConn = new OracleConnection(constr))
            {

                OracleCommand objCmd = new OracleCommand();
                objCmd.Connection = objConn;
                objCmd.CommandText = "DeleteConstraintFilterPrev";
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.Add("PRC", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
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
        }

        [HttpPost]
        [Route("api/XBRL/InsertParamterData")]


        public HttpResponseMessage InsertParamterData(Utility utility)
        {
            try
            {
                DataTable dt = (DataTable)JsonConvert.DeserializeObject(utility.bulkData, (typeof(DataTable)));

                using (var connection = new Oracle.DataAccess.Client.OracleConnection(constr))
                {
                    connection.Open();
                    using (var bulkCopy = new Oracle.DataAccess.Client.OracleBulkCopy(connection, Oracle.DataAccess.Client.OracleBulkCopyOptions.UseInternalTransaction))
                    {
                        bulkCopy.DestinationTableName = "PARAMETERFILTER";
                        bulkCopy.BulkCopyTimeout = 500;
                        bulkCopy.WriteToServer(dt);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, " Parameter Filter Not Found");
        }
        [HttpPost]
        [Route("api/XBRL/InsertCovarianceMatrix")]
        public HttpResponseMessage InsertCovarianceMatrix(string rowArray)
        {
            try
            {
                DataTable dt = (DataTable)JsonConvert.DeserializeObject(rowArray, (typeof(DataTable)));
                var rowcount = dt.Rows.Count;
                using (var connection = new Oracle.DataAccess.Client.OracleConnection(constr))
                {
                    connection.Open();
                    using (var bulkCopy = new Oracle.DataAccess.Client.OracleBulkCopy(connection, Oracle.DataAccess.Client.OracleBulkCopyOptions.UseInternalTransaction))
                    {
                        bulkCopy.DestinationTableName = "COVARIANCE_MATRIX";
                        bulkCopy.BulkCopyTimeout = 700;
                        bulkCopy.WriteToServer(dt);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return Request.CreateErrorResponse(HttpStatusCode.NotFound, " Matrix Not Found");
        }


            //[HttpPost]
            //[Route("api/XBRL/SaveDuplicateClient")]
            //public DBActionResult SaveDuplicateClient(Utility utility)
            //{
            //    var dbar = new DBActionResult();
            //    var objUtility = new Utility();

            //    //try
            //    //{
            //    //  ;
            //    //}
            //    //catch (Exception ex)
            //    //{
            //    //    dbar.Action = false;
            //    //    dbar.ErrorMessage = ex.Message;
            //        return dbar;
            //    //}

            //}
            //[HttpPost]
            //public string GetInsertParamterData(GlobalClass.abc obj)
            //{
            //    //DataTable dt = (DataTable)JsonConvert.DeserializeObject(obj.ParameterFilter, (typeof(DataTable)));
            //    con = new OracleConnection(constr);

            //    using (OracleConnection objConn = new OracleConnection(constr))
            //    {
            //        if (dt.Rows.Count > 0)
            //        {

            //            for (int i = 0; i < dt.Rows.Count; i++)
            //            {

            //                OracleCommand objCmd = new OracleCommand();
            //                objCmd.Connection = objConn;
            //                objCmd.CommandText = "InsertConstraintFilter";
            //                objCmd.CommandType = CommandType.StoredProcedure;
            //                objCmd.Parameters.Add("@compName", dt.Rows[i]["COMPANY_NAME"]);
            //                objCmd.Parameters.Add("@ComSymbol", dt.Rows[i]["COMPANY_SYMBOL"]);
            //                objCmd.Parameters.Add("@pri", dt.Rows[i]["PRICE"]);
            //                objCmd.Parameters.Add("@chn_val", dt.Rows[i]["CHANGEVAL"]);
            //                objCmd.Parameters.Add("@Rel_vol", dt.Rows[i]["RELVOLUME"]);
            //                objCmd.Parameters.Add("@Mc_Val", dt.Rows[i]["MC"]);
            //                objCmd.Parameters.Add("@InsDesc", dt.Rows[i]["INDUSTRY_DESC"]);
            //                objCmd.Parameters.Add("@SecDesc", dt.Rows[i]["SECTOR_DESC"]);





            //                try
            //                {
            //                    objConn.Open();
            //                    objCmd.ExecuteNonQuery();

            //                }
            //                catch (Exception ex)
            //                {
            //                    System.Console.WriteLine("Exception: {0}", ex.ToString());

            //                }
            //                objConn.Close();
            //            }
            //        }




            //    }
            //    return "";
            //}
            //[HttpPost]
            //public string GETInsertCovarianceMatrix(GlobalClass.CovarianceMatrix obj)
            //{
            //    DataTable dt = (DataTable)JsonConvert.DeserializeObject(obj.ConvMatrix, (typeof(DataTable)));
            //    con = new OracleConnection(constr);

            //    using (OracleConnection objConn = new OracleConnection(constr))
            //    {
            //        if (dt.Rows.Count > 0)
            //        {

            //            for (int i = 0; i < dt.Rows.Count; i++)
            //            {

            //                OracleCommand objCmd = new OracleCommand();
            //                objCmd.Connection = objConn;
            //                objCmd.CommandText = "InsertConvarianceMatrix";
            //                objCmd.CommandType = CommandType.StoredProcedure;
            //                objCmd.Parameters.Add("@compName1", dt.Rows[i]["Company1"]);
            //                objCmd.Parameters.Add("@compName2", dt.Rows[i]["Company2"]);
            //                objCmd.Parameters.Add("@val", dt.Rows[i]["Sector"]);
            //                try
            //                {
            //                    objConn.Open();
            //                    objCmd.ExecuteNonQuery();

            //                }
            //                catch (Exception ex)
            //                {
            //                    System.Console.WriteLine("Exception: {0}", ex.ToString());

            //                }
            //                objConn.Close();
            //            }
            //        }




            //    }
            //    return "";
            //}
        }
}
