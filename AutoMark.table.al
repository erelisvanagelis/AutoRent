table 50111 "Auto Mark"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code."; Code[10])
        {
            Caption = 'Code.';
            DataClassification = CustomerContent;
        }
        field(10; "Description"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Code.")
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