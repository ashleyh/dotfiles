${HOME}/.less: lesskey
	lesskey lesskey

layouts=${HOME}/Library/Keyboard Layouts
layout=reallypc.keylayout

.PHONY: install-layout
install-layout: ${layout}
	mkdir -p "${layouts}"
	cp "${layout}" "${layouts}"
