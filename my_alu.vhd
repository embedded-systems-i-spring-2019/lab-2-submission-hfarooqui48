----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2019 08:34:00 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
  Port (A, B, opcode: in std_logic_vector(3 downto 0);
        alu_out: out std_logic_vector(3 downto 0));
end my_alu;

architecture Behavioral of my_alu is
begin
  process(A,B,opcode)
  begin
  case opcode is
   when "0000" =>
   alu_out <= std_logic_vector(unsigned(A) + unsigned(B)); 
   when "0001" =>
   alu_out <= std_logic_vector(unsigned(A) - unsigned(B));
   when "0010" =>
   alu_out <= std_logic_vector(unsigned(A) + 1);
   when "0011" =>
   alu_out <= std_logic_vector(unsigned(A) - 1);
   when "0100" =>
   alu_out <= std_logic_vector(0 - unsigned(A));
   when "0101" =>
   if A > B then
   alu_out <= "0001";
   else
   alu_out <= "0000";
   end if;
   when "0110" =>
   alu_out <= A(2 downto 0) & "0";
   when "0111" =>
   alu_out <= "0" & A(3 downto 1);
   when "1000" =>
   alu_out <=  A(3) & A(3 downto 1);
   when "1001" =>
   alu_out <= not a; 
   when "1010" =>
   alu_out <= a and b;
   when "1011" =>
   alu_out <= a or b;  
   when "1100" =>
   alu_out <= a xor b;  
   when "1101" =>
   alu_out <= a xnor b;
   when "1110" =>
   alu_out <= a nand b;  
   when "1111" =>
   alu_out <= a nor b;
   when others => alu_out <= (others => '0');
   end case;    
   end process;
end Behavioral;
