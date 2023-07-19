# StatSigRandomData
 Generate Good Random Data

Step 1: Create and run the stored procedure, zpr_Populate_ztable_lookup
Step 2: Create the view zvw_RandomNumber
Step 3: Create the function zfn_StatSigRand

Then, whenever you need a statistically significant random number, call the function and supply an Average and a Standard Deviation and it will return a statistically significant random number

For example, given Average Sales History (@ASH) and Standard Deviation of Sales History (@STDSH), this will generate new data in line with existing:

				--BEGIN INSERT
				INSERT INTO [dbo].[bt_source_sales_history_additionalrecords]	(		
						[Product_CD]		   ,	[Location_CD]		   ,	[customer_CD]				   
					,	[Sales_Org_CD]		   ,	[Dist_Channel_CD]	   ,	[Division_CD]		   
					,	[WeekBeginning_CD]	   ,	[Sales_History]				)

				SELECT	@Product_CD
					,	@lo
					,	@cust
					,	@so
					,	@dc
					,	@di
					,	@CT
					,	ROUND(dbo.zfn_StatSigRand(@ASH,@STDSH),2)