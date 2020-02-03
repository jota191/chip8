let image_filename = "../resources/img.jpg"
let font_filename  = "../resources/font.ttf"
let music_filename = "../resources/music.mp3"

let run () =
    let screen = Sdlvideo.set_video_mode 400 400 [`DOUBLEBUF] in
    let image = Sdlloader.load_image image_filename in
    let font = Sdlttf.open_font font_filename 24 in
    let text = Sdlttf.render_text_blended font "Enjoy!" ~fg:Sdlvideo.white in
    let music = Sdlmixer.load_music music_filename in
    let position_of_image = Sdlvideo.rect 0 0 300 300 in
    let position_of_text = Sdlvideo.rect 300 0 300 300 in
    Sdlvideo.blit_surface ~dst_rect:position_of_image ~src:image ~dst:screen ();
    Sdlvideo.blit_surface ~dst_rect:position_of_text ~src:text ~dst:screen ();
    Sdlvideo.flip screen;
    Sdlmixer.fadein_music music 1.0;
    Sdltimer.delay 1000; (* fade in *)
    Sdltimer.delay 6000; (* play *)
    Sdlmixer.fadeout_music 2.0;
    Sdltimer.delay 2000; (* fade out *)
    Sdlmixer.halt_music ();
    Sdlmixer.free_music music

let main () =
    Sdl.init [`VIDEO; `AUDIO];
    at_exit Sdl.quit;
    Sdlttf.init ();
    at_exit Sdlttf.quit;
    Sdlmixer.open_audio ();
    at_exit Sdlmixer.close_audio;
    run ()

let _ = main ()
