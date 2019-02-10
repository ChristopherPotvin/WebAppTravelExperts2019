using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.App_Code
{
    /*Create ItemsBought class with all the pertinent getters & setters
    * Lead Programmer: Andrew Moss
     * Date: 11th February 2018
     */

    public class ItemsBought
    {
        private string description;
        private int travelerCount;
        private string destination;
        private DateTime tripStart;
        private DateTime tripEnd;        
        private double price;

        public string Description
        {
            get
            {
                return description;
            }

            set
            {
                description = value;
            }
        }

        public int TravelerCount
        {
            get
            {
                return travelerCount;
            }

            set
            {
                travelerCount = value;
            }
        }

        public string Destination
        {
            get
            {
                return destination;
            }

            set
            {
                destination = value;
            }
        }

        public DateTime TripStart
        {
            get
            {
                return tripStart;
            }

            set
            {
                tripStart = value;
            }
        }

        public DateTime TripEnd
        {
            get
            {
                return tripEnd;
            }

            set
            {
                tripEnd = value;
            }
        }

        public double Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }
    }
}