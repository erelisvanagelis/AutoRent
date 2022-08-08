page 50121 "Auto Rent Header Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Auto Rent Header";

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

                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            part(Lines; "Auto Rent Line List")
            {
                ApplicationArea = All;
                Caption = 'Driver Lisence';
                SubPageLink = "Document No." = FIELD("No.");
            }
        }

        area(factboxes)
        {
            part("Driver Lisence"; "Auto Rent Driver Picture")
            {
                ApplicationArea = All;
                Caption = 'Driver Lisence';
                SubPageLink = "No." = FIELD("No.");
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
                Caption = 'Release';

                trigger OnAction()
                var
                    HeaderRelease: Codeunit "Auto Rent Header Release";
                begin
                    HeaderRelease.Run(Rec);
                end;
            }
            action(Return)
            {
                ApplicationArea = All;
                Caption = 'Return Auto';

                trigger OnAction()
                var
                    AutoReturn: Codeunit "Auto Return CodeUnit";

                begin
                    AutoReturn.Run(Rec);
                end;
            }
        }
    }
}