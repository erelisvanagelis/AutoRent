codeunit 50120 "Auto Return CodeUnit"
{
    TableNo = "Auto Rent Header";
    trigger OnRun()
    begin
        ReturnAuto(Rec);
    end;

    procedure ReturnAuto(AutoRentHeader: Record "Auto Rent Header")
    begin

        TransferAutoRentDamage(AutoRentHeader);
        DeleteAutoRentDamage(AutoRentHeader."No.");

        TransferAutoRentLines(AutoRentHeader."No.");
        DeleteAutoRentLines(AutoRentHeader."No.");

        TransferAutoRentHeader(AutoRentHeader);
        AutoRentHeader.Delete(true);

    end;

    procedure TransferAutoRentHeader(AutoRentHeader: Record "Auto Rent Header")
    var
        FinishedRentHeader: Record "Finished Auto Rent Header";
    begin
        FinishedRentHeader.Init();
        FinishedRentHeader."No." := AutoRentHeader."No.";
        FinishedRentHeader."Customer No." := AutoRentHeader."Customer No.";
        FinishedRentHeader."Driver Licence" := AutoRentHeader."Driver Licence";
        FinishedRentHeader.Date := AutoRentHeader.Date;
        FinishedRentHeader."Auto No." := AutoRentHeader."Auto No.";
        FinishedRentHeader."Reservation Start Date" := AutoRentHeader."Reservation Start Date";
        FinishedRentHeader."Reservation End Date" := AutoRentHeader."Reservation End Date";
        FinishedRentHeader."Total Cost" := AutoRentHeader."Total Cost";
        FinishedRentHeader.Insert(true);
    end;

    procedure TransferAutoRentDamage(AutoRentHeader: Record "Auto Rent Header")
    var
        AutoDamage: Record "Auto Damage";
        AutoRentDamage: Record "Auto Rent Damage";
        AutoDamageEnum: Enum "Auto Damage Type";
        LineNo: Integer;
    begin
        AutoRentDamage.SetFilter("Document No.", '=%1', AutoRentHeader."No.");
        AutoDamage."Auto No." := AutoRentHeader."Auto No.";
        if AutoDamage.FindLast() then
            LineNo := AutoDamage."Line No.";
        if AutoRentDamage.FindSet() then
            repeat
                LineNo += 10000;

                AutoDamage.Init();
                AutoDamage."Auto No." := AutoRentHeader."Auto No.";
                AutoDamage."Line No." := LineNo;
                AutoDamage.Date := AutoRentDamage.Date;
                AutoDamage.Description := AutoRentDamage.Description;
                AutoDamage.Status := AutoDamageEnum::Revelant;
                AutoDamage.Insert(true);

            until AutoRentDamage.Next() = 0;
    end;

    procedure DeleteAutoRentDamage(DocumentNo: Code[20])
    var
        AutoRentDamage: Record "Auto Rent Damage";
    begin
        AutoRentDamage.SetRange("Document No.", DocumentNo);
        AutoRentDamage.DeleteAll(true);
    end;

    procedure TransferAutoRentLines(DocumentNo: Code[20])
    var
        AutoRentLine: Record "Auto Rent Line";
        FinishedRentLine: Record "Finished Auto Rent Line";
    begin
        AutoRentLine.SetRange("Document No.", DocumentNo);
        if AutoRentLine.FindSet() then
            repeat
                FinishedRentLine.Init();
                FinishedRentLine."Document No." := AutoRentLine."Document No.";
                FinishedRentLine."Line No." := AutoRentLine."Line No.";
                FinishedRentLine.Type := AutoRentLine.Type;
                FinishedRentLine."No." := AutoRentLine."No.";
                FinishedRentLine.Description := AutoRentLine.Description;
                FinishedRentLine.Ammount := AutoRentLine.Ammount;
                FinishedRentLine.Price := AutoRentLine.Price;
                FinishedRentLine.Sum := AutoRentLine.Sum;
                FinishedRentLine.Insert(true);
            until AutoRentLine.Next() = 0;
    end;

    procedure DeleteAutoRentLines(DocumentNo: Code[20])
    var
        AutoRentLine: Record "Auto Rent Line";
    begin
        AutoRentLine.SetRange("Document No.", DocumentNo);
        AutoRentLine.DeleteAll();
    end;

}