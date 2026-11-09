DEST=
SRC=
DT=`date`
NAME=S-131_Marine_Harbour_Infrastructure_Product_Specification_Ed_2.0.0.pdf

all:	pull local

dceg:   pull dcegdoc

pull:
	git pull
	
local:
	DT=`date`
	echo $(DT) " is the date"
	cd sources && metanorma compile document.adoc -o build
	cp sources/build/document.pdf ../../${NAME}
	git commit -a -m "Build $(DT)"
	git push

tst:
	echo $(DT)
	echo $(DT) " is the date"
