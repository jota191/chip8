module type WORD = sig
  type t
  val from_int  : int -> t
  val (++)      : t -> t -> t
  val (--)      : t -> t -> t
  val wxor      : t -> t -> t
  val wand      : t -> t -> t
  val wor       : t -> t -> t
  val max       : t
  val width     : int
end

module Address : WORD =
  struct
    type t = int
    let from_int n = n mod 4096
    let max   = 0xFFF
    let width = 12
    let (++) x y = (x + y) mod 4096
    let (--) x y = (x - y) mod 4096
    let wxor = (lxor)
    let wand = (land)
    let wor  = (lor)
  end;;

module Digit : WORD =
  struct
    type t = int
    let from_int n = n mod 16
    let max   = 0xF
    let width = 4
    let (++) x y = (x + y) mod 16
    let (--) x y = (x - y) mod 16
    let wxor = (lxor)
    let wand = (land)
    let wor  = (lor)
  end;;

module Byte : WORD =
  struct
    type t = int
    let from_int n = n mod 256
    let max   = 0xFF
    let width = 8
    let (++) x y = (x + y) mod 256
    let (--) x y = (x - y) mod 256
    let wxor = (lxor)
    let wand = (land)
    let wor  = (lor)
  end;;
