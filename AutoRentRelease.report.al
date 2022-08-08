report 50100 "Auto Rent Release Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './AutoRentReleaseReport.rdl';

    dataset
    {
        dataitem("Auto Rent Header"; "Auto Rent Header")
        {
            RequestFilterFields = "No.";

            dataitem(Auto; Auto)
            {
                DataItemLink = "No." = field("Auto No.");

                column(No_; "No.") { }
                column(Auto_Mark_Code_; "Auto Mark Code.") { }
                column(Auto_Model_Code_; "Auto Model Code.") { }
            }

            dataitem(solo; "Auto Rent Header")
            {
                column(Reservation_Start_Date; "Reservation Start Date") { }

                column(Reservation_End_Date; "Reservation End Date") { }

                column(RentCost; RentCost) { }
                column(ServiceCost; ServiceCost) { }
                column(TotalCost; TotalCost) { }
            }



            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = field("Customer No.");
                column(Name; Name) { }
            }

            dataitem("Auto Rent Line"; "Auto Rent Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(Description; Description) { }
                column(Ammount; Ammount) { }
                column(Price; Price) { }
                column(Sum; Sum) { }
            }

            trigger OnAfterGetRecord()
            var
                AutoRentLine: Record "Auto Rent Line";
            begin
                AutoRentLine.SetRange("Document No.", "No.");

                if AutoRentLine.FindSet() then begin
                    RentCost := AutoRentLine.Sum;
                    AutoRentLine.Next();
                    repeat
                        ServiceCost += AutoRentLine.Sum;
                    until AutoRentLine.Next() = 0;
                    TotalCost := RentCost + ServiceCost;
                end;

            end;
        }
    }

    var
        RentCost: Decimal;
        ServiceCost: Decimal;
        TotalCost: Decimal;
}