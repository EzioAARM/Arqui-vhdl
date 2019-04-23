----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2019 10:25:03
-- Design Name: 
-- Module Name: Contador - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Contador is
    Port (
        Display : out STD_LOGIC_VECTOR (3 downto 0);
        led : out STD_LOGIC_VECTOR (6 downto 0);
        timer : in STD_LOGIC;
        reset : in STD_LOGIC 
    );
end Contador;

architecture Behavioral of Contador is
signal contador: STD_LOGIC_VECTOR (27 downto 0);
signal activo: std_logic;
signal numero: STD_LOGIC_VECTOR (15 downto 0);
signal SDDisplay: STD_LOGIC_VECTOR (3 downto 0);
signal rfsh: STD_LOGIC_VECTOR (10 downto 0);
signal act: std_logic_vector(1 downto 0);
begin

process(SDDisplay, contador)
begin
    case SDDisplay is
    when "0000" => led <= "0000001"; -- 0     
    when "0001" => led <= "1001111"; -- 1 
    when "0010" => led <= "0010010"; -- 2 
    when "0011" => led <= "0000110"; -- 3 
    when "0100" => led <= "1001100"; -- 4 
    when "0101" => led <= "0100100"; -- 5 
    when "0110" => led <= "0100000"; -- 6 
    when "0111" => led <= "0001111"; -- 7 
    when "1000" => led <= "0000000"; -- 8     
    when "1001" => led <= "0000100"; -- 9 
    when others => led <= "0000100";
    end case;
end process;
process(timer,reset)
begin 
    if(reset='1') then
        rfsh <= (others => '0');
    elsif(rising_edge(timer)) then
        rfsh <= rfsh + 1;
    end if;
end process;
 act <= rfsh(10 downto 9);
process(act)
begin
    case act is
    when "00" =>
        Display <= "0111"; 
        SDDisplay <= numero(15 downto 12);
    when "01" =>
        Display <= "1011"; 
        SDDisplay <= numero(11 downto 8);
    when "10" =>
        Display <= "1101"; 
        SDDisplay <= numero(7 downto 4);
    when "11" =>
        Display <= "1110"; 
        SDDisplay <= numero(3 downto 0);

    end case;
end process;

process(timer, reset)
begin
        if(reset='1') then
            contador <= (others => '0');
        elsif(rising_edge(timer)) then
            if(contador>=x"5F5E0FF") then
                contador <= (others => '0');
            else
                case (SDDisplay) is
                    when "1010" => contador <= contador + "0000110";
                    when others => contador <= contador + "0000001";
                end case;
            end if;
        end if;
end process;
activo <= '1' when contador=x"5F5E0FF" else '0';
process(timer, reset)
begin
        if(reset='1') then
            numero <= (others => '0');
        elsif(rising_edge(timer)) then
             if(activo='1') then
                numero <= numero + x"0001";
             end if;
        end if;
end process;

end Behavioral;
