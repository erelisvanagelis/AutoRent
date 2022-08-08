table 50121 "Auto Rent Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';

            TableRelation = "Auto Rent Header"."No.";
        }
        field(10; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }
        field(20; "Type"; Enum "Auto Rent Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
        }
        field(30; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';

            TableRelation =
                if ("Type" = const(Item)) Item
            else
            if ("Type" = const(Resource)) Resource;

            trigger OnValidate();
            var
                ItemRec: Record Item;
                ResourceRec: Record Resource;
                TypeEnum: Enum "Auto Rent Line Type";
            begin
                if "Type" = TypeEnum::Item then begin
                    ItemRec."No." := "No.";
                    ItemRec.Find();
                    Description := ItemRec.Description;
                    Price := ItemRec."Unit Price";
                end
                else
                    if "Type" = TypeEnum::Resource then begin
                        ResourceRec."No." := "No.";
                        ResourceRec.Find();
                        Description := ResourceRec."Name";
                        Price := ResourceRec."Unit Price";
                    end;

                CalculateSum();
            end;
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

            trigger OnValidate();
            begin
                CalculateSum();
            end;
        }
        field(60; "Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Price';
            Editable = false;

            trigger OnValidate();
            begin
                CalculateSum();
            end;
        }
        field(70; "Sum"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Sum';
            Editable = false;
        }

        field(80; "Status"; Enum "Auto Rent Status Type")
        {
            Caption = 'Status';
            Editable = false;

            FieldClass = FlowField;
            CalcFormula = lookup("Auto Rent Header"."Status" where("No." = field("Document No.")));
        }

        field(90; "Initial Line"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Initial Line"';
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

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin
        TestField(Status, Status::Open);
    end;

    trigger OnDelete()
    var
        AutoRentLineRec: Record "Auto Rent Line";
    begin
        TestField("Initial Line", False);
    end;

    trigger OnRename()
    begin

    end;

    local procedure CalculateSum()
    begin
        Rec.Sum := Rec.Ammount * Rec.Price;
    end;

}