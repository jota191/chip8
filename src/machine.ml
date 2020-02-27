type hex = int

and address = Address of hex * hex * hex

and register = Reg of hex

(** Algebraic datatype, an abstract assembly *)
and opcode =
  | SYS of address
  (** Calls a program at address, not used in most roms according to
     wiki so this case won't be implemented in the short term, 0NNN *)
  | RET
  (** Returns from a subroutine, 00EE *)
  | JP of address
  (** unconditional jump, 1NNN *)
  | CALL of address
  (** Calls a subroutine at address, 2NNN *)
  | CLS
  (** Clear screen, 00E0 *)
  | SE of register * hex * hex
