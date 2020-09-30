
view: dto.svg
	xdg-open $<

dto.svg: dto.dot
	dot -Tsvg $< -o $@

dto.dot: dto.ksy
	kaitai-struct-compiler $< -t graphviz

.PHONY: view
