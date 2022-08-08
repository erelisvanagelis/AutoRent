report 50101 "Auto Rent History Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './AutoRentHistoryReport.rdl';

    dataset
    {
        dataitem(Auto; Auto)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            // MaxIteration = 1;

            column(No_; "No.") { }
            column(Auto_Mark_Code_; "Auto Mark Code.") { }
            column(Auto_Model_Code_; "Auto Model Code.") { }
            column(TotalRentSum; TotalRentSum) { }

            dataitem("Finished Auto Rent Header"; "Finished Auto Rent Header")
            {
                DataItemLink = "Auto No." = field("No.");
                DataItemTableView = sorting("No.");

                column(Reservation_Start_Date; "Reservation Start Date") { }
                column(Reservation_End_Date; "Reservation End Date") { }
                dataitem(Customer; Customer)
                {
                    DataItemLink = "No." = field("Customer No.");
                    column(Name; Name) { }
                }

                column(Total_Cost; "Total Cost") { }


                trigger OnAfterGetRecord()
                var
                    FinAutoRentHeader: Record "Finished Auto Rent Header";
                begin
                    FinAutoRentHeader.SetRange("Auto No.", "No.");
                    if FinAutoRentHeader.FindSet() then
                        repeat
                            TotalRentSum += FinAutoRentHeader."Total Cost";
                        until "Finished Auto Rent Header".Next() = 0;
                end;
            }



        }
    }

    var
        TotalRentSum: Decimal;
}