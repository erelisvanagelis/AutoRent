page 50128 "Finished Auto Rent Header Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Finished Auto Rent Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
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
            part(Lines; "Finished Auto Rent Line List")
            {
                ApplicationArea = All;
                Caption = 'Driver Lisence';
                SubPageLink = "Document No." = FIELD("No.");
            }
        }
    }
}