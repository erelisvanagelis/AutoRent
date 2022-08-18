table 50112 "Auto Model"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Auto Mark Code."; Code[10])
        {
            Caption = 'Auto Mark Code.';
            DataClassification = CustomerContent;
            TableRelation = "Auto Mark";
        }

        field(10; "Code."; Code[10])
        {
            Caption = 'Code.';
            DataClassification = CustomerContent;
        }

        field(20; "Description"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1;"Auto Mark Code.", "Code.")
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