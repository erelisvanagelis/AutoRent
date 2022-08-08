page 50112 "Auto Model List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Model";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {


                Caption = 'General';

                field("Auto Mark Code."; Rec."Auto Mark Code.")
                {
                    ApplicationArea = All;
                }
                field("Code."; Rec."Code.")
                {
                    ApplicationArea = All;
                }



                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}