cnr=$1
vr=$2

#Rscript -e "library(knitr); knit('BP_Curso_Presentation_"$cnr"_"$vr"_2019.Rnw')"
R CMD Sweave BP_Curso_Presentation_"$cnr"_"$vr"_2019.Rnw

pdflatex BP_Curso_Presentation_"$cnr"_"$vr"_2019.tex
