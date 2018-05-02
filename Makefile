%.rtf: ../%.rmd
	echo "rmarkdown::render(\"$<\")" | R --slave

notes/%.html: ../notes/%.rmd
	echo "rmarkdown::render(\"$<\",output_format='html_document',output_dir='notes')" | R --slave

notes/%.pdf: ../notes/%.rmd
	echo "rmarkdown::render(\"$<\",output_format='tufte_handout',output_dir='notes')" | R --slave
