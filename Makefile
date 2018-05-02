%.html: %.rmd
	echo "rmarkdown::render(\"$<\",output_format='html_document')" | R --slave

##%.pdf: %.rmd
##n	echo "rmarkdown::render(\"$<\",output_format='tufte_handout')" | R --slave

notes = $(wildcard notes/*.rmd)
notepages = $(notes:%.rmd=gh-pages/%.html)

pushnotes: $(notepages)
