page 50123 "Auto Rent Line List"
{
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "Auto Rent Line";
    Caption = 'Lines';
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Ammount; Rec.Ammount)
                {
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field(Sum; Rec.Sum)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}