RENDER_SIZES := (16 32 24 48 64 72 96 144 152 192 196 256)

SVGDIR 	:= svg
ICODIR 	:= ico
ICNSDIR := icns

SVGS 		:= $(SVGDIR)/*.svg
ICOS 		:= $(subst svg,ico,$(SVGS))
ICNSS 	:= $(subst svg,icns,$(SVGS))

$(ICODIR)/%.ico: $(SVGDIR)/%.svg
	./make-ico.sh $<

$(ICNSDIR)/%.icns: $(SVGDIR)/%.svg
	./make-icns.sh $<


all : $(ICOS) $(ICNSS)

$(ICOS): | $(ICODIR)

$(ICODIR):
	mkdir $(ICODIR)
