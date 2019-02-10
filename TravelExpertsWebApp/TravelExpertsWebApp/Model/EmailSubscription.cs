using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.Model
{
    // Lead Programmer: Chris Potvin
    // Summary: SQL statement for the insert of a new email submission via the homepage. Information sent and stored in the email subscription table
    public class EmailSubscription
    {
        public EmailSubscription() { } // default constructor

        public string Email { get; set; }

        public EmailSubscription(string email)
        {

            this.Email = email;
      
        }
    }
}