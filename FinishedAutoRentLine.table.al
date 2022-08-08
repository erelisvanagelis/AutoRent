table 50126 "Finished Auto Rent Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            Editable = false;

            TableRelation = "Auto Rent Header"."No.";
        }
        field(10; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
            Editable = false;
        }
        field(20; "Type"; Enum "Auto Rent Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
            Editable = false;
        }
        field(30; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;

            TableRelation =
                if ("Type" = const(Item)) Item
            else
            if ("Type" = const(Resource)) Resource;
        }
        field(40; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            Editable = false;
        }
        field(50; "Ammount"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Ammount';
            Editable = false;

        }
        field(60; "Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Price';
            Editable = false;
        }
        field(70; "Sum"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Sum';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}