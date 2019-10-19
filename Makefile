test1: testsdl_1.ml
	ocamlfind ocamlopt -o testsdl_1 -linkpkg   -package sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf   testsdl_1.ml

test2: tst2.ml
	ocamlfind ocamlopt -o test2 -linkpkg   -package sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf tst2.ml

all: test1, test2
