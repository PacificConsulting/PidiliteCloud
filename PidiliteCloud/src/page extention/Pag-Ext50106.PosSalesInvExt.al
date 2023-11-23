pageextension 50106 "Pos_Sales_Inv_Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Your Reference")
        {
            field(Retention; Rec.Retention)
            {
                ApplicationArea = All;
            }
            field("Mobilisation Advance"; Rec."Mobilisation Advance")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(Print)
        {
            action("Sales Invoice")
            {
                Caption = 'Tax Invoice-Goods';
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.SetRange("No.", Rec."No.");
                    if SalesInvHdr.FindFirst() then
                        Report.RunModal(50101, true, false, SalesInvHdr);
                end;
            }
            action("Sales Invoice New")
            {
                Caption = 'Tax Invoice-Service';
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.SetRange("No.", Rec."No.");
                    if SalesInvHdr.FindFirst() then
                        Report.RunModal(50103, true, false, SalesInvHdr);
                end;
            }
            action("Sales Invoice New GST_TCS_QR")
            {
                ApplicationArea = All;

                Image = Print;
                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.SetRange("No.", Rec."No.");
                    if SalesInvHdr.FindFirst() then
                        Report.RunModal(50241, true, false, SalesInvHdr);
                end;

            }
            action("Deemed Export Invoice")
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.SetRange("No.", Rec."No.");
                    if SalesInvHdr.FindFirst() then
                        Report.RunModal(50273, true, false, SalesInvHdr);
                end;

            }
            action("FA Sales Invoice ")
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.SetRange("No.", Rec."No.");
                    if SalesInvHdr.FindFirst() then
                        Report.RunModal(50280, true, false, SalesInvHdr);
                end;

            }
            action("Service Invoice Report")
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.SetRange("No.", Rec."No.");
                    if SalesInvHdr.FindFirst() then
                        Report.RunModal(50174, true, false, SalesInvHdr);
                end;

            }
            action("Sales Invoice New GST QR Code")
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    SalesInvHdr.SetRange("No.", Rec."No.");
                    if SalesInvHdr.FindFirst() then
                        Report.RunModal(50242, true, false, SalesInvHdr);
                end;

            }
        }


    }
}