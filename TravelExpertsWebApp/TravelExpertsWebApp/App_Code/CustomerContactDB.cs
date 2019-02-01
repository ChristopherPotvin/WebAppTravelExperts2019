using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.App_Code
{
    [DataObject(true)]

    public static class CustomerContactDB
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static bool InsertCustomerContactInfo(CustomerContact customer)
        {
            bool successful = false;

            SqlConnection connection = TravelExpertsDB.GetConnection(); // instantiate the connection

            string insertContactString = "INSERT INTO CustomerContact " +
                                        "(CustFirstName, CustLastName, Email, CustSubject, CustMessage) " +
                                        "values(@CustFirstName, @CustLastName, @Email, @CustSubject, @CustMessage)";

            SqlCommand insertCommand = new SqlCommand(insertContactString, connection);


            insertCommand.Parameters.AddWithValue("@CustFirstName", customer.CustFirstName);
            insertCommand.Parameters.AddWithValue("@CustLastName", customer.CustLastName);
            insertCommand.Parameters.AddWithValue("@CustLastName", customer.Email);
            insertCommand.Parameters.AddWithValue("@CustLastName", customer.CustSubject);
            insertCommand.Parameters.AddWithValue("@CustLastName", customer.CustMessage);

            try
            {
                connection.Open();
                int count = insertCommand.ExecuteNonQuery();
                if (count == 1)
                {
                    successful = true;
                }
            }
            catch (Exception ex)
            {
                connection.Close();
            }

            return successful;

        }

    }
}