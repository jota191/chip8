test1: testsdl_1.ml
	ocamlfind ocamlopt -o testsdl_1 -linkpkg -package sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf testsdl_1.ml

testdisplay:
	ocamlfind ocamlopt -o testdisplay -linkpkg -package sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf tst_display.ml src/display.ml

all: test1, testdisplay
