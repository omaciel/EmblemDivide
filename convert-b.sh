#!/bin/bash
mkdir tmp
cat chap*.tex > tmp/combine.tex
cp ack.tex tmp/ack.tex
cp gitt-templ.tex tmp/gitt-templ.tex
cp Makefile tmp/Makefile
cp gitt.cls tmp/gitt.cls
cp intro.tex tmp/intro.tex
python converter3.py
cd tmp
make print&
cd ..
ebook-convert tmp/html.html tmp/output.epub --asciiize False --change-justification justify --chapter "//*[((name()='h1' or name()='h2'))]" --chapter-mark pagebreak  --cover cover.jpg --dont-split-on-page-breaks True --enable-heuristics True --level1-toc "//*[((name()='h1'))]" --level2-toc "//*[((name()='h2'))]" --page-breaks-before "//*[name()='h1' or name()='h2']" --remove-paragraph-spacing True --remove-paragraph-spacing-indent-size 1.5 --authors "Peter Savage" --series Alchemy --title "Alchemy Reigns" --series-index 1 --comments "In a world where tension and fear reign, who can you trust? A selection of the worlds population have developed the ability to call forth alchemic elements. They can conjure up water, electricity, fire. They can bend metal and whittle wood with their minds. <br><br>When a group of these so called Alchemists breaks away and begins using technology and powering it with their alchemic abilities, the rest of the Alchemist faction decide to shun them and a rift is created, forcing the human race into three distinct factions. With neither one having the upper hand and with tensions rising, just what can happening such an unstable world?"&
ebook-convert tmp/html.html tmp/output.mobi --asciiize False --change-justification justify --chapter "//*[((name()='h1' or name()='h2'))]" --chapter-mark pagebreak  --cover cover.jpg --enable-heuristics True --level1-toc "//*[((name()='h1'))]" --level2-toc "//*[((name()='h2'))]" --page-breaks-before "//*[name()='h1' or name()='h2']" --remove-paragraph-spacing True --remove-paragraph-spacing-indent-size 1.5 --authors "Peter Savage" --series Alchemy --title "Alchemy Reigns" --series-index 1 --comments "In a world where tension and fear reign, who can you trust? A selection of the worlds population have developed the ability to call forth alchemic elements. They can conjure up water, electricity, fire. They can bend metal and whittle wood with their minds. <br><br>When a group of these so called Alchemists breaks away and begins using technology and powering it with their alchemic abilities, the rest of the Alchemist faction decide to shun them and a rift is created, forcing the human race into three distinct factions. With neither one having the upper hand and with tensions rising, just what can happening such an unstable world?"&
