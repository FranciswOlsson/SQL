   
CREATE PROCEDURE LoanStatement
(
  @LoanAmount money = 100000,
  @ROI        int = 14,
  @TenureInYrs tinyint = 2
)

declare @x int
set @x = 100
print 'My Salary + @x' + CAST(@x as VARCHAR)

as
begin
--Declare a variable for Loan Date
  declare @LoanDate datetime
  set @Loandate = getdate()
  
  --Calculate Interest
  --Formula = PNR/100
  declare @Interest money
  set @Interest = (@LoanAmount * @TenureInYrs * @ROI)/100

  --Calculate TotalAmount 
  declare @TotalAmt money
  set @TotalAmt = @TotalAmt/(@TenureInYrs*12)

  --Display the EMI Table
  print '-------------------------------------------------------------------'
  print 'SL No' + space(10)+ 'EMI Date Date' + space(10)+ 'EMI Amount in USD'
  print '-------------------------------------------------------------------'
  
  --Loop 
  --Start
    declare @i int 
	set @i = 1
  
  --Condition
    while (@i <= TenureInYrs*12)
	begin
	  print cast(@incr as varchar) + space(10) + 
	        cast(dateadd(mm, 1, @LoanDate) as varchar) + space(10) + 
			cast(@EmiAmt as varchar)

	  ---Incr/Decr
	  set @i = @i+1

	end 

  print '-------------------------------------------------------------------'
  print ' Grand Total: ' + CAST(@TotalAmt as VARCHAR)
  print '-------------------------------------------------------------------'

end
go

exec LoanStatement