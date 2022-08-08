page 50113 "Auto Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Auto;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Title"; Rec."Title")
                {
                    ApplicationArea = All;
                }

                field("Auto Mark Code."; Rec."Auto Mark Code.")
                {
                    ApplicationArea = All;
                }

                field("Auto Model Code."; Rec."Auto Model Code.")
                {
                    ApplicationArea = All;
                }

                field("Manufacture Date"; Rec."Manufacture Date")
                {
                    ApplicationArea = All;
                }

                field("Insurance End Date"; Rec."Insurance End Date")
                {
                    ApplicationArea = All;
                }

                field("TE End Date"; Rec."TE End Date")
                {
                    ApplicationArea = All;
                }

                field("Location Code."; Rec."Location Code.")
                {
                    ApplicationArea = All;
                }

                field("Rent Service Code."; Rec."Rent Service Code.")
                {
                    ApplicationArea = All;
                }

                field("Rent Fee"; Rec."Rent Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                Caption = 'Open Reservations List';
                ApplicationArea = All;
                RunObject = page "Auto Reservation List";
                RunPageLink = "Auto No." = field("No.");
            }
        }
    }
}