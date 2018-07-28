- notes!
     - ggplot: cut down, emphasize grouping
          colour vs group aesthetic vs path
          star geom?? geom_encircle
	  - inference etc.: modify.
      - add singing mouse data?


tidyverse???

incorporate stuff from uqam/mixed2.Rnw		  
          - contrasts
	      - Wald vs LRT
		  - Z vs t
		  - parametric bootstrap
		  - importance sample?
	 - overview: modify from gtar
	 - mixedlab: add GLMM example (ecochap?)

         Difference between 
     - Bayes: from QMEE? emdbook?
	      - probability basics
	      - prior defs and issues
		  - sampling: Metropolis-Hastings
		  - sampling: diagnostics
		  
     - extended mixed lab example

echo "abc geom_boxplot def" | sed -e 's/^.*\(geom_[a-z]\+\).*$/\1/g'
find . -follow -name "*.[Rr]" -exec grep geom_ {} \; |

echo "abc geom_boxplot geom_qq def" | grep -o 'geom_[a-z]\+'

find . -follow -name "*.[Rr]" -o -name "*.[Rr]md" -exec grep -o 'geom_[a-z]\+' {} \; | sort | uniq > all_geoms.txt

