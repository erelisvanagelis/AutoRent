page 50122 "Auto Released List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Rent Header";
    CardPageId = "Auto Rent Header Card";

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

                field("Status"; Rec.Status)
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
                ApplicationArea = All;
                Caption = 'Release';

                trigger OnAction()
                var
                    HeaderRelease: Codeunit "Auto Rent Header Release";
                begin
                    HeaderRelease.Run(Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        RentStatusType: Enum "Auto Rent Status Type";
    begin
        Rec.SetFilter("Status", '=%1', RentStatusType::Released);
    end;
}