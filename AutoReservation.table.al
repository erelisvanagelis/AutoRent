table 50114 "Auto Reservation"
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

        field(20; "Custormer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;
        }

        field(30; "Reservation Start DateTime"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation Start DateTime';

            trigger OnValidate();
            begin
                CheckDatesOrder();
                CheckIntervalOverlap()
            end;

        }

        field(40; "Reservation End DateTime"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation End DateTime';
            MinValue = Today;

            trigger OnValidate();
            begin
                CheckDatesOrder();
                CheckIntervalOverlap()
            end;
        }

    }

    keys
    {
        key(Key1; "Auto No.", "Line No.")
        {
            Clustered = true;
        }
    }

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

    local procedure CheckDatesOrder()
    var
        DateError: Label '%1 (%3) must be earlier than %2 (%4)';
    begin
        if ("Reservation Start DateTime" = CreateDateTime(0D, 0T)) or ("Reservation End DateTime" = CreateDateTime(0D, 0T)) then
            exit;

        if "Reservation Start DateTime" > "Reservation End DateTime" then
            Error(DateError,
                FieldCaption("Reservation Start DateTime"),
            FieldCaption("Reservation End DateTime"),
                "Reservation Start DateTime",
                "Reservation End DateTime");
    end;

    local procedure CheckIntervalOverlap()
    var
        DateError: Label 'Invalid reservation date - car is in use from %1 to %2';
        AutoReservation: Record "Auto Reservation";

    begin
        if (DT2Date("Reservation Start DateTime") = 0D) or (DT2Date("Reservation End DateTime") = 0D) then
            exit;

        AutoReservation.SetFilter("Auto No.", '=%1', "Auto No.");
        AutoReservation.SetFilter("Line No.", '<>%1', "Line No.");

        if AutoReservation.FindSet() then
            repeat
                if ("Reservation Start DateTime" < AutoReservation."Reservation Start DateTime") and
                 ("Reservation End DateTime" < AutoReservation."Reservation Start DateTime") then
                    exit;

                if ("Reservation Start DateTime" > AutoReservation."Reservation End DateTime") and
                    ("Reservation End DateTime" > AutoReservation."Reservation End DateTime") then
                    exit;

                Error(DateError,
                AutoReservation."Reservation Start DateTime",
                AutoReservation."Reservation End DateTime");
            until AutoReservation.Next() = 0;
    end;
}