/*
Post-Deployment Script Template
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.
 Use SQLCMD syntax to include a file in the post-deployment script.
 Example:      :r .\myfile.sql
 Use SQLCMD syntax to reference a variable in the post-deployment script.
 Example:      :setvar TableName MyTable
               SELECT * FROM [$(TableName)]
--------------------------------------------------------------------------------------
*/

USE [master]
GO

USE [$(DatabaseName)]
GO

PRINT N'Populate dbo.CodeType';


IF NOT EXISTS( SELECT 1 FROM dbo.CodeType )
BEGIN
	SET IDENTITY_INSERT dbo.CodeType ON ;
    INSERT INTO
        dbo.CodeType( 
			Recnum
		  , TYPE
		  , DESCRIPTION
		  , COMMENT )
	SELECT
		Recnum
	  , TYPE
	  , DESCRIPTION
	  , COMMENT
    FROM
        [$(SpringfieldProd)].dbo.CodeType ;
	SET IDENTITY_INSERT dbo.CodeType OFF ;
END


PRINT N'Populate dbo.CodeMast';


IF NOT EXISTS( SELECT 1 FROM dbo.CodeMast )
BEGIN
	SET IDENTITY_INSERT dbo.CodeMast ON ;
    INSERT INTO
        dbo.CodeMast( 
			Recnum
		  , TYPE
		  , CODE
		  , DESCRIPTION )
	SELECT 
		Recnum
	  , TYPE
	  , CODE
	  , DESCRIPTION
	FROM
		[$(SpringfieldProd)].dbo.CodeMast ;
	SET IDENTITY_INSERT dbo.CodeMast OFF ;
END


PRINT N'Populate dbo.FedHeaderCampPerry';


IF NOT EXISTS( SELECT 1 FROM dbo.FedHeaderCampPerry )
BEGIN
	SET IDENTITY_INSERT dbo.FedHeaderCampPerry ON ;
    INSERT INTO
        dbo.FedHeaderCampPerry( 
			ID                  
		  , Serial              
		  , GunType             
		  , Manufacturer        
		  , SPRNum              
		  , Model               
		  , ModelDescription    
		  , Caliber             
		  , SemiOrFullAuto      
		  , BoltNum             
		  , Headspace           
		  , Importer            
		  , FirstReceivedDate   
		  , Location            
		  , ExciseTaxPaidDate   
		  , ExciseTaxPaidAmount 
		  , CurrentState        
		  , LastLineNum         
		  , CreatedBy           
		  , CreatedDate )         
	SELECT 
		ID                  
	  , Serial              
	  , GunType             
	  , Manufacturer        
	  , SPRNum              
	  , Model               
	  , ModelDescription    
	  , Caliber             
	  , SemiOrFullAuto      
	  , BoltNum             
	  , Headspace           
	  , Importer            
	  , FirstReceivedDate   
	  , Location            
	  , ExciseTaxPaidDate   
	  , ExciseTaxPaidAmount 
	  , CurrentState        
	  , LastLineNum         
	  , CreatedBy           
	  , CreatedDate 
	FROM
		[$(SpringfieldProd)].dbo.FedHeaderCampPerry ;
	SET IDENTITY_INSERT dbo.FedHeaderCampPerry OFF ;
END


PRINT N'Populate dbo.FedTransCampPerry';


IF NOT EXISTS( SELECT 1 FROM dbo.FedTransCampPerry )
BEGIN
	SET IDENTITY_INSERT dbo.FedTransCampPerry ON ;
    INSERT INTO
        dbo.FedTransCampPerry( 
			ID              
		  , HeaderID        
		  , LineNum         
		  , TransactionDate 
		  , TransactionType 
		  , Name            
		  , Street1         
		  , Street2         
		  , City            
		  , State           
		  , Country         
		  , FFLNumber       
		  , ChangeType      
		  , Description     
		  , RMA             
		  , ReceivingTicket 
		  , WorkOrderNumber 
		  , WorkOrderLine   
		  , OrdNum          
		  , OrderLineNum    
		  , PreviousValue   
		  , NewValue        
		  , CorrectionFor   
		  , CorrectedBy     
		  , Form4473        
		  , Location        
		  , DefectTagNumber 
		  , CreatedBy       
		  , CreatedDate )   
	SELECT 
		ID              
	  , HeaderID        
	  , LineNum         
	  , TransactionDate 
	  , TransactionType 
	  , Name            
	  , Street1         
	  , Street2         
	  , City            
	  , State           
	  , Country         
	  , FFLNumber       
	  , ChangeType      
	  , Description     
	  , RMA             
	  , ReceivingTicket 
	  , WorkOrderNumber 
	  , WorkOrderLine   
	  , OrdNum          
	  , OrderLineNum    
	  , PreviousValue   
	  , NewValue        
	  , CorrectionFor   
	  , CorrectedBy     
	  , Form4473        
	  , Location        
	  , DefectTagNumber 
	  , CreatedBy       
	  , CreatedDate
	FROM
		[$(SpringfieldProd)].dbo.FedTransCampPerry ;
	SET IDENTITY_INSERT dbo.FedTransCampPerry OFF ;
END


PRINT N'Populate dbo.GUNTYPES';


IF NOT EXISTS( SELECT 1 FROM dbo.GUNTYPES )
BEGIN
	SET IDENTITY_INSERT dbo.GUNTYPES ON ;
    INSERT INTO
        dbo.GUNTYPES( 
			Recnum          
		  , CODE            
		  , [DESC]            
		  , FLAG1           
		  , FLAG2           
		  , FLAG3           
		  , FLAG4           
		  , FLAG5           
		  , MANUFACT        
		  , MODEL           
		  , SEMIFULL        
		  , NAME            
		  , STREET          
		  , CITY            
		  , STATE           
		  , NUM_SER_TO_ENT  
		  , NUM_SER_NOT_ENT 
		  , PREFIX          
		  , SUFFIX          
		  , PRINTED )        
	SELECT 
		Recnum          
      , CODE            
      , [DESC]            
      , FLAG1           
      , FLAG2           
      , FLAG3           
      , FLAG4           
      , FLAG5           
      , MANUFACT        
      , MODEL           
      , SEMIFULL        
      , NAME            
      , STREET          
      , CITY            
      , STATE           
      , NUM_SER_TO_ENT  
      , NUM_SER_NOT_ENT 
      , PREFIX          
      , SUFFIX          
      , PRINTED         
	FROM
		[$(SpringfieldProd)].dbo.GUNTYPES ;
	SET IDENTITY_INSERT dbo.GUNTYPES OFF ;
END


PRINT N'Populate dbo.parts';


IF NOT EXISTS( SELECT 1 FROM dbo.parts )
BEGIN
	SET IDENTITY_INSERT dbo.parts ON ;
    INSERT INTO
        dbo.parts( 
			Recnum                   
		  , SPRNUM                   
		  , [DESC]                     
		  , ORIGAMNT                 
		  , RAW                      
		  , WIP                      
		  , FIN                      
		  , ASSIGNED                 
		  , REORDPNT                 
		  , ONORD                    
		  , [FULL]                     
		  , YSHIP                    
		  , YA                       
		  , YP                       
		  , LSALE                    
		  , COSTRAW                  
		  , COSTWIP                  
		  , COSTFIN                  
		  , DEALER                   
		  , RETAIL                   
		  , Z                        
		  , UPC                      
		  , DEFRAW                   
		  , DEFWIP                   
		  , DEFFIN                   
		  , GUNTYPE                  
		  , GUNSTOCK                 
		  , DELIVERY                 
		  , NOTE                     
		  , Overhead                 
		  , IndirectLabor            
		  , DirectLabor              
		  , MaterialCost             
		  , SubContractor            
		  , SUB2                     
		  , SUB3                     
		  , FREIGHT                  
		  , EXCISE                   
		  , CALIBER                  
		  , COMPANY_#                
		  , DIVISION_#               
		  , ACCOUNT_ID               
		  , NSN_#                    
		  , FS_#                     
		  , VENDOR_INFO              
		  , DESC_2                   
		  , RESERVED                 
		  , INTERNAT_FLAG            
		  , PRICE_EDIT               
		  , INSPECT_FLAG             
		  , SCRAP                    
		  , COSTSCRAP                
		  , PURCH_FLAG               
		  , RECEIVE_TO               
		  , SCOMPANY_#               
		  , SDIVISION_#              
		  , SACCOUNT_ID              
		  , PR_SHT_DESC              
		  , RAW_ASSIGNED             
		  , FREIGHT_FLAG             
		  , BREAKDOWN_FLAG           
		  , GROUP1                   
		  , RPT_GROUP                
		  , LOT_SIZE                 
		  , CUSTOM_COUNT             
		  , SERIAL_FLAG              
		  , WHLS_QTY1                
		  , WHLS_PRCNT1              
		  , WHLS_QTY2                
		  , WHLS_PRCNT2              
		  , WHLS_QTY3                
		  , WHLS_PRCNT3              
		  , WHLS_QTY4                
		  , WHLS_PRCNT4              
		  , DLR_QTY1                 
		  , DLR_PRCNT1               
		  , DLR_QTY2                 
		  , DLR_PRCNT2               
		  , DLR_QTY3                 
		  , DLR_PRCNT3               
		  , DLR_QTY4                 
		  , DLR_PRCNT4               
		  , RTL_QTY1                 
		  , RTL_PRCNT1               
		  , RTL_QTY2                 
		  , RTL_PRCNT2               
		  , RTL_QTY3                 
		  , RTL_PRCNT3               
		  , RTL_QTY4                 
		  , RTL_PRCNT4               
		  , WHOLESALE                
		  , VENDOR_ID                
		  , FIREARM_FLAG             
		  , TAX_FLAG                 
		  , EXCISE_TYPE              
		  , UOM_DESC                 
		  , LEAD_TIME                
		  , INVAVGPRICE              
		  , WOASSIGNED               
		  , OEASSIGNED               
		  , BARREL_LENGTH            
		  , FINISH                   
		  , SELLABLE                 
		  , ACTIVE                   
		  , DRAWING_NUMBER           
		  , REVISION_NUMBER          
		  , Sale_Notes               
		  , Tech_Notes               
		  , Part_Type                
		  , Part_Category            
		  , LawEnf_Price             
		  , Star_Price               
		  , BoxStore_Price           
		  , BuyGroup_Price           
		  , HASSERIAL                
		  , CreatedBy                
		  , CreatedDate              
		  , ChangedBy                
		  , ChangedDate              
		  , Version                  
		  , UpdateSysInven           
		  , Capacity                 
		  , Location                 
		  , Aisle                    
		  , Rack                     
		  , Tier                     
		  , Bin                      
		  , ExciseTaxTotalMatCost    
		  , ExciseTaxTotalMatTaxCost 
		  , ExciseTaxLaborCost       
		  , ExciseTaxRatio           
		  , ExciseTaxAdjustedTax     
		  , ExciseTaxLaborTaxCost    
		  , ThreadedBarrel           
		  , SubCategory              
		  , Packed                   
		  , PulledToWO )               
	SELECT 
		Recnum                   
      , SPRNUM                   
      , [DESC]                    
      , ORIGAMNT                 
      , RAW                      
      , WIP                      
      , FIN                      
      , ASSIGNED                 
      , REORDPNT                 
      , ONORD                    
      , [FULL]                     
      , YSHIP                    
      , YA                       
      , YP                       
      , LSALE                    
      , COSTRAW                  
      , COSTWIP                  
      , COSTFIN                  
      , DEALER                   
      , RETAIL                   
      , Z                        
      , UPC                      
      , DEFRAW                   
      , DEFWIP                   
      , DEFFIN                   
      , GUNTYPE                  
      , GUNSTOCK                 
      , DELIVERY                 
      , NOTE                     
      , Overhead                 
      , IndirectLabor            
      , DirectLabor              
      , MaterialCost             
      , SubContractor            
      , SUB2                     
      , SUB3                     
      , FREIGHT                  
      , EXCISE                   
      , CALIBER                  
      , COMPANY_#                
      , DIVISION_#               
      , ACCOUNT_ID               
      , NSN_#                    
      , FS_#                     
      , VENDOR_INFO              
      , DESC_2                   
      , RESERVED                 
      , INTERNAT_FLAG            
      , PRICE_EDIT               
      , INSPECT_FLAG             
      , SCRAP                    
      , COSTSCRAP                
      , PURCH_FLAG               
      , RECEIVE_TO               
      , SCOMPANY_#               
      , SDIVISION_#              
      , SACCOUNT_ID              
      , PR_SHT_DESC              
      , RAW_ASSIGNED             
      , FREIGHT_FLAG             
      , BREAKDOWN_FLAG           
      , GROUP1                   
      , RPT_GROUP                
      , LOT_SIZE                 
      , CUSTOM_COUNT             
      , SERIAL_FLAG              
      , WHLS_QTY1                
      , WHLS_PRCNT1              
      , WHLS_QTY2                
      , WHLS_PRCNT2              
      , WHLS_QTY3                
      , WHLS_PRCNT3              
      , WHLS_QTY4                
      , WHLS_PRCNT4              
      , DLR_QTY1                 
      , DLR_PRCNT1               
      , DLR_QTY2                 
      , DLR_PRCNT2               
      , DLR_QTY3                 
      , DLR_PRCNT3               
      , DLR_QTY4                 
      , DLR_PRCNT4               
      , RTL_QTY1                 
      , RTL_PRCNT1               
      , RTL_QTY2                 
      , RTL_PRCNT2               
      , RTL_QTY3                 
      , RTL_PRCNT3               
      , RTL_QTY4                 
      , RTL_PRCNT4               
      , WHOLESALE                
      , VENDOR_ID                
      , FIREARM_FLAG             
      , TAX_FLAG                 
      , EXCISE_TYPE              
      , UOM_DESC                 
      , LEAD_TIME                
      , INVAVGPRICE              
      , WOASSIGNED               
      , OEASSIGNED               
      , BARREL_LENGTH            
      , FINISH                   
      , SELLABLE                 
      , ACTIVE                   
      , DRAWING_NUMBER           
      , REVISION_NUMBER          
      , Sale_Notes               
      , Tech_Notes               
      , Part_Type                
      , Part_Category            
      , LawEnf_Price             
      , Star_Price               
      , BoxStore_Price           
      , BuyGroup_Price           
      , HASSERIAL                
      , CreatedBy                
      , CreatedDate              
      , ChangedBy                
      , ChangedDate              
      , Version                  
      , UpdateSysInven           
      , Capacity                 
      , Location                 
      , Aisle                    
      , Rack                     
      , Tier                     
      , Bin                      
      , ExciseTaxTotalMatCost    
      , ExciseTaxTotalMatTaxCost 
      , ExciseTaxLaborCost       
      , ExciseTaxRatio           
      , ExciseTaxAdjustedTax     
      , ExciseTaxLaborTaxCost    
      , ThreadedBarrel           
      , SubCategory              
      , Packed                   
      , PulledToWO               
	FROM
		[$(SpringfieldProd)].dbo.parts ;
	SET IDENTITY_INSERT dbo.parts OFF ;
END


PRINT N'Populate dbo.SMSUPPLY';


IF NOT EXISTS( SELECT 1 FROM dbo.SMSUPPLY )
BEGIN
	SET IDENTITY_INSERT dbo.SMSUPPLY ON ;
    INSERT INTO
        dbo.SMSUPPLY( 
			Recnum   
		  , SUPPLIER 
		  , NAME     
		  , STREET   
		  , CITY     
		  , STATE    
		  , FFLNUM )   
	SELECT 
		Recnum   
      , SUPPLIER 
      , NAME     
      , STREET   
      , CITY     
      , STATE    
      , FFLNUM   
	FROM
		[$(SpringfieldProd)].dbo.SMSUPPLY ;
	SET IDENTITY_INSERT dbo.SMSUPPLY OFF ;
END
GO


PRINT N'Creating Backup';
GO

BACKUP DATABASE 
	[$(DatabaseName)]
		TO DISK = N'$(BackupPath)$(BackupFile)' WITH 
			DESCRIPTION = N'Backup Copy for Laptop Deployment'
		  , NOFORMAT, NOINIT
		  , NAME = N'CampPerry Full Backup'
		  , SKIP, NOREWIND, NOUNLOAD, NO_COMPRESSION
		  , STATS = 10 ; 
GO

PRINT N'CampPerry Published and Deployed.';