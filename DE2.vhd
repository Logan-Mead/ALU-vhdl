----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2022 04:08:58 PM
-- Design Name: 
-- Module Name: DE2 - Behavioral
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
--use IEEE.std_logic_arith.all;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DE2 is
    Port ( A : in unsigned(3 downto 0);
           B : in unsigned(3 downto 0);
           Sel : in STD_LOGIC_VECTOR(2 downto 0);
           Cn : in unsigned(0 downto 0);
           Cout : out unsigned(0 downto 0);
           F : out unsigned(3 downto 0)
     );
end DE2;

architecture Behavioral of DE2 is
signal temp : unsigned(4 downto 0) := "00000";

begin 
    process (A, B, Sel, Cn, temp)
        begin
        
            case(Sel) is
                when "000" =>                                                          --all off
                    F <= "0000";
                
                when "010" =>                                                          --subtraction
                    if(Cn = 0)then                                                     --if Cin is 1 sub A and B and 1
                        temp <= (((('0' & A) - ('0' & B)) - "00001"));
                        F <= temp(3 downto 0);
                        Cout(0) <= temp(4);                       
                    elsif(Cn = 1)then
                        temp <= (('0' & A) - ('0' & B));                               --if Cin is 0 sub A and B
                        F <= temp(3 downto 0);
                        Cout(0) <= temp(4);
                    end if;    
                                   
                when "011" =>                                                          --add
                        temp <= (('0' & A) + (('0' & B) + ('0' & Cn)));
                        F <= temp(3 downto 0);
                        Cout(0) <= temp(4);                   
                
                when "100" =>                                                          --xor
                    F <= A xor B;  
                
                when "101" =>                                                          --or
                    F <= A or B;
                  
                when "110" =>                                                          --and
                    F <= A and B;
                  
                when "111" =>                                                          --all on
                    F <= "1111"; 
                    
                when others => null;
                       
            end case;   
    end process;                                     
end Behavioral;
