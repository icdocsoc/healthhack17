PUG=pug
INCLUDES=$(wildcard _*.pug)
PAGES=$(patsubst %.pug,%.html,$(wildcard [^_]*.pug))

all: $(PAGES)

watch:
	while true; do \
		clear; \
		make -s; \
		inotifywait -qre close_write .; \
		done

release: webpages.tgz

webpages.tgz: all
	tar -cvzf $@ --transform 's,^,website/,' *.html css js

%.html: %.pug $(INCLUDES)
	$(PUG) $<

clean:
	rm *.html
