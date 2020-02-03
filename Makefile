test_sdl: ./test/test_sdl.ml
	ocamlfind ocamlopt -o ./test/testsdl_1 -linkpkg -package sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf ./test/test_sdl.ml

test_display: ./test/test_display.ml src/display.ml
	ocamlfind ocamlopt -o ./test/test_display -linkpkg -package sdl,sdl.sdlimage,sdl.sdlmixer,sdl.sdlttf src/display.ml -I src/ ./test/test_display.ml

all: test_sdl, test_display
