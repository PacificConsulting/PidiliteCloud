report 50100 "Purchase Order New"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/Purchase Order.rdl';
    Caption = 'Order';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = sorting("Document Type", "No.")
                                where("Document Type" = const(Order));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Purchase Order';

            column(DocType_PurchaseHeader; "Document Type")
            {
            }

            column(No_PurchaseHeader; "No.")
            {
            }
            column(TotGSTAmount; TotalGSTAmount)
            {

            }
            column(TotalAmount; TotalAmount)
            {

            }
            column(TotalGSTPercent; TotalGSTPercent)
            {
            }
            column(SGSTAmt; SGSTAmt)
            { }
            column(CGSTAmt; CGSTAmt)
            { }
            column(IGSSTAmt; IGSSTAmt)
            { }
            column(SGSTPercent; SGSTPercent)
            { }
            column(IGSTPercent; IGSTPercent)
            { }
            column(CGSTPercent; CGSTPercent)
            { }
            column(PaymentRemarks; PaymentRemarks)
            { }
            column(FrieghtRemarks; FrieghtRemarks)
            { }
            column(DeliveryRemarks; DeliveryRemarks)
            { }
            column(ValidityRemarks; ValidityRemarks)
            { }
            column(PaymentRemarks2; PaymentRemarks2)
            { }
            column(ApprovalText; ApprovalText)
            { }
            column(AmtInWords; RsLbl + NoText[1] + ' ' + NoText[2])
            {
            }
            column(VendorGST; VendorGST)
            { }
            column(AmtCaption; AmtCaptionLbl)
            {
            }
            column(PaymentTermsDesc; PaymentTerms.Description)
            {
            }
            column(ShipmentMethodDesc; ShipmentMethod.Description)
            {
            }
            column(PrepmtPaymentTermsDesc; PrepmtPaymentTerms.Description)
            {
            }
            column(InvDiscAmtCaption; InvDiscAmtCaptionLbl)
            {
            }
            column(VATPercentCaption; VATPercentCaptionLbl)
            {
            }
            column(VATBaseCaption; VATBaseCaptionLbl)
            {
            }
            column(VATAmtCaption; VATAmtCaptionLbl)
            {
            }
            column(VATIdentCaption; VATIdentCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(PmtTermsDescCaption; PmtTermsDescCaptionLbl)
            {
            }
            column(ShpMethodDescCaption; ShpMethodDescCaptionLbl)
            {
            }
            column(PrepmtTermsDescCaption; PrepmtTermsDescCaptionLbl)
            {
            }
            column(DocDateCaption; DocDateCaptionLbl)
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            column(EmailCaption; EmailCaptionLbl)
            {
            }
            column(ShipToAddr1; ShipToAddr[1])
            {
            }
            column(ShipToAddr2; ShipToAddr[2])
            {
            }
            column(ShipToAddr3; ShipToAddr[3])
            {
            }
            column(ShipToAddr4; ShipToAddr[4])
            {
            }
            column(ShipToAddr5; ShipToAddr[5])
            {
            }
            column(ShipToAddr6; ShipToAddr[6])
            {
            }
            column(ShipToAddr7; ShipToAddr[7])
            {
            }
            column(ShipToAddr8; ShipToAddr[8])
            {
            }
            column(BillingAddr1; BillingAddr[1])
            { }
            column(BillingAddr2; BillingAddr[2])
            { }
            column(BillingAddr3; BillingAddr[3])
            { }
            column(BillingAddr4; BillingAddr[4])
            { }
            column(BillingAddr5; BillingAddr[5])
            { }
            column(BillingAddr6; BillingAddr[6])
            { }
            column(ShiptoContact; LocationRec.Contact)
            { }
            column(ShiptoAddrCaption; ShiptoAddrCaptionLbl)
            {
            }
            column(VendorPhone; Vendor."Mobile Phone No.")
            { }
            column(VendorEmail; Vendor."E-Mail")
            { }
            column(Kind_Attention; "Kind Attention")
            {

            }
            column(Statedescription; Statedescription)
            {

            }
            column(ClientGSTIN; ClientGSTIN)
            {

            }

            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number);

                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = sorting(Number)
                                        where(Number = const(1));

                    column(OrderCopyText; StrSubstNo(OrderLbl, CopyText))
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CompanyAddr4; Staterec.Description + ',' + CompanyInfo."Post Code")
                    {
                    }
                    column(CompanyInfo; CompanyInfo.Picture)
                    { }
                    column(StateName; Statedescription)
                    {
                    }
                    column(CompanyRegistrationLbl; CompanyRegistrationLbl)
                    {
                    }
                    column(CompanyInfo_GST_RegistrationNo; CompanyInfo."GST Registration No.")
                    {
                    }
                    column(VendorRegistrationLbl; VendorRegistrationLbl)
                    {
                    }
                    column(Vendor_GST_RegistrationNo; Vendor."GST Registration No.")
                    {
                    }
                    column(GSTCompAmount4; Abs(0.00))
                    {
                    }
                    column(TDSAmt; TDSAmt)
                    {
                    }
                    column(CessAmount; CessAmount)
                    {
                    }
                    column(GLAccountNo; GLAccountNo)
                    {
                    }
                    column(IsGSTApplicable; IsGSTApplicable)
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(DocDate_PurchaseHeader; Format("Purchase Header"."Document Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_PurchaseHeader; "Purchase Header"."VAT Registration No.")
                    {
                    }
                    column(PurchaserText; PurchaserText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_PurchaseHeader; "Purchase Header"."Your Reference")
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(BuyfromVendNo_PurchaseHdr; "Purchase Header"."Buy-from Vendor No.")
                    {
                    }
                    column(BuyFromAddr1; BuyFromAddr[1])
                    {
                    }
                    column(BuyFromAddr2; BuyFromAddr[2])
                    {
                    }
                    column(BuyFromAddr3; BuyFromAddr[3])
                    {
                    }
                    column(BuyFromAddr4; BuyFromAddr[4])
                    {
                    }
                    column(BuyFromAddr5; BuyFromAddr[5])
                    {
                    }
                    column(BuyFromAddr6; BuyFromAddr[6])
                    {
                    }
                    column(BuyFromAddr7; BuyFromAddr[7])
                    {
                    }
                    column(BuyFromAddr8; BuyFromAddr[8])
                    {
                    }
                    column(PricesIncluVAT_PurchaseHdr; "Purchase Header"."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(VATBaseDis_PurchaseHdr; "Purchase Header"."VAT Base Discount %")
                    {
                    }
                    column(PricesInclVATtxt; PricesInclVATtxt)
                    {
                    }
                    column(ShowInternalInfo; ShowInternalInfo)
                    {
                    }
                    column(DimText; DimText)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccNoCaption; BankAccNoCaptionLbl)
                    {
                    }
                    column(OrderNoCaption; OrderNoCaptionLbl)
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    column(BuyfromVendNo_PurchaseHdrCaption; "Purchase Header".FieldCaption("Buy-from Vendor No."))
                    {
                    }
                    column(PricesIncluVAT_PurchaseHdrCaption; "Purchase Header".FieldCaption("Prices Including VAT"))
                    {
                    }
                    dataitem("Purchase Line"; "Purchase Line")
                    {
                        DataItemLink = "Document Type" = field("Document Type"),
                                       "Document No." = field("No.");
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                        column(No_PurchaseLine; "Purchase Line"."No.")
                        {
                        }
                        column(Inv__Discount_Amount; "Inv. Discount Amount")
                        {

                        }
                        column(LineNo_PurchaseLine; "Purchase Line"."Line No.")
                        {
                        }
                        column(PurchaseLineDescription; "Purchase Line".Description)
                        {
                        }
                        column(Quantity_PurchaseLine; "Purchase Line".Quantity)
                        {
                        }
                        column(LineDiscAmt_PurchaseLine; "Purchase Line"."Line Discount Amount")
                        {
                        }
                        column(Unit_of_Measure_Code; "Unit of Measure Code")
                        {
                        }
                        column(HSN_SAC_Code; "HSN/SAC Code")
                        {

                        }
                        column(DirectUnitCost_PurchaseLine; "Purchase Line"."Direct Unit Cost")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(LineAmount_PurchaseLine; "Purchase Line"."Line Amount")
                        {
                            AutoFormatExpression = "Purchase Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Line_Discount_Amount; "Line Discount Amount")
                        {

                        }
                        Column(TaxableAmount; "Line Amount" - "Line Discount Amount")
                        {

                        }
                        trigger OnPreDataItem()
                        begin
                            // CurrReport.Break();
                        end;
                    }

                }

                trigger OnAfterGetRecord()
                var
                    TempPrepmtPurchLine: Record "Purchase Line" temporary;
                begin

                    if Number > 1 then
                        CopyText := CopyLbl;
                    OutputNo := OutputNo + 1;


                end;

                trigger OnPostDataItem()
                begin
                    if not CurrReport.Preview then
                        PurchCountPrinted.Run("Purchase Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopy) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 0;
                end;
            }
            trigger OnAfterGetRecord()

            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
                StateRec.Get(CompanyInfo."State Code");

                LocationRec.Get("Location Code");
                IsGSTApplicable := CheckGSTDoc("Purchase Line");
                Clear(PaymentRemarks);
                Clear(ValidityRemarks);
                Clear(FrieghtRemarks);
                Clear(DeliveryRemarks);
                Clear(ApprovalText);
                Clear(VendorGST);
                Clear(ShipToAddr);
                Clear(BillingAddr);

                //<<PCPL-NSW-13Jan2022
                Clear(Statedescription);
                Clear(ClientGSTIN);
                //ClientGSTIN := LocationRec."Client GSTIN";
                StateRec2.Get("Location State Code");
                IF LocationRec.Get("Purchase Header"."Location Code") then begin
                    IF LocationRec."Client State" = '' then begin
                        IF StateRec2.Get("Location State Code") then
                            Statedescription := StateRec2.Description
                    end else
                        IF StateRec.Get(LocationRec."Client State") then
                            Statedescription := StateRec.Description;
                end;
                //>>PCPL-NSW-13Jan2022

                Vendor.Get("Buy-from Vendor No.");
                VendorGST := Vendor."GST Registration No.";
                if RespCenter.Get("Responsibility Center") then begin
                    FormatAdd.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                end else
                    FormatAdd.Company(CompanyAddr, CompanyInfo);

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                if "Purchaser Code" = '' then begin
                    SalesPurchPerson.Init();
                    PurchaserText := '';
                end else begin
                    SalesPurchPerson.Get("Purchaser Code");
                    PurchaserText := PurchLbl
                end;
                if "Your Reference" = '' then
                    ReferenceText := ''
                else
                    ReferenceText := CopyStr(FieldCaption("Your Reference"), 1, 80);
                if "VAT Registration No." = '' then
                    VATNoText := ''
                else
                    VATNoText := CopyStr(FieldCaption("VAT Registration No."), 1, 80);
                if "Currency Code" = '' then begin
                    GLSetup.TestField("LCY Code");
                    TotalText := StrSubstNo(TotalLbl, GLSetup."LCY Code");
                    TotalInclVATText := StrSubstNo(TotalIncTaxLbl, GLSetup."LCY Code");
                    TotalExclVATText := StrSubstNo(TotalExclTaxLbl, GLSetup."LCY Code");
                end else begin
                    TotalText := StrSubstNo(TotalLbl, "Currency Code");
                    TotalInclVATText := StrSubstNo(TotalIncTaxLbl, "Currency Code");
                    TotalExclVATText := StrSubstNo(TotalExclTaxLbl, "Currency Code");
                end;

                FormatAdd.PurchHeaderBuyFrom(BuyFromAddr, "Purchase Header");
                if "Buy-from Vendor No." <> "Pay-to Vendor No." then
                    FormatAdd.PurchHeaderPayTo(VendAddr, "Purchase Header");
                if "Payment Terms Code" = '' then
                    PaymentTerms.Init()
                else begin
                    PaymentTerms.Get("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                end;
                if "Prepmt. Payment Terms Code" = '' then
                    PrepmtPaymentTerms.Init()
                else begin
                    PrepmtPaymentTerms.Get("Prepmt. Payment Terms Code");
                    PrepmtPaymentTerms.TranslateDescription(PrepmtPaymentTerms, "Language Code");
                end;
                if "Shipment Method Code" = '' then
                    PrepmtPaymentTerms.Init()
                else begin
                    ShipmentMethod.Get("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                end;
                /* if "Ship-to Name" = '' then
                    FormatAdd.Company(ShipToAddr, CompanyInfo)
                else
                    FormatAdd.PurchHeaderShipTo(ShipToAddr, "Purchase Header"); */

                if "Ship-to Name" = '' then begin
                    ShipToAddr[1] := CompanyInfo.Name;
                    ShipToAddr[2] := CompanyInfo.Address;
                    ShipToAddr[3] := CompanyInfo."Address 2";
                    ShipToAddr[4] := CompanyInfo.City + ',' + CompanyInfo."Post Code";
                    ShipToAddr[5] := StateRec.Description
                end else begin
                    ShipToAddr[1] := LocationRec.Name + ',';
                    ShipToAddr[2] := LocationRec.Address + ',';
                    ShipToAddr[3] := LocationRec."Address 2" + ',';
                    ShipToAddr[4] := LocationRec.City + ',' + LocationRec."Post Code" + ',';
                    ShipToAddr[5] := StateRec2.Description + '.';
                end;
                if "Bill to-Location(POS)" = '' then begin
                    BillingAddr[1] := ShipToAddr[1];
                    BillingAddr[2] := ShipToAddr[2];
                    BillingAddr[3] := ShipToAddr[3];
                    BillingAddr[4] := LocationRec.City + ' ,' + StateRec2.Description + ', ' + LocationRec."Post Code" + ',';
                    BillingAddr[5] := 'Contact:' + LocationRec.Contact;
                end else begin
                    BillingLocation.Get("Bill to-Location(POS)");
                    StateRec2.Get(BillingLocation."State Code");
                    BillingAddr[1] := BillingLocation.Name + ',';
                    BillingAddr[2] := BillingLocation.Address + ',';
                    BillingAddr[3] := BillingLocation."Address 2" + ',';
                    BillingAddr[4] := BillingLocation.City + ',' + StateRec2.Description + ', ' + BillingLocation."Post Code" + ',';
                    BillingAddr[5] := 'Contact: ' + BillingLocation.Contact;
                end;

                if PaymentTerms.Get("Payment Terms Code") then
                    PaymentRemarks := PaymentTerms.Description;
                PurchCommentLine.SetRange("Document Type", "Purchase Header"."Document Type");
                PurchCommentLine.SetRange("No.", "Purchase Header"."No.");
                if PurchCommentLine.FindSet() then
                    repeat
                        if PurchCommentLine.Type = PurchCommentLine.Type::Delivery then
                            DeliveryRemarks := PurchCommentLine.Comment;
                        if PurchCommentLine.Type = PurchCommentLine.Type::Freight then
                            FrieghtRemarks := PurchCommentLine.Comment;
                        if PurchCommentLine.Type = PurchCommentLine.Type::Others then
                            ValidityRemarks := PurchCommentLine.Comment;
                        if PurchCommentLine.Type = PurchCommentLine.Type::Payment then
                            PaymentRemarks2 := PurchCommentLine.Comment;
                    until PurchCommentLine.Next() = 0;
                GetPurchaseStatisticsAmount("Purchase Header", TotalGSTAmount, TotalGSTPercent);
                TotalAmount := TotalAmount + TotalGSTAmount;
                //FinalTotal := TotalAmount + TotalGSTAmount;

                // Message('Amt;', FinalTotal);
                //RepCheck.InitTextVariable;
                AmtInWords.InitTextVariable();
                AmtInWords.FormatNoText(NoText, ROUND(Abs(TotalAmount)), "Purchase Header"."Currency Code");
                //RepCheck.FormatNoText(NoText, ROUND(TotalAmount), "Purchase Header"."Currency Code");
                /* WorkFlowEntriesBuff.Reset();
                WorkFlowEntriesBuff.SetRange("Record ID", "Purchase Header".RecordId);
                WorkFlowEntriesBuff.SetRange(Status, WorkFlowEntriesBuff.Status::Approved);
                if WorkFlowEntriesBuff.FindLast() then begin
                    ApprovalText := 'Approved By' + WorkFlowEntriesBuff."To Be Approved By User ID";
                end
                else
                    ApprovalText := 'Pending for Approval'; */

                ApprovalEntry.Reset();
                ApprovalEntry.SetRange("Document No.", "Purchase Header"."No.");
                ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Approved);
                if ApprovalEntry.FindLast() then begin
                    User.Reset();
                    User.SetRange("User Name", ApprovalEntry."Approver ID");
                    if User.FindFirst() then
                        ApprovalText := 'Approved By ' + User."Full Name";
                end else
                    ApprovalText := 'Pending for Approval';


            end;

        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoofCopies; NoOfCopy)
                    {
                        Caption = 'No. of Copies';
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the number of copies that need to be printed.';
                    }
                    field(ShowInternalInformation; ShowInternalInfo)
                    {
                        Caption = 'Show Internal Information';
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the line internal information.';
                    }
                }
            }
        }

    }
    procedure GetPurchaseStatisticsAmount(
        PurchaseHeader: Record "Purchase Header";
        var GSTAmount: Decimal; var GSTPercent: Decimal)
    var
        PurchaseLine: Record "Purchase Line";
    begin
        Clear(GSTAmount);
        Clear(GSTPercent);
        Clear(TotalAmount);
        Clear(SGSTAmt);
        Clear(CGSTAmt);
        Clear(IGSSTAmt);
        Clear(IGSTPercent);
        Clear(SGSTPercent);
        Clear(CGSTPercent);

        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document no.", PurchaseHeader."No.");
        if PurchaseLine.FindSet() then
            repeat
                GSTAmount += GetGSTAmount(PurchaseLine.RecordId());
                GSTPercent += GetGSTPercent(PurchaseLine.RecordId());
                TotalAmount += PurchaseLine."Line Amount" /*- PurchaseLine."Line Discount Amount"*/ - PurchaseLine."Inv. Discount Amount";//PCPL/NSW/170222
                GetGSTAmounts(PurchaseLine);
            until PurchaseLine.Next() = 0;
    end;

    local procedure GetGSTAmount(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;

        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        if GSTSetup."Cess Tax Type" <> '' then
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type", GSTSetup."Cess Tax Type")
        else
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then begin
            TaxTransactionValue.CalcSums(Amount);
            TaxTransactionValue.CalcSums(Percent);
            /*  if TaxTransactionValue."Value ID" = 6 then begin
                 SGSTAmt += TaxTransactionValue.Amount;
                 SGSTPercent += TaxTransactionValue.Percent;
                 message('%1', SGSTAmt);
             end;
             if TaxTransactionValue."Value ID" = 2 then begin
                 CGSTAmt += TaxTransactionValue.Amount;
                 CGSTPercent += TaxTransactionValue.Percent;
             end;
             if TaxTransactionValue."Value ID" = 3 then begin
                 IGSSTAmt += TaxTransactionValue.Amount;
                 IGSTPercent += TaxTransactionValue.Percent;
             end; */
        end;


        exit(TaxTransactionValue.Amount);
    end;

    local procedure GetGSTPercent(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;

        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        if GSTSetup."Cess Tax Type" <> '' then
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type", GSTSetup."Cess Tax Type")
        else
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then
            TaxTransactionValue.CalcSums(Percent);

        exit(TaxTransactionValue.Percent);
    end;

    trigger OnInitReport()
    begin
        GLSetup.Get();
        PurchSetup.Get();
    end;

    var
        GLSetup: Record "General Ledger Setup";
        NoText: array[2] of Text[80];
        AmtInWords: Codeunit "Amount In Words";
        RepCheck: Report 1401;
        CompanyInfo: Record "Company Information";
        User: Record User;
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PrepmtPaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLine: Record "VAT Amount Line";
        TempPrePmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
        TempPurchLine: Record "Purchase Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        PrepmtDimSetEntry: Record "Dimension Set Entry";
        TempPrepmtInvBuf: Record "Prepayment Inv. Line Buffer" temporary;
        RespCenter: Record "Responsibility Center";
        CurrExchRate: Record "Currency Exchange Rate";
        PurchSetup: Record "Purchases & Payables Setup";
        Vendor: Record Vendor;
        PurchCountPrinted: Codeunit "Purch.Header-Printed";
        FormatAdd: Codeunit "Format Address";
        PurchPost: Codeunit "Purch.-Post";
        TotalAmount: Decimal;
        FinalTotal: Decimal;
        TotalGSTPercent: Decimal;
        PurchPostPrepmt: Codeunit "Purchase-Post Prepayments";
        TDSCompAmount: array[20] of Decimal;
        CessAmount: Decimal;
        GSTComponentCodeName: array[20] of Code[20];
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSSTAmt: Decimal;
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        BuyFromAddr: array[8] of Text[50];
        BillingAddr: Array[8] of Text[50];
        PurchaserText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopy: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        DimText: Text[120];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        TDSAmt: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        PrepmtVATAmount: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        PricesInclVATtxt: Text[30];
        AllowInvDisctxt: Text[30];
        OtherTaxesAmount: Decimal;
        GSTTot: Decimal;
        ChargesAmount: Decimal;
        [InDataSet]
        TotalSubTotal: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        TotalTaxAmount: Decimal;
        GLAccountNo: Code[20];
        TotalGSTAmount: Decimal;
        IsGSTApplicable: Boolean;
        PrepmtLoopLineNo: Integer;
        VatAmtSpecLbl: Label 'VAT Amount Specification in ';
        LocalCurrencyLbl: Label 'Local Currency';
        ExchangeRateLbl: Label 'Exchange rate: %1/%2', Comment = '%1 = Relational Exch. Rate Amount %2 = Exchange Rate Amount';
        TotalIncTaxLbl: Label 'Total %1 Incl. Taxes', Comment = '%1 Total Inc Tax';
        TotalExclTaxLbl: Label 'Total %1 Excl. Taxes', Comment = '%1 Total Excl Tax';
        PurchLbl: Label 'Purchaser';
        TotalLbl: Label 'Total %1', Comment = '%1 Total';
        CopyLbl: Label 'COPY';
        OrderLbl: Label ' Purchase Order %1', Comment = '%1 Order';
        PhoneNoCaptionLbl: Label 'Phone No.';
        VATRegNoCaptionLbl: Label 'VAT Reg. No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccNoCaptionLbl: Label 'Account No.';
        OrderNoCaptionLbl: Label 'Order No.';
        PageCaptionLbl: Label 'Page';
        IGSTLbl: Label 'IGST';
        SGSTLbl: Label 'SGST';
        CGSTLbl: Label 'CGST';
        CESSLbl: Label 'CESS';
        GSTLbl: Label 'GST';
        GSTCESSLbl: Label 'GST CESS';
        HdrDimsCaptionLbl: Label 'Header Dimensions';
        DirectUnitCostCaptionLbl: Label 'Direct Unit Cost';
        DiscPercentCaptionLbl: Label 'Discount %';
        AmtCaptionLbl: Label 'Amount';
        LineDiscAmtCaptionLbl: Label 'Line Discount Amount';
        AllowInvDiscCaptionLbl: Label 'Allow Invoice Discount';
        SubtotalCaptionLbl: Label 'Subtotal';
        TaxAmtCaptionLbl: Label 'Tax Amount';
        OtherTaxesAmtCaptionLbl: Label 'Other Taxes Amount';
        ChrgsAmtCaptionLbl: Label 'Charges Amount';
        TotalTDSIncleSHECessCaptionLbl: Label 'Total TDS Amount';
        VATDiscAmtCaptionLbl: Label 'Payment Discount on VAT';
        LineDimsCaptionLbl: Label 'Line Dimensions';
        VATAmtSpecCaptionLbl: Label 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        LineAmtCaptionLbl: Label 'Line Amount';
        PmtDetailsCaptionLbl: Label 'Payment Details';
        VendNoCaptionLbl: Label 'Vendor No.';
        ShiptoAddrCaptionLbl: Label 'Ship-to Address';
        DescCaptionLbl: Label 'Description';
        GLAccNoCaptionLbl: Label 'G/L Account No.';
        PrepmtSpecCaptionLbl: Label 'Prepayment Specification';
        PrepmtVATAmtSpecCaptionLbl: Label 'Prepayment VAT Amount Specification';
        PrepmtVATIdentCaptionLbl: Label 'VAT Identifier';
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        VATPercentCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmtCaptionLbl: Label 'VAT Amount';
        VATIdentCaptionLbl: Label 'VAT Identifier';
        TotalCaptionLbl: Label 'Total';
        PmtTermsDescCaptionLbl: Label 'Payment Terms';
        ShpMethodDescCaptionLbl: Label 'Shipment Method';
        PrepmtTermsDescCaptionLbl: Label 'Prepmt. Payment Terms';
        DocDateCaptionLbl: Label 'Order Date';
        HomePageCaptionLbl: Label 'Home Page';
        EmailCaptionLbl: Label 'E-Mail';
        CompanyRegistrationLbl: Label 'Company Registration No.';
        VendorRegistrationLbl: Label 'Vendor GST Reg No.';
        SGSTPercent: Decimal;
        CGSTPercent: Decimal;
        IGSTPercent: Decimal;
        PaymentRemarks: Text[250];
        FrieghtRemarks: Text[250];
        ValidityRemarks: Text[250];
        DeliveryRemarks: Text[250];
        PaymentRemarks2: Text[250];
        PurchCommentLine: Record "Purch. Comment Line";
        WorkFlowEntriesBuff: Record "Workflows Entries Buffer";
        ApprovalEntry: Record "Approval Entry";
        ApprovalText: Text[200];
        VendorRec: Record Vendor;
        VendorGST: Code[20];
        RsLbl: Label 'Rs. ';
        StateRec: Record State;
        StateRec2: Record State;
        LocationRec: Record Location;
        BillingLocation: Record Location;
        Statedescription: Text[100];
        ClientGSTIN: Code[20];


    procedure InitializeRequest(
        NewNoOfCopies: Integer;
        NewShowInternalInfo: Boolean)
    begin
        NoOfCopy := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
    end;

    local procedure CheckGSTDoc(PurchLine: Record "Purchase Line"): Boolean
    var
        TaxTransactionValue: Record "Tax Transaction Value";
    begin
        TaxTransactionValue.Reset();
        TaxTransactionValue.SetRange("Tax Record ID", PurchLine.RecordId);
        TaxTransactionValue.SetRange("Tax Type", 'GST');
        if not TaxTransactionValue.IsEmpty then
            exit(true);
    end;

    local procedure GetDimensionText(
        var DimSetEntry: Record "Dimension Set Entry";
        Number: Integer;
        var Continue: Boolean): Text[120]
    var
        DimensionText: Text[120];
        PrevDimText: Text[75];
        DimensionTextLbl: Label '%1; %2 - %3', Comment = ' %1 = DimText, %2 = Dimension Code, %3 = Dimension Value Code';
        DimensionLbl: Label '%1 - %2', Comment = '%1 = Dimension Code, %2 = Dimension Value Code';
    begin
        Continue := false;
        if Number = 1 then
            if not DimSetEntry.FindSet() then
                exit;

        repeat
            PrevDimText := CopyStr((DimensionText), 1, 75);
            if DimensionText = '' then
                DimensionText := StrSubstNo(DimensionLbl, DimSetEntry."Dimension Code", DimSetEntry."Dimension Value Code")
            else
                DimensionText := CopyStr(
                    StrSubstNo(
                        DimensionTextLbl,
                        DimensionText,
                        DimSetEntry."Dimension Code",
                        DimSetEntry."Dimension Value Code"),
                    1,
                    120);

            if StrLen(DimensionText) > MaxStrLen(PrevDimText) then begin
                Continue := true;
                exit(PrevDimText);
            end;
        until DimSetEntry.Next() = 0;

        exit(DimensionText)
    end;

    procedure GetGSTRoundingPrecision(ComponentName: Code[30]): Decimal
    var
        TaxComponent: Record "Tax Component";
        GSTSetup: Record "GST Setup";
        GSTRoundingPrecision: Decimal;
    begin
        if not GSTSetup.Get() then
            exit;
        GSTSetup.TestField("GST Tax Type");

        TaxComponent.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxComponent.SetRange(Name, ComponentName);
        TaxComponent.FindFirst();
        if TaxComponent."Rounding Precision" <> 0 then
            GSTRoundingPrecision := TaxComponent."Rounding Precision"
        else
            GSTRoundingPrecision := 1;
        exit(GSTRoundingPrecision);
    end;

    local procedure GetInvoiceRoundingAmount(PurchaseHeader: Record "Purchase Header")
    var
        VendorPostingGroup: Record "Vendor Posting Group";
    begin
        Vendor.SetRange("No.", PurchaseHeader."Buy-from Vendor No.");
        Vendor.SetRange("Vendor Posting Group", PurchaseHeader."Vendor Posting Group");
        if Vendor.FindFirst() then begin
            VendorPostingGroup.SetRange(Code, Vendor."Vendor Posting Group");
            if VendorPostingGroup.FindFirst() then
                GLAccountNo := VendorPostingGroup."Invoice Rounding Account";
        end;
    end;

    local procedure GetGSTAmounts(PurchaseLine: Record "Purchase Line")
    var
        ComponentName: Code[30];
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;

        ComponentName := GetComponentName("Purchase Line", GSTSetup);

        if (PurchaseLine.Type <> PurchaseLine.Type::" ") then begin
            TaxTransactionValue.Reset();
            TaxTransactionValue.SetRange("Tax Record ID", PurchaseLine.RecordId);
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
            TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
            if TaxTransactionValue.FindSet() then
                repeat
                    case TaxTransactionValue."Value ID" of
                        6:
                            begin
                                SGSTAmt += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                SGSTPercent := TaxTransactionValue.Percent;
                            end;
                        2:
                            begin
                                CGSTAmt += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                CGSTPercent := TaxTransactionValue.Percent;
                            end;
                        3:
                            begin
                                IGSSTAmt += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                IGSTPercent := TaxTransactionValue.Percent;
                            end;
                    end;
                until TaxTransactionValue.Next() = 0;
        end;
    end;

    local procedure GetCessAmount(TaxTransactionValue: Record "Tax Transaction Value";
        PurchaseLine: Record "Purchase Line";
        GSTSetup: Record "GST Setup")
    begin
        if (PurchaseLine.Type <> PurchaseLine.Type::" ") then begin
            TaxTransactionValue.Reset();
            TaxTransactionValue.SetRange("Tax Record ID", PurchaseLine.RecordId);
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."Cess Tax Type");
            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
            if TaxTransactionValue.FindSet() then
                repeat
                    CessAmount += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(GetComponentName(PurchaseLine, GSTSetup)));
                until TaxTransactionValue.Next() = 0;
        end;
    end;

    local procedure GetGSTCaptions(TaxTransactionValue: Record "Tax Transaction Value";
        PurchaseLine: Record "Purchase Line";
        GSTSetup: Record "GST Setup")
    begin
        TaxTransactionValue.Reset();
        TaxTransactionValue.SetRange("Tax Record ID", PurchaseLine.RecordId);
        TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if TaxTransactionValue.FindSet() then
            repeat
                case TaxTransactionValue."Value ID" of
                    6:
                        GSTComponentCodeName[6] := SGSTLbl;
                    2:
                        GSTComponentCodeName[2] := CGSTLbl;
                    3:
                        GSTComponentCodeName[3] := IGSTLbl;
                end;
            until TaxTransactionValue.Next() = 0;
    end;

    local procedure GetComponentName(PurchaseLine: Record "Purchase Line";
        GSTSetup: Record "GST Setup"): Code[30]
    var
        ComponentName: Code[30];
    begin
        if GSTSetup."GST Tax Type" = GSTLbl then
            if PurchaseLine."GST Jurisdiction Type" = PurchaseLine."GST Jurisdiction Type"::Interstate then
                ComponentName := IGSTLbl
            else
                ComponentName := CGSTLbl
        else
            if GSTSetup."Cess Tax Type" = GSTCESSLbl then
                ComponentName := CESSLbl;
        exit(ComponentName)
    end;

    local procedure GetTDSAmount(TaxTransactionValue: Record "Tax Transaction Value";
        PurchaseLine: Record "Purchase Line";
        TDSSetup: Record "TDS Setup")
    begin
        if (PurchaseLine.Type <> PurchaseLine.Type::" ") then begin
            TaxTransactionValue.Reset();
            TaxTransactionValue.SetRange("Tax Record ID", PurchaseLine.RecordId);
            TaxTransactionValue.SetRange("Tax Type", TDSSetup."Tax Type");
            TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
            if TaxTransactionValue.FindSet() then
                repeat
                    TDSAmt += TaxTransactionValue.Amount;
                until TaxTransactionValue.Next() = 0;
        end;
        TDSAmt := Round(TDSAmt, 1);
    end;
}