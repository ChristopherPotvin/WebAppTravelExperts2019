using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.App_Code
{
    /*Create various static classes to perform various SQL queries
    * Lead Programmer: Peter Oganwu
    * Helper: Andrew Moss
     * Date: 11th February 2018
     */

    [DataObject(true)]
    public static class PackagesDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Packages> GetPackages()
        {

            // Return List
            List<Packages> packageList = new List<Packages>();

            SqlConnection connection = TravelExpertsDB.GetConnection();

            string selectStatement
                = "SELECT PackageId, PkgName, PkgStartDate, PkgEndDate, PkgDesc, PkgBasePrice, PkgAgencyCommission "
                + "FROM Packages;";

            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);

            try
            {
                connection.Open();

                SqlDataReader packageReader = selectCommand.ExecuteReader();

                while (packageReader.Read())
                {
                    Packages p = new Packages(); //Creating a Packages object.
                    p.PackageId = (int)packageReader["PackageId"];
                    p.PkgName = (string)packageReader["PkgName"];

                    if (packageReader["PkgStartDate"] == DBNull.Value)
                    {
                        p.PkgStartDate = null;
                    }
                    else
                    {
                        p.PkgStartDate = (DateTime)(packageReader["PkgStartDate"]);
                    }

                    if (packageReader["PkgStartDate"] == DBNull.Value)
                    {
                        p.PkgEndDate = null;
                    }
                    else
                    {
                        p.PkgEndDate = (DateTime)packageReader["PkgEndDate"];
                    }

                    if (packageReader["PkgDesc"] == DBNull.Value)
                    {
                        p.PkgDesc = null;
                    }
                    else
                    {
                        p.PkgDesc = (string)packageReader["PkgDesc"];
                    }

                    p.PkgBasePrice = (decimal)packageReader["PkgBasePrice"];

                    if (packageReader["PkgAgencyCommission"] == DBNull.Value)
                    {
                        p.PkgAgencyCommission = null;
                    }
                    else
                    {
                        p.PkgAgencyCommission = (decimal)packageReader["PkgAgencyCommission"];
                    }

                    packageList.Add(p);
                }             
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

            return packageList;
        }
    }
}