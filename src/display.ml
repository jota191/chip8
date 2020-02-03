type pixel_st = On | Off

(* A module for the chip8 display *)
module type DISPLAY =
  sig
    type display
    type screen = Sdlvideo.surface
    val init     : int -> int ->  display
    val set_pix  : display -> int -> int -> pixel_st -> unit
    val draw     : display -> screen -> unit
    val draw_pix : int -> int -> pixel_st -> screen -> unit
    val pixel_size : int
    val white : Sdlvideo.surface
    val black : Sdlvideo.surface
  end;;

(* Recall, chip8 coords are organised as:
 * (0,0)	(63,0)
 * (0,31)	(63,31) *)

module Display : DISPLAY =
  struct
    type display = pixel_st array array

    type screen = Sdlvideo.surface

    let pixel_size  = 16
    let white = Sdlloader.load_image "../resources/white.jpg"
    let black = Sdlloader.load_image "../resources/black.jpg"

    let init r c = Array.make_matrix r c Off

    let set_pix dis i j pix
      = dis.(i).(j) <- pix

    let draw_pix i j pix screen =
      let position_of_pix = Sdlvideo.rect (j * pixel_size) (i* pixel_size)
          pixel_size       pixel_size in
      match pix with
      | On  -> Sdlvideo.blit_surface
                 ~dst_rect:position_of_pix ~src:white ~dst:screen ();
      | Off -> Sdlvideo.blit_surface
                 ~dst_rect:position_of_pix ~src:black ~dst:screen ();;

    let draw dis scr =
      let rows = Array.length dis in
      let cols = Array.length (dis.(0)) in
      for r = 0 to rows-1 do
        for c = 0 to cols-1 do
          draw_pix r c dis.(r).(c) scr
        done
      done;
      Sdlvideo.flip scr;;
  end;;
