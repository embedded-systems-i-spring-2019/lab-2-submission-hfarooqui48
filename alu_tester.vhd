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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_tester is
    port(
        btn,sw : in std_logic_vector(3 downto 0);
        clk    : in std_logic;
        led    : out std_logic_vector(3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is

    component my_alu is
        port(
            a,b,opcode : in std_logic_vector(3 downto 0);
            alu_out    : out std_logic_vector(3 downto 0)
        );
    end component;
    
    component debounce is
        port(
            clk     : in  std_logic;  
            btn  	: in  std_logic;  
            dbnc 	: out std_logic); 
    end component;
    
    signal a1      : std_logic_vector(3 downto 0) := (others => '0');
    signal b1      : std_logic_vector(3 downto 0) := (others => '0');
    signal opcode1 : std_logic_vector(3 downto 0) := (others => '0');
    signal alu_out_1 : std_logic_vector(3 downto 0) := (others => '0');
    signal dbnc_sig1: std_logic; 
    signal dbnc_sig2: std_logic; 
    signal dbnc_sig3: std_logic;
    signal dbnc_sig4: std_logic;

begin         
    process (clk) 
    begin
         if rising_edge(clk) then
            if dbnc_sig4 = '1' then
                a1 <= "0000";
                b1 <= "0000";
                opcode1 <= "0000";
            else
                if dbnc_sig3 = '1' then
                    opcode1 <= sw;
                end if;
                if dbnc_sig2 = '1' then
                    a1 <= sw;
                end if;
                if dbnc_sig1 = '1' then
                    b1 <= sw;
                end if;
            end if;
            led <= alu_out_1;
         end if;
    end process;

alu: my_alu
    port map ( a => a1,
               b => b1,
               opcode => opcode1,
               alu_out => alu_out_1);

    dbnc1: debounce
    port map(clk => clk,
             dbnc => dbnc_sig1,
             btn => btn(0));

    dbnc2: debounce
    port map(clk => clk,
             dbnc => dbnc_sig2,
             btn => btn(1));

    dbnc3: debounce
    port map(clk => clk,
             dbnc => dbnc_sig3,
             btn => btn(2));

    dbnc4: debounce
    port map(clk => clk,
             dbnc => dbnc_sig4,
             btn => btn(3));
end Behavioral;