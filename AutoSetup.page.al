page 50100 "Auto Setup"
{
    Caption = 'Auto Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Auto Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field("Auto Nos"; Rec."Auto Nos")
                {
                    ApplicationArea = All;
                }

                field("Rent Card Nos"; Rec."Rent Card Nos")
                {
                    ApplicationArea = All;
                }

                field("Location"; Rec."Location Code.")
                {
                    ApplicationArea = All;
                }


            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;
}