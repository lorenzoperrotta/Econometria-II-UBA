clear
ssc install bcuse
bcuse bwght

*punto c*

eststo: regress lbwght male parity lfaminc packs

eststo: ivregress 2sls lbwght male parity lfaminc (packs=cigprice)

esttab, label nonumbers mtitles("OLS" "2SLS") se r2
esttab using 5.3.tex, label nonumbers mtitles("OLS" "2SLS") se r2 replace



*punto d*
regress packs male parity lfaminc cigprice

esttab, label nonumbers title (Froma reducida para packs) se r2
esttab using 5.3d.tex, label se r2 replace
