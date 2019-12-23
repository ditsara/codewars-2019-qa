Stock Market
============

The given file sp500.txt (stock-market/sp500.txt)
has the date and closing price of the S&P500 stock market index
for each **trading day** from 1927 until today.

The format is:

```
<date>        <closing price>
^-- column 1  ^-- column 15
```

Imagine you had invested and then waited for 60 **trading days**.
Calculate the **best** and **worst** dates to buy in / sell out (measured by
percentage return) for a 60-**trading day** period.

Example, the return from 1980-01-15 to 1980-04-10:

<code>
1980-01-15    111.139999
1980-04-10    104.080002

( 104.080002 / 111.139999 ) - 1

=> -0.06352345747276833
or -6.35% (ie, negative return, a bad 60 days)
</code>
