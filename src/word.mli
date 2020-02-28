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


module Address : WORD with type t = int
module Byte    : WORD with type t = int
module Digit   : WORD with type t = int
