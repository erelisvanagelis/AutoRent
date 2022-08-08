table 50125 "Finished Auto Rent Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;
        }

        field(10; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            Editable = false;

            TableRelation = Customer;
        }

        field(20; "Driver Licence"; Media)
        {
            DataClassification = CustomerContent;
            Caption = 'Driver Licence';
            Editable = false;
        }

        field(30; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
            Editable = false;
        }

        field(40; "Auto No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';
            Editable = false;

            TableRelation = Auto;
        }

        field(50; "Reservation Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation Start Date';
            Editable = false;
        }

        field(60; "Reservation End Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation End Date';
            Editable = false;
        }

        field(70; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';
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
}