library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TemperatureSensor is
  port (
    clk         : in  std_logic;
    reset       : in  std_logic;
    temperature : out std_logic_vector(7 downto 0)
  );
end TemperatureSensor;

architecture Behavioral of TemperatureSensor is
  signal temperature_reg : std_logic_vector(7 downto 0);
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        temperature_reg <= (others => '0');  -- Initialize temperature to zero
      else
        -- Simulation of temperature reading
        temperature_reg <= std_logic_vector(to_unsigned(simulateTemperature(), 8));
      end if;
    end if;
  end process;

  temperature <= temperature_reg;
end Behavioral;

-- Function for temperature simulation
function simulateTemperature return natural is
  variable temp : natural := 25;  -- Initial simulation temperature
begin
  -- Simulation code for generating temperature values
  -- Customize this function to implement your desired temperature simulation logic

  -- Example: Simulating random temperature between 20 and 30 degrees Celsius
  temp := temp + natural(random_number(10) - 5);  -- Random variation between -5 and +5 degrees
  if temp < 20 then
    temp := 20;
  elsif temp > 30 then
    temp := 30;
  end if;

  return temp;
end simulateTemperature;
