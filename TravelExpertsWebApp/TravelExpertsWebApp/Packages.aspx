<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="TravelExpertsWebApp.Packages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
</head>


<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="lvPackages" runat="server" DataSourceID="odsPackages">

                <AlternatingItemTemplate>
                    <span style="">PackageId:
                    <asp:Label ID="PackageIdLabel" runat="server" Text='<%# Eval("PackageId") %>' />
                    <br />
                    PkgName:
                    <asp:Label ID="PkgNameLabel" runat="server" Text='<%# Eval("PkgName") %>' />
                    <br />
                    PkgStartDate:
                    <asp:Label ID="PkgStartDateLabel" runat="server" Text='<%# Eval("PkgStartDate") %>' />
                    <br />
                    PkgEndDate:
                    <asp:Label ID="PkgEndDateLabel" runat="server" Text='<%# Eval("PkgEndDate") %>' />
                    <br />
                    PkgDesc:
                    <asp:Label ID="PkgDescLabel" runat="server" Text='<%# Eval("PkgDesc") %>' />
                    <br />
                    PkgBasePrice:
                    <asp:Label ID="PkgBasePriceLabel" runat="server" Text='<%# Eval("PkgBasePrice") %>' />
                    <br />
                    PkgAgencyCommission:
                    <asp:Label ID="PkgAgencyCommissionLabel" runat="server" Text='<%# Eval("PkgAgencyCommission") %>' />
                    <br />
                    <br /></span>
                </AlternatingItemTemplate>

                <EditItemTemplate>
                    <span style="">PackageId:
                    <asp:TextBox ID="PackageIdTextBox" runat="server" Text='<%# Bind("PackageId") %>' />
                    <br />
                    PkgName:
                    <asp:TextBox ID="PkgNameTextBox" runat="server" Text='<%# Bind("PkgName") %>' />
                    <br />
                    PkgStartDate:
                    <asp:TextBox ID="PkgStartDateTextBox" runat="server" Text='<%# Bind("PkgStartDate") %>' />
                    <br />
                    PkgEndDate:
                    <asp:TextBox ID="PkgEndDateTextBox" runat="server" Text='<%# Bind("PkgEndDate") %>' />
                    <br />
                    PkgDesc:
                    <asp:TextBox ID="PkgDescTextBox" runat="server" Text='<%# Bind("PkgDesc") %>' />
                    <br />
                    PkgBasePrice:
                    <asp:TextBox ID="PkgBasePriceTextBox" runat="server" Text='<%# Bind("PkgBasePrice") %>' />
                    <br />
                    PkgAgencyCommission:
                    <asp:TextBox ID="PkgAgencyCommissionTextBox" runat="server" Text='<%# Bind("PkgAgencyCommission") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /><br /></span>
                </EditItemTemplate>

                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>

                <InsertItemTemplate>
                    <span style="">PackageId:
                    <asp:TextBox ID="PackageIdTextBox" runat="server" Text='<%# Bind("PackageId") %>' />
                    <br />PkgName:
                    <asp:TextBox ID="PkgNameTextBox" runat="server" Text='<%# Bind("PkgName") %>' />
                    <br />PkgStartDate:
                    <asp:TextBox ID="PkgStartDateTextBox" runat="server" Text='<%# Bind("PkgStartDate") %>' />
                    <br />PkgEndDate:
                    <asp:TextBox ID="PkgEndDateTextBox" runat="server" Text='<%# Bind("PkgEndDate") %>' />
                    <br />PkgDesc:
                    <asp:TextBox ID="PkgDescTextBox" runat="server" Text='<%# Bind("PkgDesc") %>' />
                    <br />PkgBasePrice:
                    <asp:TextBox ID="PkgBasePriceTextBox" runat="server" Text='<%# Bind("PkgBasePrice") %>' />
                    <br />PkgAgencyCommission:
                    <asp:TextBox ID="PkgAgencyCommissionTextBox" runat="server" Text='<%# Bind("PkgAgencyCommission") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /><br /></span>
                </InsertItemTemplate>

                <ItemTemplate>
                    <span style="">PackageId:
                    <asp:Label ID="PackageIdLabel" runat="server" Text='<%# Eval("PackageId") %>' />
                    <br />
                    PkgName:
                    <asp:Label ID="PkgNameLabel" runat="server" Text='<%# Eval("PkgName") %>' />
                    <br />
                    PkgStartDate:
                    <asp:Label ID="PkgStartDateLabel" runat="server" Text='<%# Eval("PkgStartDate") %>' />
                    <br />
                    PkgEndDate:
                    <asp:Label ID="PkgEndDateLabel" runat="server" Text='<%# Eval("PkgEndDate") %>' />
                    <br />
                    PkgDesc:
                    <asp:Label ID="PkgDescLabel" runat="server" Text='<%# Eval("PkgDesc") %>' />
                    <br />
                    PkgBasePrice:
                    <asp:Label ID="PkgBasePriceLabel" runat="server" Text='<%# Eval("PkgBasePrice") %>' />
                    <br />
                    PkgAgencyCommission:
                    <asp:Label ID="PkgAgencyCommissionLabel" runat="server" Text='<%# Eval("PkgAgencyCommission") %>' />
                    <br />
                    <br /></span>
                </ItemTemplate>

                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>

                <SelectedItemTemplate>
                    <span style="">PackageId:
                    <asp:Label ID="PackageIdLabel" runat="server" Text='<%# Eval("PackageId") %>' />
                    <br />
                    PkgName:
                    <asp:Label ID="PkgNameLabel" runat="server" Text='<%# Eval("PkgName") %>' />
                    <br />
                    PkgStartDate:
                    <asp:Label ID="PkgStartDateLabel" runat="server" Text='<%# Eval("PkgStartDate") %>' />
                    <br />
                    PkgEndDate:
                    <asp:Label ID="PkgEndDateLabel" runat="server" Text='<%# Eval("PkgEndDate") %>' />
                    <br />
                    PkgDesc:
                    <asp:Label ID="PkgDescLabel" runat="server" Text='<%# Eval("PkgDesc") %>' />
                    <br />
                    PkgBasePrice:
                    <asp:Label ID="PkgBasePriceLabel" runat="server" Text='<%# Eval("PkgBasePrice") %>' />
                    <br />
                    PkgAgencyCommission:
                    <asp:Label ID="PkgAgencyCommissionLabel" runat="server" Text='<%# Eval("PkgAgencyCommission") %>' />
                    <br />
                    <br /></span>
                </SelectedItemTemplate>

            </asp:ListView>
            <asp:ObjectDataSource ID="odsPackages" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetPackages" TypeName="TravelExpertsWebApp.App_Code.PackagesDB"></asp:ObjectDataSource>
        </div>
    </form>
</body>


</html>
