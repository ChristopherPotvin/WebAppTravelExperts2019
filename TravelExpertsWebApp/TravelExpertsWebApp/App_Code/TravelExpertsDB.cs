using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.App_Code
{
    //create a class to connect to the database (i.e.: Travel Experts Database)
    public static class TravelExpertsDB
    {
        //retrieve connection string from Web.Config
        public static SqlConnection GetConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["AzureConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            return con;
        }
    }
}