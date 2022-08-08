table 50120 "Auto Rent Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }

        field(10; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';

            TableRelation = Customer;

            trigger OnValidate()
            var
                CustomerError: Label '%1 (%2) is invalid customer due to: %3';
                Customer: Record Customer;
                CustomerLedger: Record "Detailed Cust. Ledg. Entry";
                Sum: Decimal;
            begin
                Sum := 0;
                Customer.get("Customer No.");
                if Customer.IsBlocked() then
                    Error(CustomerError,
                    FieldCaption("Customer No."),
                    "Customer No.",
                    'being banned');

                CustomerLedger.SetFilter("Customer No.", '=%1', "Customer No.");
                if CustomerLedger.FindSet() then begin
                    repeat
                        Sum += CustomerLedger."Amount (LCY)";
                    until CustomerLedger.Next() = 0;
                end;

                if Sum > 0 then
                    Error(CustomerError,
                    FieldCaption("Customer No."),
                    "Customer No.",
                    'debt');
            end;

        }

        field(20; "Driver Licence"; Media)
        {
            DataClassification = CustomerContent;
            Caption = 'Driver Licence';
        }

        field(30; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
        }

        field(40; "Auto No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';

            TableRelation = Auto;

            trigger OnValidate();
            begin
                CreateInintialLine()
            end;
        }

        field(50; "Reservation Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation Start Date';

            trigger OnValidate()
            var
                DateError: Label '%1 (%2) is invalid, date is not reserved';
                AutoReservation: Record "Auto Reservation";

            begin
                AutoReservation.SetFilter("Auto No.", '=%1', "Auto No.");
                AutoReservation.SetFilter("Reservation Start DateTime", '>%1', CreateDateTime("Reservation Start Date", 0T));
                AutoReservation.SetFilter("Reservation Start DateTime", '<%1', CreateDateTime("Reservation Start Date", 235959T));

                if AutoReservation.FindSet() = false then
                    Error(DateError,
                    FieldCaption("Reservation Start Date"),
                    "Reservation Start Date");
            end;
        }

        field(60; "Reservation End Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation End Date';

            trigger OnValidate()
            var
                DateError: Label '%1 (%2) is invalid, date is not reserved';
                AutoReservation: Record "Auto Reservation";

            begin
                AutoReservation.SetFilter("Auto No.", '=%1', "Auto No.");
                AutoReservation.SetFilter("Reservation End DateTime", '>%1', CreateDateTime("Reservation End Date", 0T));
                AutoReservation.SetFilter("Reservation End DateTime", '<%1', CreateDateTime("Reservation End Date", 235959T));

                if AutoReservation.FindSet() = false then
                    Error(DateError,
                    FieldCaption("Reservation End Date"),
                    "Reservation End Date");
            end;
        }

        field(70; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Auto Rent Line".Sum where("Document No." = field("No.")));
        }

        field(80; "Status"; Enum "Auto Rent Status Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            Editable = false;
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
        AutoRentStatusType: Enum "Auto Rent Status Type";
    begin
        if "No." = '' then begin
            AutoSetup.Get();
            AutoSetup.TestField("Rent Card Nos");
            "No." := NoSeriesManagement.GetNextNo(AutoSetup."Rent Card Nos", WorkDate(), true);

            Status := AutoRentStatusType::Open;
        end;
    end;

    trigger OnModify()
    begin
        TestField("Status", "Status"::Open);
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    local procedure CreateInintialLine()
    var
        AutoRentLine: Record "Auto Rent Line";
        AutoRentLineType: Enum "Auto Rent Line Type";
        AutoRec: Record Auto;
        ResourceRec: Record Resource;
    begin
        AutoRentLine.SetRange("Document No.", "No.");
        if AutoRentLine.Find() then exit;
        // AutoRentLine.

        AutoRec.SetRange("No.", "Auto No.");
        AutoRec.FindFirst();

        ResourceRec.SetRange("No.", AutoRec."Rent Service Code.");
        ResourceRec.FindFirst();

        AutoRentLine.Init();
        AutoRentLine."Document No." := "No.";
        AutoRentLine.Type := AutoRentLineType::Resource;
        AutoRentLine."No." := AutoRec."Rent Service Code.";
        AutoRentLine."Line No." := 10000;
        AutoRentLine.Description := ResourceRec.Name;
        AutoRentLine.Price := ResourceRec."Unit Price";
        AutoRentLine."Initial Line" := true;
        AutoRentLine.Insert(true);
    end;

}