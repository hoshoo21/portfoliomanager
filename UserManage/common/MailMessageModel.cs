using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace clientPortal.common
{
    public class MailMessageModel
    {
        public string userid { get; set; }
        public string password { get; set; }
        public string urlAttachment { get; set; }

        public MailMessage mailMessage {get;set;}
    }
}