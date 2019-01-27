using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TravelExpertsWebApp.App_Code;

namespace TravelExpertsWebApp
{
    [DataObject(true)]
    public static class CustomersDB
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        //insert new customer record
        public static int AddCustomer(Customers cust)
        {
            int custId = 0;

            //prepare connection
            SqlConnection connection = TravelExpertsDB.GetConnection();

            //prepare statement
            string insertString = "INSERT INTO CUSTOMERS "+
                                  "(CustFirstName, CustLastName, CustAddress, CustCity, CustProv, CustPostal, CustCountry, CustHomePhone, CustBusPhone, CustEmail, CustPassword) "+
                                "values(@CustFirstName, @CustLastName, @CustAddress, @CustCity, @CustProv, @CustPostal, @CustCountry, @CustHomePhone, @CustBusPhone, @CustEmail, @CustPassword)";
            SqlCommand insertCommand = new SqlCommand(insertString, connection);
            insertCommand.Parameters.AddWithValue("@CustFirstName", cust.CustFirstName);
            insertCommand.Parameters.AddWithValue("@CustLastName", cust.CustLastName);
            insertCommand.Parameters.AddWithValue("@CustAddress", cust.CustAddress);
            insertCommand.Parameters.AddWithValue("@CustCity", cust.CustCity);
            insertCommand.Parameters.AddWithValue("@CustProv", cust.CustProv);
            insertCommand.Parameters.AddWithValue("@CustPostal", cust.CustPostal);
            insertCommand.Parameters.AddWithValue("@CustCountry", cust.CustCountry);
            insertCommand.Parameters.AddWithValue("@CustHomePhone", cust.CustHomePhone);
            insertCommand.Parameters.AddWithValue("@CustBusPhone", cust.CustBusPhone);
            insertCommand.Parameters.AddWithValue("@CustEmail", cust.CustEmail);
            insertCommand.Parameters.AddWithValue("@CustPassword", cust.CustPassword);

            try
            {
                //open connection
                connection.Open();

                //execute the statement
                int i = insertCommand.ExecuteNonQuery();
                if(i == 1) //one record inserted
                {
                    // retrieve customer id from the added record
                    //ident_current Returns the last identity value generated for the customers table
                    string selectString = "select ident_current('Customers') from Customers";
                    SqlCommand selectCommand = new SqlCommand(selectString, connection);
                    custId = Convert.ToInt32(selectCommand.ExecuteScalar()); 
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return custId;
        }
    }
}
