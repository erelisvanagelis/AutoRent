page 50114 "Auto Reservation List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Reservation";
    AutoSplitKey = true;

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

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                ApplicationArea = All;
                Caption = 'Go To Valid Reservations';

                RunObject = page "Auto Reservation Valid List";
            }
        }
    }
}