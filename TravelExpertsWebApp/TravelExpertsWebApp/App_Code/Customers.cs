using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.App_Code
{
    //create Customers class with all the pertinent getters & setters
    public class Customers
    {
        public Customers() { } //default constructor 

        public int CustomerId {get; set; }

        public string CustFirstName { get; set; }

        public string CustLastName { get; set; }

        public string CustAddress { get; set; }

        public string CustCity { get; set; }

        public string CustProv { get; set; }

        public string CustPostal { get; set; }

        public string CustCountry { get; set; }

        public string CustHomePhone { get; set; }

        public string CustBusPhone { get; set; }

        public string CustEmail { get; set; }

        public Customers(string custFirstName, string custLastName, string custAddress, string custCity, string CustProv, string custProv, string custPostal, string custCountry, string custHomePhone, string custBusPhone, string custEmail)
        {
            CustFirstName = custFirstName;
            CustLastName = custLastName;
            CustAddress = custAddress;
            CustCity = custCity;
            CustProv = custProv;
            CustPostal = custPostal;
            CustCountry = custCountry;
            CustHomePhone = custHomePhone;
            CustBusPhone = custBusPhone;
            CustEmail = custEmail;
        }
    }
}