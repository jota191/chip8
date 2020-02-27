type address = (hex, hex, hex)


(** Algebraic datatype, an abstract assembly *)
type opcode =
  (* FLOW *)
  
  | Call_RCA_1802 of address
  (** Calls a program at address, not used in most roms according to
     wiki so this case won't be implemented in the short term, 0NNN *)
  | Return
  (** Returns from a subroutine, 00EE *)
  | Goto of address
  (** unconditional jump, 1NNN *)
  | Call of address
  | Clear
  (** Clear screen, 00E0 *)
