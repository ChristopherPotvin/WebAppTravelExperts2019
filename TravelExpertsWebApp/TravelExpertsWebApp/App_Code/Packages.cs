using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelExpertsWebApp.App_Code
{
    /*Create Packages class with all the pertinent getters & setters
    * Lead Programmer: Andrew Moss
    * Helper: Peter Oganwu
     * Date: 11th February 2018
     */

    public class Packages
    {
        private int packageId;
        private string pkgName;
        private DateTime? pkgStartDate;
        private DateTime? pkgEndDate;
        private string pkgDesc;
        private decimal pkgBasePrice;
        private decimal? pkgAgencyCommission;

        public Packages() { } //Empty Constructor

        //Constructor
        public Packages(int packagesId, string pkgName, decimal pkgBasePrice, decimal pkgAgencyCommission)
        {
            this.PackageId = packageId;
            this.PkgName = pkgName;
            this.PkgBasePrice = pkgBasePrice;
            this.PkgAgencyCommission = pkgAgencyCommission;
        }

        public int PackageId
        {
            get
            {
                return packageId;
            }
            set
            {
                packageId = value;
            }
        }

        public string PkgName
        {
            get
            {
                return pkgName;
            }
            set
            {
                pkgName = value;
            }
        }

        public DateTime? PkgStartDate
        {
            get
            {
                return pkgStartDate;
            }
            set
            {
                pkgStartDate = value;
            }
        }

        public DateTime? PkgEndDate
        {
            get
            {
                return pkgEndDate;
            }
            set
            {
                pkgEndDate = value;
            }
        }

        public string PkgDesc
        {
            get
            {
                return pkgDesc;
            }
            set
            {
                pkgDesc = value;
            }
        }

        public decimal PkgBasePrice
        {
            get
            {
                return pkgBasePrice;
            }
            set
            {
                pkgBasePrice = value;
            }
        }

        public decimal? PkgAgencyCommission
        {
            get
            {
                return pkgAgencyCommission;
            }
            set
            {
                pkgAgencyCommission = value;
            }
        }
    }
}