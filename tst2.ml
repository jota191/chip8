open Display


let run () =
  let screen = Sdlvideo.set_video_mode (pixel_size * 64)
                                       (pixel_size * 32) [`DOUBLEBUF] in
  let framebuff= Display.init 32 64 in

  set_pix framebuff 0 0 On;draw framebuff screen; Sdltimer.delay 1000;
  set_pix framebuff 0 1 On;draw framebuff screen; Sdltimer.delay 1000;
  set_pix framebuff 0 2 On;draw framebuff screen; Sdltimer.delay 1000;
  set_pix framebuff 1 2 On;draw framebuff screen; Sdltimer.delay 1000;
  set_pix framebuff 2 2 On;draw framebuff screen; Sdltimer.delay 1000;
  set_pix framebuff 2 3 On;draw framebuff screen; Sdltimer.delay 1000;

  draw framebuff screen; Sdltimer.delay 1000;
  set_pix framebuff 11 5 On;
  draw framebuff screen;
  Sdltimer.delay 1000;;

let main () =
    Sdl.init [`VIDEO; `AUDIO];
    at_exit Sdl.quit;
    Sdlttf.init ();
    at_exit Sdlttf.quit;
    Sdlmixer.open_audio ();
    at_exit Sdlmixer.close_audio;
    run ()

let _ = main ()
