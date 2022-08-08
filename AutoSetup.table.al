table 50100 "Auto Setup"
{
    Caption = 'Contract Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }

        field(10; "Auto Nos"; Code[20])
        {
            Caption = 'Auto Nos';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(20; "Rent Card Nos"; Code[20])
        {
            Caption = 'Rent Card Nos';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(30; "Location Code."; Code[10])
        {
            Caption = 'Location Code.';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
    }

    keys
    {
        key(Key1; "Primary Key") { }
    }

    procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;

}