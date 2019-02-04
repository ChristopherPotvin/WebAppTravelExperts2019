using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.Model
{ 
    public class CustomerContact
    {

        public string CustFirstName { get; set; }
        public string CustLastName { get; set; }
        public string Email { get; set; }
        public string CustSubject { get; set; }
        public string CustMessage { get; set; }

        public CustomerContact(string custFN, string custLN, string custEmail, string custSubject, string custMessage) // custom constructor for the customer contact form
        {
            this.CustFirstName = custFN;
            this.CustLastName = custLN;
            this.Email = custEmail;
            this.CustSubject = custSubject;
            this.CustMessage = custMessage;
        }

    }
}