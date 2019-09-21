using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Portfolio
{
    public class GlobalXBRL
    {
        private dal db;
        private DataSet ds;

        private OracleConnection con;
        private OracleCommand cmd;
        private OracleDataAdapter adp;
        private string _compcik;
        public string compcik { get { return _compcik; } set { _compcik = value; } }
        private string _compCode;
        public string compCode { get { return _compCode; } set { _compCode = value; } }

        private string _eleNature;
        public string eleNature { get { return _eleNature; } set { _eleNature = value; } }
        private string _eleName;
        public string eleName { get { return _eleName; } set { _eleName = value; } }

        private string _parentName;
        public string parentName { get { return _parentName; } set { _parentName = value; } }

        private string _naics;
        public string naics { get { return _naics; } set { _naics = value; } }

        private string _eleVal1;
        public string eleVal1 { get { return _eleVal1; } set { _eleVal1 = value; } }

        private string _active;
        public string active { get { return _active; } set { _active = value; } }

        private string _eleVal2;
        public string eleVal2 { get { return _eleVal2; } set { _eleVal2 = value; } }

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


        private string _structDesc;
        public string structDesc { get { return _structDesc; } set { _structDesc = value; } }

        private string _LocFlag;
        public string LocFlag { get { return _LocFlag; } set { _LocFlag = value; } }

        private string _annualRep;
        public string annualRep { get { return _annualRep; } set { _annualRep = value; } }

        private string _mc;
        public string mc { get { return _mc; } set { _mc = value; } }

        private string _level;
        public string level { get { return _level; } set { _level = value; } }

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
        public void InsertCompany()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertCompany";
            cmd.Parameters.Add("@compCode", compCode);
            cmd.Parameters.Add("@compName", compName);
            cmd.Parameters.Add("@compSymbol", compSymbol);
            cmd.Parameters.Add("@regNo", regNo);
            cmd.Parameters.Add("@ntnNo", ntn);
            cmd.Parameters.Add("@indCode", indCode);
            cmd.Parameters.Add("@sector", sector);
            cmd.Parameters.Add("@countReg", countReg);
            cmd.Parameters.Add("@PassEndDate", PassEndDate);
            cmd.Parameters.Add("@stateLoc", stateLoc);
            cmd.Parameters.Add("@sataInc", sataInc);
            DateTime todate = DateTime.Now;
            cmd.Parameters.Add("@creatDate", todate);
            //cmd.Parameters.Add("@creatDate", DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"));
            cmd.Parameters.Add("@creUSer", "");
            cmd.Parameters.Add("@LocFlag", LocFlag);
            cmd.Parameters.Add("@annualRep", annualRep);
            cmd.Parameters.Add("@mcCode", mc);
            cmd.Parameters.Add("@oclause", oclause);
            cmd.Parameters.Add("@countory", count);
            cmd.Parameters.Add("@stockExc", stockExc);
            cmd.Parameters.Add("@repCurrency", repCurrency);
            cmd.Parameters.Add("@naicsCode", naics);
            db.runProXbrl(cmd);
            //insert comoany//

        }

        public void InsertStructure()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertStructure";

            cmd.Parameters.Add("@countory", count);
            cmd.Parameters.Add("@struct", structure);
            cmd.Parameters.Add("@structureVal", structureVal);
            cmd.Parameters.Add("@structDesc", structDesc);
            cmd.Parameters.Add("@lvl", level);

            cmd.Parameters.Add("@creUSer", "");
            DateTime todate = DateTime.Now;
            cmd.Parameters.Add("@creatDate", todate);


            db.runProXbrl(cmd);

        }
        public void InsertCountry()
        {
            db = new dal();
            cmd = new OracleCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertCountry";
            cmd.Parameters.Add("@countrys", count);
            cmd.Parameters.Add("@active", active);
            db.runProXbrl(cmd);

        }
      
        

    }
}