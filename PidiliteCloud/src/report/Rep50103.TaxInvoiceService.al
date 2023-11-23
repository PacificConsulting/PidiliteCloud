report 50103 "Tax Invoice-Service"
{
    Caption = 'Tax Invoice-Service';
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/SalesInvoiceNew.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            column(InvoiceNo; "No.")
            {

            }
            column(DocDate_SalesInvoiceHeader; Format(SalesInvoiceHeader."Document Date", 0, '<Day,2>/<Month,2>/<Year4>'))
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
            column(TCSPercent; TCSPercent)
            {

            }
            column(TCSAmount; TCSAmount)
            {

            }
            column(SGSTAmt; SGSTAmt)
            { }
            column(CGSTAmt; CGSTAmt)
            { }
            column(IGSTAmt; IGSTAmt)
            { }
            column(SGSTPercent; SGSTPercent)
            { }
            column(IGSTPercent; IGSTPercent)
            { }
            column(CGSTPercent; CGSTPercent)
            { }
            column(GrandTotal; GrandTotal)
            {
            }
            column(CustomerGST; 'GSTIN: ' + CustomerGST)
            {

            }
            column(Ship_to_GST_Reg__No_; 'GSTIN: ' + ShipToGST)
            {

            }
            column(AmtInWords; RsLbl + NoText[1] + ' ' + NoText[2])
            {
            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3] + ',')
            {
            }
            column(CompanyAddress4; Staterec.Description + ',' + CompanyInfo."Post Code")
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(CompanyInfo_GST_RegistrationNo; 'GST IN: ' + CompanyInfo."GST Registration No.")
            {
            }
            column(AcctDetails; 'Current A/c No: ' + CompanyInfo."Bank Account No." + ', ' + 'IFSC: ' + CompanyInfo.IBAN)
            { }
            column(BranchDetails; CompanyInfo."Bank Branch No.")
            { }
            column(CompPAN; 'PAN: ' + CompanyInfo."P.A.N. No.")
            { }
            column(CompanyHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CustomerAddress1; CustAddr[1])
            {
            }
            column(CustomerAddress2; CustAddr[2])
            {
            }
            column(CustomerAddress3; CustAddr[3])
            {
            }
            column(CustomerAddress4; CustAddr[4])
            {
            }
            column(CustomerAddress5; CustAddr[5])
            {
            }
            column(CustomerAddress6; CustAddr[6])
            {
            }
            column(CustomerAddress7; CustAddr[7])
            {
            }
            column(CustomerAddress8; CustAddr[8])
            {
            }
            column(ShipToAddress1; ShipToAddr[1])
            {
            }
            column(ShipToAddress2; ShipToAddr[2])
            {
            }
            column(ShipToAddress3; ShipToAddr[3])
            {
            }
            column(ShipToAddress4; ShipToAddr[4])
            {
            }
            column(ShipToAddress5; ShipToAddr[5])
            {
            }
            column(ShipToAddress6; ShipToAddr[6])
            {
            }
            column(ShipToAddress7; ShipToAddr[7])
            {
            }
            column(ShipToAddress8; ShipToAddr[8])
            {
            }
            column(SellToContactPhoneNo; SellToContact."Phone No.")
            {
            }
            column(SellToContactMobilePhoneNo; SellToContact."Mobile Phone No.")
            {
            }
            column(SellToContactEmail; SellToContact."E-Mail")
            {
            }
            column(BillToContactPhoneNo; BillToContact."Phone No.")
            {
            }
            column(BillToContactMobilePhoneNo; BillToContact."Mobile Phone No.")
            {
            }
            column(BillToContactEmail; BillToContact."E-Mail")
            {
            }
            column(PaymentTermsDescription; PaymentTerms.Description)
            {
            }
            column(Retention; Retention)
            {
            }
            column(Retention_Amount; RetentionAmount)
            {
            }
            column(WorkOrderNo; "External Document No.")
            { }
            column(Mobilisation_Advance; "Mobilisation Advance")
            { }
            dataitem(SalesInvLine; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = SalesInvoiceHeader;
                DataItemTableView = sorting("Document No.", "Line No.");
                column(SerialNo; SerialNo)
                { }
                column(Document_No_; "Document No.")
                {

                }
                column(Description; Description)
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Unit_Cost; "Unit Price")
                { }
                column(Line_Amount; "Line Amount")
                {
                }

                trigger OnAfterGetRecord()
                var
                begin
                    SerialNo += 1;
                end;
            }
            trigger OnAfterGetRecord()
            var
            begin
                FormatAddressFields(SalesInvoiceHeader);
                if SellToContact.Get("Sell-to Contact No.") then;
                if BillToContact.Get("Bill-to Contact No.") then;
                Clear(TotalAmount);
                Clear(TotalGSTAmount);
                Clear(GrandTotal);
                Clear(TCSPercent);
                Clear(CustomerGST);
                Clear(ShipToGST);
                if SalesInvoiceHeader."Payment Terms Code" <> '' then
                    PaymentTerms.Get(SalesInvoiceHeader."Payment Terms Code");
                if CustomerRec.Get(SalesInvoiceHeader."Sell-to Customer No.") then
                    CustomerGST := CustomerRec."GST Registration No.";
                if "Ship-to GST Reg. No." = '' then
                    ShipToGST := CustomerGST
                else
                    ShipToGST := "Ship-to GST Reg. No.";
                GetStatisticsAmount(SalesInvoiceHeader, TCSAmount, TCSPercent);
                GetSalesStatisticsAmount(SalesInvoiceHeader, TotalGSTAmount, TotalGSTPercent);
                RetentionAmount := (Retention * TotalAmount) / 100;
                TotalAmount := TotalAmount + TotalGSTAmount;
                GrandTotal := (TotalAmount + TCSAmount) - (RetentionAmount + "Mobilisation Advance");
                ;
                /* RepCheck.InitTextVariable;
                RepCheck.FormatNoText(NoText, ROUND(GrandTotal), SalesHeader."Currency Code"); */
                AmtInWords.InitTextVariable();
                AmtInWords.FormatNoText(NoText, Abs(GrandTotal), SalesInvoiceHeader."Currency Code");

            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }
    }
    trigger OnInitReport()
    var
    begin
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
        StateRec.Get(CompanyInfo."State Code");
        Clear(TCSAmount);
        Clear(TotalAmount);
        Clear(GrandTotal);
        Clear(TotalGSTAmount);
        SerialNo := 0;
    end;

    local procedure FormatAddressFields(var Header: Record "Sales Invoice Header")
    begin
        FormatAddr.GetCompanyAddr(Header."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesInvBillTo(CustAddr, Header);
        ShowShippingAddr := FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, Header);
    end;

    procedure GetSalesStatisticsAmount(
           SalesHeader: Record "Sales Invoice Header";
           var GSTAmount: Decimal; var GSTPercent: Decimal)
    var
        SalesLine: Record "Sales Invoice Line";
    begin
        Clear(GSTAmount);
        Clear(SGSTAmt);
        Clear(CGSTAmt);
        Clear(IGSTAmt);
        Clear(IGSTPercent);
        Clear(SGSTPercent);
        Clear(CGSTPercent);

        SalesLine.SetRange("Document no.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                GSTAmount += GetGSTAmount(SalesLine.RecordId());
                GSTPercent += GetGSTPercent(SalesLine.RecordId());
                TotalAmount += SalesLine."Line Amount" - SalesLine."Line Discount Amount";
                GetGSTAmounts(SalesLine);
            until SalesLine.Next() = 0;
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
             end;
             if TaxTransactionValue."Value ID" = 2 then begin
                 CGSTAmt += TaxTransactionValue.Amount;
                 CGSTPercent += TaxTransactionValue.Percent;
             end;
             if TaxTransactionValue."Value ID" = 3 then begin
                 IGSTAmt += TaxTransactionValue.Amount;
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

    procedure GetStatisticsAmount(
           SalesHeader: Record "Sales Invoice Header";
           var TCSAmount: Decimal; var TCSPercent: Decimal)
    var
        SalesLine: Record "Sales Invoice Line";
        TCSManagement: Codeunit "TCS Management";
        i: Integer;
        RecordIDList: List of [RecordID];
    begin
        Clear(TCSAmount);
        Clear(TCSPercent);

        SalesLine.SetRange("Document no.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                RecordIDList.Add(SalesLine.RecordId());
            until SalesLine.Next() = 0;

        for i := 1 to RecordIDList.Count() do begin
            TCSAmount += GetTCSAmount(RecordIDList.Get(i));
            TCSPercent += GetTCSPercent(RecordIDList.Get(i));
        end;

        TCSAmount := TCSManagement.RoundTCSAmount(TCSAmount);
    end;

    local procedure GetTCSAmount(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        TCSSetup: Record "TCS Setup";
    begin
        if not TCSSetup.Get() then
            exit;

        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetRange("Tax Type", TCSSetup."Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then
            TaxTransactionValue.CalcSums(Amount);

        exit(TaxTransactionValue.Amount);
    end;

    local procedure GetTCSPercent(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        TCSSetup: Record "TCS Setup";
    begin
        if not TCSSetup.Get() then
            exit;

        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetRange("Tax Type", TCSSetup."Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then
            TaxTransactionValue.CalcSums(Percent);

        exit(TaxTransactionValue.Percent);
    end;

    local procedure GetGSTAmounts(Salesline: Record "Sales Invoice Line")
    var
        ComponentName: Code[30];
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;

        ComponentName := GetComponentName(Salesline, GSTSetup);

        if (Salesline.Type <> Salesline.Type::" ") then begin
            TaxTransactionValue.Reset();
            TaxTransactionValue.SetRange("Tax Record ID", Salesline.RecordId);
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
                                IGSTAmt += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                IGSTPercent := TaxTransactionValue.Percent;
                            end;
                    end;
                until TaxTransactionValue.Next() = 0;
        end;
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

    local procedure GetComponentName(SalesLine: Record "Sales Invoice Line";
        GSTSetup: Record "GST Setup"): Code[30]
    var
        ComponentName: Code[30];
    begin
        if GSTSetup."GST Tax Type" = GSTLbl then
            if SalesLine."GST Jurisdiction Type" = SalesLine."GST Jurisdiction Type"::Interstate then
                ComponentName := IGSTLbl
            else
                ComponentName := CGSTLbl
        else
            if GSTSetup."Cess Tax Type" = GSTCESSLbl then
                ComponentName := CESSLbl;
        exit(ComponentName)
    end;

    var
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RepCheck: Report 1401;
        CompanyInfo: Record "Company Information";
        PaymentTerms: Record "Payment Terms";
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        RespCenter: Record "Responsibility Center";
        StateRec: Record State;
        ShowShippingAddr: Boolean;
        AmtInWords: Codeunit "Amount In Words";
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        NoText: array[2] of Text[80];
        TotalAmount: Decimal;
        TotalGSTAmount: Decimal;
        TotalGSTPercent: Decimal;
        TCSAmount: Decimal;
        GrandTotal: Decimal;
        TCSPercent: Decimal;
        SerialNo: Integer;
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        SGSTPercent: Decimal;
        CGSTPercent: Decimal;
        IGSTPercent: Decimal;
        CustomerRec: Record Customer;
        CustomerGST: Code[20];
        IGSTLbl: Label 'IGST';
        SGSTLbl: Label 'SGST';
        CGSTLbl: Label 'CGST';
        CESSLbl: Label 'CESS';
        GSTLbl: Label 'GST';
        GSTCESSLbl: Label 'GST CESS';
        RsLbl: Label 'Rs. ';
        RetentionAmount: Decimal;
        ShipToAddress: Record "Ship-to Address";
        ShipToGST: Code[20];
}