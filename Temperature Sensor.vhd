library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TemperatureSensor is
  port (
    clk      : in  std_logic;
    reset    : in  std_logic;
    temperature : out std_logic_vector(7 downto 0)
  );
end TemperatureSensor;

architecture Behavioral of TemperatureSensor is
  signal temperature_reg   : std_logic_vector(7 downto 0);
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        temperature_reg <= (others => '0');  -- Inicializar la temperatura en cero
      else
        -- Simulación de lectura de temperatura
        temperature_reg <= std_logic_vector(to_unsigned(simulateTemperature(), 8));
      end if;
    end if;
  end process;

  temperature <= temperature_reg;
end Behavioral;

-- Función de simulación de temperatura
function simulateTemperature return natural is
  variable temp : natural := 25;  -- Temperatura inicial de simulación
begin
  -- Código de simulación de temperatura
  -- Aquí puedes implementar la lógica para generar una temperatura simulada
  -- Puede ser un cálculo aleatorio o basado en algún modelo o algoritmo específico

  -- Ejemplo: Simulación de temperatura aleatoria entre 20 y 30 grados Celsius
  temp := temp + natural(random_number(10) - 5);  -- Variación aleatoria entre -5 y 5 grados
  if temp < 20 then
    temp := 20;
  elsif temp > 30 then
    temp := 30;
  end if;

  return temp;
end simulateTemperature;