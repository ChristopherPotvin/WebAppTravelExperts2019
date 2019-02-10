using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace TravelExpertsWebApp
{
    /*Following class(es) are used to format phone numbers entered by the users to have a consistent formate in the database
     * Lead Programmer: Mo Sagnia
     * Date: 11th February 2018
     */
    public static class FormatePhoneNo
    {
        public static string ApplyFormatting(string phoneEntry)
        {
            string noSpacesPhoneNo = phoneEntry.Trim();
            char[] characters = { ' ', '.', '*', '-', '~', '@', '#', '$', '%', '^', '?', '!', '(', ')', '=', '/','_','[',']','<','>'};
            int pos;

            StringBuilder fullyFormatted = new StringBuilder();

            foreach (char c in phoneEntry)
            {
                pos = Array.IndexOf(characters, c);

                if (pos == -1) //no match
                {
                    fullyFormatted.Append(c);
                }
            }

            string fullyFormattedString = fullyFormatted.ToString();

            return fullyFormattedString.Replace(@"\", "");
        }
    }
}