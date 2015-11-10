# Woodstock-thesis
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: test.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk

Outside = ke5c.RData

##################################################################

## Content

Sources += $(wildcard *.R)

ke5c.Rout:
	touch $@

ke5c.summary.Routput:

test.Rout: ke5c.RData test.R
	$(run-R)

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
