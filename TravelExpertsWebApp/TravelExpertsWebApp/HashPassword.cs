using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace TravelExpertsWebApp
{
    public static class HashPassword
    {
        public static string ApplyHash(string custPassword)
        {
            var password_bytes = ASCIIEncoding.ASCII.GetBytes(custPassword);

            byte[] data_input = new byte[password_bytes.Length];

            for (int i = 0; i < password_bytes.Length; i++)
            {
                data_input[i] = password_bytes[i];
            }

            SHA1 shaM = new SHA1Managed();
            var hashed_byte_array = shaM.ComputeHash(data_input);

            return Convert.ToBase64String(hashed_byte_array);
        }
    }
}