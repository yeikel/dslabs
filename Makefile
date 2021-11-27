.PHONY: all build serve clean

all: build

build: javadoc/
	bundle exec jekyll build

serve: javadoc/
	watchy -w _config.yml -- bundle exec jekyll serve --watch --drafts --host=0.0.0.0

javadoc/:
	$(eval TMPDIR := $(shell mktemp -d))
	git clone "https://github.com/emichael/dslabs" $(TMPDIR)
	cd $(TMPDIR) && make build/doc/
	cp -r $(TMPDIR)/build/doc/ $@
	rm -rf $(TMPDIR)

clean:
	rm -rf _site/ .jekyll-cache/ javadoc/
