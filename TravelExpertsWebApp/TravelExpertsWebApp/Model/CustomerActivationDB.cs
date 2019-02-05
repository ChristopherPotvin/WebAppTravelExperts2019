using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TravelExpertsWebApp.App_Code;

namespace TravelExpertsWebApp.Model
{
    [DataObject(true)]
    public static class CustomerActivationDB
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static string AddActivation(string custEmail)
        {
            string activationCode = Guid.NewGuid().ToString(); //generate random activation code

            SqlConnection connection = TravelExpertsDB.GetConnection();

            string insertActivation = "INSERT INTO UserActivation VALUES (@CustEmail, @ActivationCode)";

            SqlCommand insertCommand = new SqlCommand(insertActivation, connection);

            insertCommand.Parameters.AddWithValue("@CustEmail", custEmail);
            insertCommand.Parameters.AddWithValue("@ActivationCode", activationCode);

            try
            {
                connection.Open();
                int count = insertCommand.ExecuteNonQuery();
                if (count == 1)
                {
                    return activationCode;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return null;
        }
    }
}