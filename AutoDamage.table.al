table 50116 "Auto Damage"
{
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Auto No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';
            TableRelation = Auto;
        }

        field(10; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }

        field(20; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
        }

        field(30; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }

        field(40; "Status"; Enum "Auto Damage Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Auto No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}