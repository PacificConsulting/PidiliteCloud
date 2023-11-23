pageextension 50105 "Sales_Order_Ext" extends "Sales Order"
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
        addafter("LR/RR No.")
        {
            field("Shipping No. Series"; Rec."Shipping No. Series")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()
            begin
                Rec.TestField("Payment Terms Code");
                Rec.TestField("Shortcut Dimension 1 Code");
                Rec.TestField("Location Code");
            end;
        }
        modify(Reopen)
        {
            trigger OnBeforeAction()
            begin
                if UserSetup.get(UserId) then
                    if UserSetup."Sales User" = false then
                        Error('You do not have permission to reopen SO. Please contact System admin');
            end;
        }
        addafter("&Print")
        {
            action("Proforma Invoice")
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                var
                    SalesHdr: Record "Sales Header";
                begin
                    SalesHdr.SetRange("Document Type", Rec."Document Type");
                    SalesHdr.SetRange("No.", Rec."No.");
                    if SalesHdr.FindFirst() then
                        Report.RunModal(50102, true, false, SalesHdr);
                end;
            }
        }
    }
    var
        UserSetup: Record "User Setup";
}