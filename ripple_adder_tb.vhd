----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 09:55:55 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

library ieee;
use ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ripple_Adder_tb is
end Ripple_Adder_tb;

architecture Behavioral of Ripple_Adder_tb is

component Ripple_Adder
port(
A : in std_logic_vector(3 downto 0);
B : in std_logic_vector(3 downto 0);
S : out std_logic_vector(3 downto 0));
end component;

signal A : std_logic_vector(3 downto 0) := (others => '0');
signal B : std_logic_vector(3 downto 0) := (others => '0');
signal S : std_logic_vector(3 downto 0);

begin 
ra: ripple_adder 
port map (
A => A,
B => B,
S => S);
stim_proc: process
begin

wait for 50 ns;
A <= "0110";
B <= "1100";

wait for 50 ns;
A <= "1111";
B <= "1100"; 

wait for 50 ns;
A <= "0110";
B <= "0111";

wait for 50 ns;
A <= "0110";
B <= "1110";

wait for 50 ns;
A <= "1111";
B <= "1111";
wait;
end process;
end Behavioral;