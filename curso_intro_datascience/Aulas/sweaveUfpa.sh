cnr=$1
vr=$2

R CMD Sweave --encoding=utf8 UFPA_Curso_Presentation_"$cnr"_"$vr"_2019.Rnw

pdflatex UFPA_Curso_Presentation_"$cnr"_"$vr"_2019.tex