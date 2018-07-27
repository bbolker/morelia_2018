SRCDIR=..

notes += modeling_inference glmm datavis bayes bayeslab mixed_details mixedlab

nnhtml := $(notes:%=notes/%.html)
nnrmd := $(notes:%=notes/%.rmd)

Datasets += aids.csv  Banta.RData  gopherdat2.csv culcitalogreg.csv gopherdat2.RData starling.RData culcita.RData gophertortoise.txt toenail.csv dufemalepers.csv tundra.csv Elston2001_tickdata.txt lizards.csv

dd := $(Datasets:%=data/%)

all: setup.html syllabus.html schedule.html ${nnhtml} ${nnrmd}

notes/%.rmd:  ${SRCDIR}/notes/%.[Rr]md
	cp $< $@

%.html: ${SRCDIR}/%.[Rr]md
	echo "rmarkdown::render(\"$<\",output_dir='.')" | R --slave

%.pdf: ${SRCDIR}/%.rmd
	echo "rmarkdown::render(\"$<\",output_dir='.',output_format=\"pdf_document\")" | R --slave

notes/%.html: ${SRCDIR}/notes/%.rmd
	echo "rmarkdown::render(\"$<\",output_format='html_document',output_dir='notes')" | R --slave

notes/%.pdf: ${SRCDIR}/notes/%.rmd
	echo "rmarkdown::render(\"$<\",output_format='tufte_handout',output_dir='notes')" | R --slave

glmm_data.zip: 
	cd ..; zip gh-pages/glmm_data.zip ${dd}

