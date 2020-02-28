type hex = int

type address = Address of hex * hex * hex

type byte = Byte of hex * hex

type register = Reg of hex

(** Algebraic datatype, an abstract assembly *)
type opcode =
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
  (** skip next if vx = kk, 3XKK *)

  | SNE of register * hex * hex
  (** skip next if vx != kk, 4XKK *)

  | SE_r of register * register
  (** skip next if vx = vy, 5XY0 *)

  | LD of register * register
  (** set vx := vy, 8XY0 *)

  | OR of register * register
  (** set vx := xv | vy, 8XY1 *)

  | AND of register * register
  (** set vx := xv & vy, 8XY2 *)

  | XOR of register * register
  (** set vx := xv ^ vy, 8XY3 *)

  | ADD of register * register
  (** set vx := xv + vy, VF is carry , 8XY4 *)

  | SUB of register * register
  (** set vx := xv - vy, VF is NOT borrow , 8XY5 *)

  | SHR of register * register
  (** set vx := vx shr 1, VF is least significant bit, 8XY6 *)

  | SHL of register * register
  (** set vx := vx shl 1, VF is most significant bit, 8XYE -not in order- *)

  | SUBN of register * register
  (** set vx := vy - vx, if vy > vx VF:=1 otherwise 0, 8XY7 *)

  | SNE_r of register * register
  (** skip next if vx != vy, 9XY0 *)

  | LD_I of address
  (** I := nnn , ANNN, we set an address (12  bit), the lower 12 of the 16*)

  | JP_r of address
  (** jump to nnn+v0, BNNN *)

  | RND of register * byte
  (** set vx := rndbyte & kk, CXkk *)

  INCOMPLETO
  | DRW of register * register
  (** draw at (vx,vy) an N byte sprite at memory loc I, DXYN, pixels are xored,
     , VF is set if a collision is detected*)
