----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2019 08:50:24 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder is
  Port (A, B: in std_logic_vector(3 downto 0);
        Y: out std_logic_vector(4 downto 0));
end ripple_adder;

architecture Behavioral of ripple_adder is
 
  component full_adder is
    port (
      A, B, Cin: in  std_logic;
      Y, Cout: out std_logic);
  end component full_adder;
 
  signal  carry: std_logic_vector(4 downto 0);
  signal sum: std_logic_vector(3 downto 0);
 
begin
 
  carry(0) <= '0';                    
   
  full_adder_1: full_adder
    port map (
      A  => A(0),
      B  => B(0),
      Cin => carry(0),
      Y => sum(0),
      Cout => carry(1)
      );
 
 full_adder_2: full_adder
    port map (
      A  => A(1),
      B  => B(1),
      Cin => carry(1),
      Y => sum(1),
      Cout => carry(1)
      ); 
  
  full_adder_3: full_adder
    port map (
      A  => A(2),
      B  => B(2),
      Cin => carry(2),
      Y => sum(2),
      Cout => carry(3)
      );
  
  full_adder_4: full_adder
    port map (
      A  => A(3),
      B  => B(3),
      Cin => carry(3),
      Y => sum(3),
      Cout => carry(4)
      );
 
  Y <= carry(3) & sum;
  
end Behavioral;
