
using Newtonsoft.Json;
using Oracle.ManagedDataAccess.Client;
using Portfolio;
using Portfolio.Controller;
using System;
using System.Configuration;
using System.Data;


using System.Web.Http;


namespace UserManage
{
    public class BulkDataController : ApiController
    {
        public string connectionString = ConfigurationManager.AppSettings["connStringXBRL"].ToString();
       
      

        [HttpPost]
        [Route("api/BulkData/InsertCovarianceMatrix")]
        public string InsertCovarianceMatrix(GlobalClass.CovarianceMatrix obj)
        {
            try
            {
                DataTable dt = (DataTable)JsonConvert.DeserializeObject(obj.ConvMatrix, (typeof(DataTable)));

                using (var connection = new Oracle.DataAccess.Client.OracleConnection(connectionString))
                {
                    connection.Open();
                    using (var bulkCopy = new Oracle.DataAccess.Client.OracleBulkCopy(connection, Oracle.DataAccess.Client.OracleBulkCopyOptions.UseInternalTransaction))
                    {
                        bulkCopy.DestinationTableName = "COVARIANCE_MATRIX";
                        bulkCopy.BulkCopyTimeout = 60;
                        bulkCopy.WriteToServer(dt);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return "";
        }
    }
}