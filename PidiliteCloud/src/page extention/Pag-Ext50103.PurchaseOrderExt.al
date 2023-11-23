pageextension 50103 "PurchaseOrder_Ext" extends "Purchase Order"
{
    layout
    {
        addafter("Assigned User ID")
        {
            field("Kind Attention"; Rec."Kind Attention")
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
                    if UserSetup."Purchase User" = false then
                        Error('You do not have permission to reopen PO. Please contact System admin.');
            end;
        }
        addafter("P&osting")
        {
            action("Purchase Order")
            {
                ApplicationArea = All;
                Image = Print;
                //Promoted = true;
                //PromotedCategory = Process;
                trigger OnAction()
                var
                    PH: Record "Purchase Header";
                begin
                    PH.SetRange("No.", Rec."No.");
                    PH.SetRange("Document Type", Rec."Document Type");
                    if PH.FindFirst() then
                        Report.RunModal(50100, true, false, PH);
                end;
            }
        }
    }
    var
        UserSetup: Record "User Setup";
}