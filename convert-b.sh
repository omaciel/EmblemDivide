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
ebook-convert tmp/html.html tmp/output.epub --asciiize --change-justification justify --chapter "//*[((name()='h1' or name()='h2'))]" --chapter-mark pagebreak  --cover cover.jpg --dont-split-on-page-breaks --enable-heuristics --level1-toc "//*[((name()='h1'))]" --level2-toc "//*[((name()='h2'))]" --page-breaks-before "//*[name()='h1' or name()='h2']" --remove-paragraph-spacing --remove-paragraph-spacing-indent-size 1.5 --authors "Peter Savage" --series Emblem --title "Emblem Divide" --series-index 1 --comments "The lecturer began commenting. \"Oken Brown. He looks harmless enough but he was one of the most ruthless criminals ever to have graced God's earth.\" Suddenly Zane became interested. \"He developed the first hand held temporal weapon, and used it in an underground fighting arena only twenty years ago.\" <br><br> It wasn't as if Oken hadn't killed before, he was an elite member of an underground culture. He was almost like an ambassador of death. Oken was one of the best, but even he shuddered at this new weapon which threatened the very existence of everyone on the planet."&
ebook-convert tmp/html.html tmp/output.mobi --asciiize False --change-justification justify --chapter "//*[((name()='h1' or name()='h2'))]" --chapter-mark pagebreak  --cover cover.jpg --enable-heuristics True --level1-toc "//*[((name()='h1'))]" --level2-toc "//*[((name()='h2'))]" --page-breaks-before "//*[name()='h1' or name()='h2']" --remove-paragraph-spacing True --remove-paragraph-spacing-indent-size 1.5 --authors "Peter Savage" --series Alchemy --title "Alchemy Reigns" --series-index 1 --comments "In a world where tension and fear reign, who can you trust? A selection of the worlds population have developed the ability to call forth alchemic elements. They can conjure up water, electricity, fire. They can bend metal and whittle wood with their minds. <br><br>When a group of these so called Alchemists breaks away and begins using technology and powering it with their alchemic abilities, the rest of the Alchemist faction decide to shun them and a rift is created, forcing the human race into three distinct factions. With neither one having the upper hand and with tensions rising, just what can happening such an unstable world?"&
