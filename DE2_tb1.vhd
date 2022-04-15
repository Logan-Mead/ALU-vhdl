-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity DE2_tb is
end;

architecture bench of DE2_tb is

  component DE2
      Port (Sel : in STD_LOGIC_VECTOR(2 downto 0);
            Cn : in unsigned(0 downto 0);
            A : in unsigned(3 downto 0);
            B : in unsigned(3 downto 0);                        
            F : out unsigned(3 downto 0);            
            Cout : out unsigned(0 downto 0)            
       );
  end component;
  
  signal Sel: STD_LOGIC_VECTOR(2 downto 0);
  signal Cn: unsigned(0 downto 0);
  signal A: unsigned(3 downto 0);
  signal B: unsigned(3 downto 0);
  signal F: unsigned(3 downto 0); 
  signal Cout: unsigned(0 downto 0);

begin

  uut: DE2 port map ( Sel  => Sel,
                      Cn   => Cn,
                      A    => A,
                      B    => B,  
                      F    => F,                   
                      Cout => Cout 
                      );

  stimulus: process
  begin
  
    -- Put initialisation code here    
        --clear statement
        Sel <= "000";
        A <= "0000";
        B <= "0000";
        Cn <= "0";
        wait for 100ns;
               
        --sub
        Sel <= "010";
        A <= "0000";
        B <= "0000";
        Cn <= "0";
        wait for 100ns;
        
        Sel <= "010";
        A <= "0000";
        B <= "1111";
        Cn <= "0";
        wait for 100ns;
        
        Sel <= "010";
        A <= "1111";
        B <= "0000";
        Cn <= "0";
        wait for 100ns;
        
        Sel <= "010";
        A <= "1111";
        B <= "1111";
        Cn <= "0";
        wait for 100ns;
        
        Sel <= "010";
        A <= "0000";
        B <= "0000";
        Cn <= "1";
        wait for 100ns;
        
        Sel <= "010";
        A <= "0000";
        B <= "1111";
        Cn <= "1";
        wait for 100ns;
        
        Sel <= "010";
        A <= "1111";
        B <= "0000";
        Cn <= "1";
        wait for 100ns;
        
        Sel <= "010";
        A <= "1111";
        B <= "1111";
        Cn <= "1";
        wait for 100ns;
        
    -- Put test bench stimulus code here
    wait;
  end process;
end;
  