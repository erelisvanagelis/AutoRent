codeunit 50100 "Auto Rent Header Release"
{
    TableNo = "Auto Rent Header";

    trigger OnRun()
    begin
        Release(Rec);
    end;

    procedure Release(var AutoRentHeader: Record "Auto Rent Header")
    begin
        AutoRentHeader.Status := "Auto Rent Status Type"::Released;
        AutoRentHeader.Modify();
    end;

    procedure Open(var AutoRentHeader: Record "Auto Rent Header")
    begin
        AutoRentHeader."Status" := "Auto Rent Status Type"::Open;
        AutoRentHeader.Modify();
    end;
}