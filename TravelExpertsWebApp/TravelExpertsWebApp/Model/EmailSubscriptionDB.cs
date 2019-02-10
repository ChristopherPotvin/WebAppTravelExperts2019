using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TravelExpertsWebApp.App_Code;

namespace TravelExpertsWebApp.Model

{   // Lead Programmer: Chris Potvin
    // Summary: SQL statement for the insert of a new email submission via the home page. Information sent and stored in the email subscription table
    [DataObject(true)]

    public static class EmailSubscriptionDB
    {
            [DataObjectMethod(DataObjectMethodType.Insert)]

            public static bool InsertEmailSubscriptionInfo(EmailSubscription email)
            {
                bool successful = false;

                SqlConnection connection = TravelExpertsDB.GetConnection(); // instantiate the connection

                string insertEmailString = "INSERT INTO CustomerEmail " +
                                            "(Email) " +
                                            "values(@Email)";

                SqlCommand insertCommand = new SqlCommand(insertEmailString, connection);
                


                insertCommand.Parameters.AddWithValue("@Email", email.Email);
        

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