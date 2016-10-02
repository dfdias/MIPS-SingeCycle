library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc is
generic(k :integer :=5);
port(
	addr_in : 	in	std_logic_vector(k downto 0);


	addr_out :	out	std_logic_vector(k downto 0)
	);

end pc;

architecture b of pc is
begin
	addr_out <= addr_in;

end b;
