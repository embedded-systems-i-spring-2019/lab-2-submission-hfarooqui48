----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2019 08:15:49 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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


entity full_adder is
  Port (A, B, Cin: in std_logic; 
        Y, Cout: out std_logic);
end full_adder;
 
architecture Behavioral of full_adder is

signal nor1_sig: std_logic;
signal and1_sig: std_logic;
signal and2_sig: std_logic;

begin

nor1_sig <= A nor B;
and1_sig <= nor1_sig and Cin;
and2_sig <= A and B;
Y <= Cin nor nor1_sig;
Cout <= and1_sig or and2_sig;
 
end Behavioral;
