GIT_BUILDPACKAGE = /usr/lib/python3/dist-packages/gbp/scripts

build:

install:
	mkdir -p "$(DESTDIR)/$(GIT_BUILDPACKAGE)"
	install -m 755 "scripts/deepin_changelog.py" "$(DESTDIR)/$(GIT_BUILDPACKAGE)"

# vi: ts=4 noexpandtab syntax=make
