# --- Настройки ---
MAIN      = main
LATEXMK   = latexmk
LATEXMK_OPTS = -xelatex -interaction=nonstopmode -halt-on-error -synctex=1
PLANTUML_JAR = plantuml-mit-1.2026.8.jar
PLANTUML   = java -jar $(PLANTUML_JAR)

PUML_SRC  := $(wildcard plantuml/*.puml)
TEX_GEN   := $(PUML_SRC:.puml=.tex)

# --- Цели ---
.PHONY: all clean figures clean-all pdf

all: pdf

pdf: figures
	$(LATEXMK) $(LATEXMK_OPTS) $(MAIN)

figures: $(TEX_GEN)

plantuml/%.tex: plantuml/%.puml
	$(PLANTUML) -tlatex:nopreamble $<

clean:
	$(LATEXMK) -c $(MAIN)
	rm -f *.aux *.log *.toc *.out *.lof *.lot *.synctex.gz *.pytxcode missfont.log
	rm -f $(TEX_GEN)

clean-all: clean
	$(LATEXMK) -C $(MAIN)
	rm -f plantuml/*.png
