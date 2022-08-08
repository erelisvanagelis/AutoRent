page 50111 "Auto Mark List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Mark";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
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