table 50110 "Auto"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(10; "Title"; Text[50])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
        }

        field(20; "Auto Mark Code."; Code[10])
        {
            Caption = 'Auto Mark Code.';
            DataClassification = CustomerContent;
            TableRelation = "Auto Mark"."Code.";
        }

        field(30; "Auto Model Code."; Code[10])
        {
            Caption = 'Auto Model Code.';
            DataClassification = CustomerContent;
            TableRelation = "Auto Model"."Code." where("Auto Mark Code." = field("Auto Mark Code."));
        }

        field(40; "Manufacture Date"; Date)
        {
            Caption = 'Manufacture Date';
            DataClassification = CustomerContent;
        }

        field(50; "Insurance End Date"; Date)
        {
            Caption = 'Insurance Valid Until';
            DataClassification = CustomerContent;
        }

        field(60; "TE End Date"; Date)
        {
            Caption = 'Technical Examination Valid Until';
            DataClassification = CustomerContent;
        }

        field(70; "Location Code."; Code[10])
        {
            Caption = 'Location Code.';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }

        field(80; "Rent Service Code."; Code[10])
        {
            Caption = 'Rent Service Code.';
            DataClassification = CustomerContent;
            TableRelation = Resource;
        }

        field(90; "Rent Price"; Decimal)
        {
            Caption = 'Rent Price';
            Editable = false;

            FieldClass = FlowField;
            CalcFormula = lookup(Resource."Unit Price" where("No." = field("Rent Service Code.")));
        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        AutoSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            AutoSetup.Get();
            AutoSetup.TestField("Auto Nos");
            "No." := NoSeriesManagement.GetNextNo(AutoSetup."Auto Nos", WorkDate(), true);
        end;
    end;

    trigger OnModify()
    begin
        // Title := "Auto Mark Code."+ ' ' + "Auto Model Code.";
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}