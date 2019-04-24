----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2019 12:17:55
-- Design Name: 
-- Module Name: Contador hexbin - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Contador_hexbin is
Port (
    manager : in STD_LOGIC; -- boton para contar o detenerse
    esHex: in STD_LOGIC; -- switch para cambiar a binario o hexadecimal
    reset: in STD_LOGIC; -- boton para detener y reiniciar el contador.
--    timer: in STD_LOGIC;
    
    display : out STD_LOGIC_VECTOR (3 downto 0); -- indica en que display se mostrarà el nùmero
    led : out STD_LOGIC_VECTOR (6 downto 0); -- indica que leds del display se encienden
    indicador : out STD_LOGIC_VECTOR(1 downto 0); -- indicador de que opciòn del botòn manager està activa
    -- contar 01, detenerse 10 y reset 00
    esHexIndicator : out STD_LOGIC -- Led que ve si esta activado el switch para cambiar numeracion
);
end Contador_hexbin;

architecture Behavioral of Contador_hexbin is

    constant clockPer : time := 100 ms; -- periodo
--    signal periodo : integer := 19;
--    signal vector : std_logic_vector(19 downto 0) := (others => '0');
    signal timer : std_logic := '0'; -- señal de reloj
    
    -- digitos independientes
    signal numeroD1 : integer := 0;
    signal numeroD2 : integer := 0;
    signal numeroD3 : integer := 0;
    signal numeroD4 : integer := 0;
    
    
    signal contando : std_logic := '1'; -- variable que ve si està contando o detenido
    signal numeracionAct : std_logic; -- variable que indica si es decimal o hexadecimal, y cambia solo si el contador està e

begin

timer <= not timer after clockPer; -- la señal cambia cada 100 ms
--process (timer, reset) is
--    begin
--        if (reset = '1') then
--            vector <= (others => '0');
--        elsif (rising_edge(timer)) then
--            vector <= vector + 1;
--        end if;
--    end process;

--process (reset) is
--    begin
        
--    end process;

--process (manager, reset) is
--    begin
        
--    end process;    

process (esHex) is
    begin
    -- Cambio entre numeraciòn decimal y hexadecimal (cambia solo si los nùmeros de los contadores son 0
        if (esHex = '1') then
            if (numeroD1 = 0 and numeroD2 = 0 and numeroD3 = 0 and numeroD4 = 0) then
                numeracionAct <= '1'; -- 1 es hexadecimal
                esHexIndicator <= '1';
            end if;
        else
            if (numeroD1 = 0 and numeroD2 = 0 and numeroD3 = 0 and numeroD4 = 0) then
                numeracionAct <= '0'; -- 0 es decimal
                esHexIndicator <= '0';
            end if;
        end if;
    end process;

process (timer, manager, reset) is
    begin
--        if (reset = '1') then
--            contando <= '0';
--        elsif (manager = '1') then
--            if (contando = '1') then
--                contando <= '0'; -- se detiene;
--                indicador <= "10";
--            else
--                contando <= '1'; -- cuenta
--                indicador <= "01";
--            end if;
--        end if;
        -- cada tic del timer
        if (rising_edge(timer) and contando = '1') then
            if (numeracionAct = '1') then -- verifica si la nùmeraciòn es hexadecimal
                if (numeroD1 = 15) then --como es decimal, si el numero es 15 corresponde a F (es el mayor nùmero en hex)
                    numeroD1 <= 0; -- lo regresa a 0
                    numeroD2 <= numeroD2 + 1; --aumenta 1 al siguiente digito
                    -- Hace lo anterior con todas las otras variables
                    if (numeroD2 = 15) then
                        numeroD2 <= 0;
                        numeroD3 <= numeroD3 + 1;
                        if (numeroD3 = 15) then
                            numeroD3 <= 0;
                            numeroD4 <= numeroD4 + 1;
                            -- luego de verificar todos, si todos son F regresa a 0 y detiene el contador
                            if (numeroD4 = 15 and numeroD3 = 15 and numeroD2 = 15 and numeroD1 = 15) then
                                --Cuando se termine la cuenta se detiene
                                contando <= '0';
                                numeroD1 <= 0;
                                numeroD2 <= 0;
                                numeroD3 <= 0;
                                numeroD4 <= 0;
                                contando <= '0';
                            end if;
                        end if;
                    end if;
                else
                    numeroD1 <= numeroD1 + 1;
                end if;
            else -- sino es decimal
                if (numeroD1 = 9) then -- 9 es el numero mayor para cada digito en decimal, cuando el digito es 9
                    numeroD1 <= 0; -- regresa a 1
                    numeroD2 <= numeroD2 + 1; -- aumenta 1 al siguiente digito
                    if (numeroD2 = 9) then -- hace lo mismo con los siguientes digitos 
                        numeroD2 <= 0;
                        numeroD3 <= numeroD3 + 1;
                        if (numeroD3 = 9) then
                            numeroD3 <= 0;
                            numeroD4 <= numeroD4 + 1;
                            if (numeroD4 = 9 and numeroD3 = 9 and numeroD2 = 9 and numeroD1 = 9) then -- cuando todos sean 9999 se regresa a 0 y se detiene el conteo
                                --Cuando se termine la cuenta se detiene
                                contando <= '0';
                                numeroD1 <= 0;
                                numeroD2 <= 0;
                                numeroD3 <= 0;
                                numeroD4 <= 0;
                                contando <= '0';
                            end if;
                        end if;
                    end if;
                else
                    numeroD1 <= numeroD1 + 1;
                end if;
            end if;
        end if;
        display <= "0000";
        case numeroD1 is
            when 0 =>  led <= "0000001"; -- 0
            when 1 =>  led <= "1001111"; -- 1
            when 2 =>  led <= "0010010"; -- 2
            when 3 =>  led <= "0000110"; -- 3
            when 4 =>  led <= "1001100"; -- 4
            when 5 =>  led <= "0100100"; -- 5
            when 6 =>  led <= "1100000"; -- 6
            when 7 =>  led <= "0001111"; -- 7
            when 8 =>  led <= "0000000"; -- 8
            when 9 =>  led <= "0000100"; -- 9
            when 10 =>  led <= "0001000"; -- A
            when 11 =>  led <= "1100000"; -- B
            when 12 =>  led <= "0110001"; -- C
            when 13 =>  led <= "1000010"; -- D
            when 14 =>  led <= "0110000"; -- E
            when 15 =>  led <= "0111000"; -- F
            when others => led <= "1111111";
        end case;
    end process;
    
    

end Behavioral;
