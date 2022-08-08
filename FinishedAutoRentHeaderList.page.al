page 50127 "Finished Auto Rent Header List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Finished Auto Rent Header";
    CardPageId = "Finished Auto Rent Header Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Driver Liscence"; Rec."Driver Licence")
                {
                    ApplicationArea = All;
                }

                field("Data"; Rec.Date)
                {
                    ApplicationArea = All;
                }

                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                }

                field("Reserved Start Date"; Rec."Reservation Start Date")
                {
                    ApplicationArea = All;
                }

                field("Reserved End Date"; Rec."Reservation End Date")
                {
                    ApplicationArea = All;
                }

                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}