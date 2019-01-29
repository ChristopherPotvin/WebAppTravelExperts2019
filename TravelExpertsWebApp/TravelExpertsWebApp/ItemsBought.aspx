<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemsBought.aspx.cs" Inherits="TravelExpertsWebApp.ItemsBought" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="odsItemsBought">
                <AlternatingItemTemplate>
                    <span style="">Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    TravelerCount:
                    <asp:Label ID="TravelerCountLabel" runat="server" Text='<%# Eval("TravelerCount") %>' />
<br />Destination:
                    <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:Label ID="TripStartLabel" runat="server" Text='<%# Eval("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:Label ID="TripEndLabel" runat="server" Text='<%# Eval("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="">Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    TravelerCount:
                    <asp:TextBox ID="TravelerCountTextBox" runat="server" Text='<%# Bind("TravelerCount") %>' />
                    <br />
                    Destination:
                    <asp:TextBox ID="DestinationTextBox" runat="server" Text='<%# Bind("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:TextBox ID="TripStartTextBox" runat="server" Text='<%# Bind("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:TextBox ID="TripEndTextBox" runat="server" Text='<%# Bind("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /><br /></span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />TravelerCount:
                    <asp:TextBox ID="TravelerCountTextBox" runat="server" Text='<%# Bind("TravelerCount") %>' />
                    <br />
                    Destination:
                    <asp:TextBox ID="DestinationTextBox" runat="server" Text='<%# Bind("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:TextBox ID="TripStartTextBox" runat="server" Text='<%# Bind("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:TextBox ID="TripEndTextBox" runat="server" Text='<%# Bind("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /><br /></span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="">Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    TravelerCount:
                    <asp:Label ID="TravelerCountLabel" runat="server" Text='<%# Eval("TravelerCount") %>' />
<br />Destination:
                    <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:Label ID="TripStartLabel" runat="server" Text='<%# Eval("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:Label ID="TripEndLabel" runat="server" Text='<%# Eval("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="">Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    TravelerCount:
                    <asp:Label ID="TravelerCountLabel" runat="server" Text='<%# Eval("TravelerCount") %>' />
<br />Destination:
                    <asp:Label ID="DestinationLabel" runat="server" Text='<%# Eval("Destination") %>' />
                    <br />
                    TripStart:
                    <asp:Label ID="TripStartLabel" runat="server" Text='<%# Eval("TripStart") %>' />
                    <br />
                    TripEnd:
                    <asp:Label ID="TripEndLabel" runat="server" Text='<%# Eval("TripEnd") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsItemsBought" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetItemsBought" TypeName="TravelExpertsWebApp.App_Code.ItemsBoughtDB"></asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
