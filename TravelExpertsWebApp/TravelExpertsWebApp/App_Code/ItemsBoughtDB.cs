using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.App_Code
{
    [DataObject(true)]
    public class ItemsBoughtDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<ItemsBought> GetItemsBought(int CustomerId)
        {

            List<ItemsBought> purchases = new List<ItemsBought>();

            using (SqlConnection connection = TravelExpertsDB.GetConnection())
            {
                connection.Open();

                string query = "SELECT Description,TravelerCount, Destination,TripStart, TripEnd, BasePrice " +
                                "FROM Bookings " +
                                "INNER JOIN BookingDetails on Bookings.BookingId = BookingDetails.BookingId " +
                                "WHERE Bookings.CustomerId = @CustomerID;"; // Placeholder



                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerId", CustomerId);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ItemsBought purchase = new ItemsBought();

                            purchase.Description = reader["Description"].ToString();
                            purchase.TravelerCount = Convert.ToInt32(reader["TravelerCount"]);
                            purchase.Destination = reader["Destination"].ToString();
                            purchase.TripStart = Convert.ToDateTime(reader["TripStart"]);
                            purchase.TripEnd = Convert.ToDateTime(reader["TripEnd"]);
                            purchase.Price = Convert.ToDouble(reader["BasePrice"]);

                            purchases.Add(purchase);
                        }
                    }
                }
            }

            return purchases;
        }
    }
}