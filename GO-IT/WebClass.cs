using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GO_IT
{
    public class WebClass
    {
        protected void Mail(int _rno, string Email, string FName, string LName, string Body)
        {

        }

        protected string MyGuid()
        {
            Guid guid = new Guid();
            string unique = guid;
            return unique;
        }
    }
}