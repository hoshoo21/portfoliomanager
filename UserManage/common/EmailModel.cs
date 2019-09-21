using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clientPortal.common
{
    public class EmailModel
    {
        public string ToAddresses { get; set; }
        public string ccAddresses { get; set; }
        public string bccAddresses { get; set; }
        public string subject { get; set; }
       


        public string message { get; set; }

        public string email { get; set; }


    }
}