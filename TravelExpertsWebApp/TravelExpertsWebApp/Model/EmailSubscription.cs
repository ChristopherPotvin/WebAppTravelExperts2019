using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.Model
{
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