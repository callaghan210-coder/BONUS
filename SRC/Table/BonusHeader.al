table 60001 "MNB Bonus Header"
{
    Caption = 'Bonus';
    DataClassification = CustomerContent;
    DrillDownPageId = "MNB Bonus List";
    LookupPageId = "MNB Bonus List";
    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(3; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Date';
        }
        field(4; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending Date';
        }
        field(5; Status; Enum "MNB Bonus Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
        field(6; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        BonuseSetup: Record "MNB Bonus Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if Rec."No." = '' then begin
            BonuseSetup.Get();
            BonuseSetup.TestField("Bonus Nos.");
            NoseriesMgt.InitSeries(BonuseSetup."Bonus Nos.", XRec."No. Series", 0D, Rec."No.", Rec."No. Series");
        end;
    end;
}

