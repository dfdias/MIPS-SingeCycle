library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;



entity registers_tb is
end;

architecture TB of registers_tb is
signal s_clk   : std_logic;


signal s_RegWrite			: std_logic;  --control bit defines the data direction on the register

signal s_data_1_adrr		: std_logic_vector(4 downto 0);
signal s_data_2_adrr		: std_logic_vector(4 downto 0);
signal s_write_adrr			: std_logic_vector(4 downto 0);	

signal s_write_data			: std_logic_vector(31 downto 0);

signal s_data_1				: std_logic_vector(31 downto 0);
signal s_data_2				: std_logic_vector(31 downto 0);

begin

	uut: entity work.registers(RTL)
	port map(
		clk       	  => s_clk,
		RegWrite 	  => s_RegWrite,
		data_1_adrr   => s_data_1_adrr,
		data_2_adrr   => s_data_2_adrr,
		write_adrr    => s_write_adrr,
		write_data    => s_write_data,
		data_1        => s_data_1,
	    data_2        => s_data_2
	);

	process
	begin
		s_clk <= '1'; wait for 10 ns;
		s_clk <= '0'; wait for 10 ns;
	end process;

	process
	begin
		s_RegWrite <= '1';
		s_write_adrr <= "00010";
		s_write_data <= X"01100100";

		wait for 100 ns;

		s_RegWrite <= '0';
		wait for 25 ns;
        s_RegWrite <= '0';
        s_data_1_adrr <= "00010";
        s_data_2_adrr <= "00011";
        
		wait for 50 ns;
		s_RegWrite <= '1';
		s_write_adrr <= "00011";
		s_write_data <= X"01100110";

		wait for 25 ns;
		s_RegWrite <= '0';
		s_data_1_adrr <= "00010";
		s_data_2_adrr <= "00011";
		
		wait;
	end process;

end;
