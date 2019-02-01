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
        [DataObjectMethod(DataObjectMethodType.Select)]
        //get customer login 
        public static string GetCustomerLogin(Customers cust)
        {
            string output = "";
            //prepare conneciton
            SqlConnection connection = TravelExpertsDB.GetConnection();

            string selectString = "SELECT count(*) from Customers where CustEmail = @CustEmail AND CustPassword = HASHBYTES('SHA1', @CustPassword)";

            SqlCommand cmd = new SqlCommand(selectString, connection);
            cmd.Parameters.AddWithValue("@CustEmail", cust.CustEmail);
            cmd.Parameters.AddWithValue("@CustPassword", cust.CustPassword);

            try
            {
                connection.Open();
                output = cmd.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return output;
        }

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
                                "values(@CustFirstName, @CustLastName, @CustAddress, @CustCity, @CustProv, @CustPostal, @CustCountry, @CustHomePhone, @CustBusPhone, @CustEmail, HASHBYTES('SHA1', @CustPassword))";
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

        [DataObjectMethod(DataObjectMethodType.Update)]
        //updates existing customer record and returns bool success flag
        public static bool UpdateCustomer(Customers old_Customer, Customers customer)
        {
            bool successful = true;
            SqlConnection connection = TravelExpertsDB.GetConnection();

            string updateString = "UPDATE CUSTOMERS SET CustFirstName = @CustNewFName, CustLastName = @CustNewLName, CustAddress = @CustNewAddress, CustCity =        @CustNewCity, CustProv = @CustNewProv, CustPostal = @CustNewPostal, CustCountry = @CustNewCountry, CustHomePhone = @CustNewHomePhone, CustBusPhone = @CustNewBusPhone, CustEmail = @CustNewEmail WHERE " +
                "CustFirstName = @CustOldFName, CustLastName = @CustOldLName, CustAddress = @CustOldAddress, CustCity = @CustOldCity, CustProv = @CustOldProv, CustPostal = @CustOldPostal, CustCountry = @CustOldCountry, CustHomePhone = @CustOldHomePhone, CustBusPhone = @CustOldBusPhone, CustEmail = @CustOldEmail";

            SqlCommand updateCommand = new SqlCommand(updateString, connection);
            updateCommand.Parameters.AddWithValue("@CustOldFname", old_Customer.CustFirstName);
            updateCommand.Parameters.AddWithValue("@CustOldLname", old_Customer.CustLastName);
            updateCommand.Parameters.AddWithValue("@CustOldAddress", old_Customer.CustAddress);
            updateCommand.Parameters.AddWithValue("@CustOldCity", old_Customer.CustCity);
            updateCommand.Parameters.AddWithValue("@CustOldProv", old_Customer.CustProv);
            updateCommand.Parameters.AddWithValue("@CustOldPostal", old_Customer.CustPostal);
            updateCommand.Parameters.AddWithValue("@CustOldCountry", old_Customer.CustCountry);
            updateCommand.Parameters.AddWithValue("@CustOldHomePhone", old_Customer.CustHomePhone);
            updateCommand.Parameters.AddWithValue("@CustOldBusPhone", old_Customer.CustBusPhone);
            updateCommand.Parameters.AddWithValue("@CustOldEmail", old_Customer.CustEmail);

            updateCommand.Parameters.AddWithValue("@CustNewFname", customer.CustFirstName);
            updateCommand.Parameters.AddWithValue("@CustNewLname", old_Customer.CustLastName);
            updateCommand.Parameters.AddWithValue("@CustNewAddress", old_Customer.CustAddress);
            updateCommand.Parameters.AddWithValue("@CustNewCity", old_Customer.CustCity);
            updateCommand.Parameters.AddWithValue("@CustNewProv", old_Customer.CustProv);
            updateCommand.Parameters.AddWithValue("@CustNewPostal", old_Customer.CustPostal);
            updateCommand.Parameters.AddWithValue("@CustNewCountry", old_Customer.CustCountry);
            updateCommand.Parameters.AddWithValue("@CustNewHomePhone", old_Customer.CustHomePhone);
            updateCommand.Parameters.AddWithValue("@CustNewBusPhone", old_Customer.CustBusPhone);
            updateCommand.Parameters.AddWithValue("@CustNewEmail", old_Customer.CustEmail);
        }
    }
}
