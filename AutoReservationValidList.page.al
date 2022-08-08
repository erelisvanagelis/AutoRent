page 50115 "Auto Reservation Valid List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Reservation";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                }

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }

                field("Customer No."; Rec."Custormer No.")
                {
                    ApplicationArea = All;
                }

                field("Reservation Start Date"; Rec."Reservation Start DateTime")
                {
                    ApplicationArea = All;
                }

                field("Reservation End Date"; Rec."Reservation End DateTime")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Reservation End DateTime", '>%1', CreateDateTime(Today(), 0T));
    end;
}