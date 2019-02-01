using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.App_Code
{
    [DataObject(true)]

    public static class EmailSubsriptionDB
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
}