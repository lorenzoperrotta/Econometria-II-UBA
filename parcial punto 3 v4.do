cd "D:\ECONOMETRIA II\Base de datos STATA"
use "Unidad Individual - Pool Cross Section.dta", clear
preserve 

*tabla 1*
eststo: regress lw lu educ exper expersq age fem single reg0-reg4  year2003-year2005 if year2003==1 | year2004==1 | year2005==1
*eststo: regress lw lu educ exper expersq age fem single i.region  year2003-year2005 if year2003==1 | year2004==1 | year2005==1*
*regress lw lu educ fem single age exper expersq reg0-reg4 year2003-year2013 [fw= weight]*

eststo: regress lw lu educ exper expersq age fem single reg0-reg4  year2006-year2008 if year2006==1 | year2007==1 | year2008==1

eststo: regress lw lu educ exper expersq age fem single reg0-reg4  year2009-year2011 if year2009==1 | year2010==1 | year2011==1

eststo: regress lw lu educ exper expersq age fem single reg0-reg4  year2012-year2014 if year2012==1 | year2013==1 | year2014==1

esttab, label nonumbers title (Tabla 1: Elasticidad de los salarios reales respecto al desempleo agregado para Argentina) mtitles ("2003-2005" "2006-2008" "2009-2011" "2012-2014" "2003-2014")se r2 nostar
esttab using tablaI.rtf, label nonumbers title (Tabla 1: Elasticidad de los salarios reales respecto al desempleo agregado para Argentina) mtitles ("2003-2005" "2006-2008" "2009-2011" "2012-2014" "2003-2014")se r2 replace

restore

*tabla 2*
*micro level*
eststo: regress lw lu educ exper expersq age fem single i.region  i.year
*eststo: regress lw lu educ exper expersq age fem single reg0-reg4  year2003-year2014*

*cell - means*
collapse (mean) lw educ age exper expersq lu, by(region year)
*regress lw lu educ exper expersq age reg0-reg4  year2003-year2014*
eststo: reg lw lu exper expersq age educ i.region i.year
label variable lu "Log(U)"
label variable exper "exper"
label variable age "age"
label variable educ "educ"
label variable lw "lw"
label variable expersq "expersq"

esttab, label nonumbers title (Tabla 2: Elasticidad de la curva de salario estimada para Argentina) mtitles ("Micro Est." "Cell Means")se r2 nostar
esttab using tablaII.rtf, label nonumbers title (Tabla 2: Elasticidad de la curva de salario estimada para Argentina) mtitles ("Micro Est." "Cell Means")se r2 replace

restore

*tabla 3*
*PARTE ADJUSTED*
*all*
eststo: regress lw lu educ exper expersq age fem single i.region i.year
*men vs women*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==0
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==1
*single vs married*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==0
*age*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age<30
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>29 & age<45
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>44
*education*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu<12
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>11 & educ<16
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>15
*region*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg0==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg4==1

esttab, label nonumbers title (Tabla 3: Elasticidad de salarios respecto al desempleo por tipo de trabajador) mtitles ("Mujer" "Hombre" "Soltero" "Casado" "Age 16-29" "Age 30-44" "Age>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar
esttab using tablaIII.rtf, label nonumbers title (Tabla 3: Elasticidad de salarios respecto al desempleo por tipo de trabajador) mtitles ("Mujer" "Hombre" "Soltero" "Casado" "Age 16-29" "Age 30-44" "Age>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar

*PARTE ACTUAL*
*all*
collapse (mean) lw educ age exper expersq lu, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
*men vs women*
collapse (mean) lw educ age exper expersq lu if fem==0, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if fem==1, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
*single vs married*
collapse (mean) lw educ age exper expersq lu if single==1, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if single==0, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
*age*
collapse (mean) lw educ age exper expersq lu if age<30, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if age>29 & age<45, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if age>44, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
*education*
collapse (mean) lw educ age exper expersq lu if edu<12, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if edu>11 & educ<16, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if edu>15, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
*region*
collapse (mean) lw educ age exper expersq lu if reg0==1, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if reg1==1, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if reg2==1, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if reg3==1, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year
collapse (mean) lw educ age exper expersq lu if reg4==1, by(region year)
eststo: regress lw lu educ exper expersq age i.region i.year

label variable lu "Log(U)"
esttab, label nonumbers title (Tabla 3: Elasticidad de salarios respecto al desempleo por tipo de trabajador) mtitles ("Mujer" "Hombre" "Soltero" "Casado" "Age 16-29" "Age 30-44" "Age>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar
esttab using tablaIII-adjusted.rtf, label nonumbers title (Tabla 3: Elasticidad de salarios respecto al desempleo por tipo de trabajador) mtitles ("Mujer" "Hombre" "Soltero" "Casado" "Age 16-29" "Age 30-44" "Age>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar replace

*output total tabla 3*
esttab, label nonumbers title (Tabla 3: Elasticidad de salarios respecto al desempleo por tipo de trabajador) mtitles ("Total" "Total collapse")se r2 nostar
esttab using TotalesTabla3.rtf, label nonumbers title (Tabla 3: Elasticidad de salarios respecto al desempleo por tipo de trabajador) mtitles ("Total" "Total collapse")se r2 nostar


cd "D:\ECONOMETRIA II\Base de datos STATA"
use "Unidad Individual - Pool Cross Section.dta", clear
preserve 

*tabla 4*
*egen periodo = anycount(year), values (2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014)*
egen periodo1 = anymatch(year), values (2003 2004 2005)
egen periodo2 = anymatch(year), values (2006 2007 2008)
egen periodo3 = anymatch(year), values (2009 2010 2011)
egen periodo4 = anymatch(year), values (2012 2013 2014)

*Periodo A 2003-2005*
*all*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if periodo1==1
*men vs women*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==1 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==0 & periodo1==1
*single vs married*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==1 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==0 & periodo1==1
*age*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age<30 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>29 & age<45 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>44 & periodo1==1
*education*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu<12 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>11 & educ<16 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>15 & periodo1==1
*region*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg0==1 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg1==1 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg2==1 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg3==1 & periodo1==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg4==1 & periodo1==1

esttab, label nonumbers title (Tabla 4: Elasticidades de la curva de salario estimada por tipo de trabajador y sector para Argentina) mtitles ("Todo" "Mujer" "Hombre" "Soltero" "Casado" "Edad 16-29" "Edad 30-44" "Edad>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar
esttab using tablaIVa.rtf, label nonumbers title (Tabla 4: Elasticidades de la curva de salario estimada por tipo de trabajador y sector para Argentina) mtitles ("Todo" "Mujer" "Hombre" "Soltero" "Casado" "Edad 16-29" "Edad 30-44" "Edad>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar replace


*Periodo B 2006-2008*
*all*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if periodo2==1
*men vs women*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==1 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==0 & periodo2==1
*single vs married*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==1 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==0 & periodo2==1
*age*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age<30 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>29 & age<45 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>44 & periodo2==1
*education*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu<12 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>11 & educ<16 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>15 & periodo2==1
*region*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg0==1 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg1==1 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg2==1 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg3==1 & periodo2==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg4==1 & periodo2==1

esttab, label nonumbers title (Tabla 4: Elasticidades de la curva de salario estimada por tipo de trabajador y sector para Argentina) mtitles ("Todo" "Mujer" "Hombre" "Soltero" "Casado" "Edad 16-29" "Edad 30-44" "Edad>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar
esttab using tablaIVb.rtf, label nonumbers title (Tabla 4: Elasticidades de la curva de salario estimada por tipo de trabajador y sector para Argentina) mtitles ("Todo" "Mujer" "Hombre" "Soltero" "Casado" "Edad 16-29" "Edad 30-44" "Edad>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar replace


*Periodo C 2009-2011*
*all*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if periodo3==1
*men vs women*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==1 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==0 & periodo3==1
*single vs married*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==1 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==0 & periodo3==1
*age*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age<30 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>29 & age<45 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>44 & periodo3==1
*education*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu<12 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>11 & educ<16 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>15 & periodo3==1
*region*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg0==1 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg1==1 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg2==1 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg3==1 & periodo3==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg4==1 & periodo3==1

esttab, label nonumbers title (Tabla 4: Elasticidades de la curva de salario estimada por tipo de trabajador y sector para Argentina) mtitles ("Todo" "Mujer" "Hombre" "Soltero" "Casado" "Edad 16-29" "Edad 30-44" "Edad>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar
esttab using tablaIVc.rtf, label nonumbers title (Tabla 4: Elasticidades de la curva de salario estimada por tipo de trabajador y sector para Argentina) mtitles ("Todo" "Mujer" "Hombre" "Soltero" "Casado" "Edad 16-29" "Edad 30-44" "Edad>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar replace


*periodo D 2012-2014*
*all*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if periodo4==1
*men vs women*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==1 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if fem==0 & periodo4==1
*single vs married*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==1 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if single==0 & periodo4==1
*age*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age<30 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>29 & age<45 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if age>44 & periodo4==1
*education*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu<12 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>11 & educ<16 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if edu>15 & periodo4==1
*region*
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg0==1 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg1==1 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg2==1 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg3==1 & periodo4==1
eststo: regress lw lu educ exper expersq age fem single i.region i.year if reg4==1 & periodo4==1

esttab, label nonumbers title (Tabla 4: Elasticidades de la curva de salario estimada por tipo de trabajador y sector para Argentina) mtitles ("Todo" "Mujer" "Hombre" "Soltero" "Casado" "Edad 16-29" "Edad 30-44" "Edad>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar
esttab using tablaIVd.rtf, label nonumbers title (Tabla 4: Elasticidades de la curva de salario estimada por tipo de trabajador y sector para Argentina) mtitles ("Todo" "Mujer" "Hombre" "Soltero" "Casado" "Edad 16-29" "Edad 30-44" "Edad>45" "Educ<12" "Educ 12-15" "Educ +16" "NOA" "NEA" "Cuyo" "Pampeana" "Patagonica")se r2 nostar replace
