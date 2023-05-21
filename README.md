# Temperature-Sensor
TemperatureSensor is a VHDL program that simulates a temperature sensor. It provides real-time temperature readings in an 8-bit representation. The program utilizes a clock signal for synchronization and a reset signal for initialization. The temperature readings are simulated using a customizable logic within the simulateTemperature() function. The temperature values range between 20 and 30 degrees Celsius with a variation of -5 to +5 degrees. The code follows VHDL best practices, ensuring efficiency and accuracy in temperature simulation.

# Usage
- Instantiate the Temperature Sensor entity in your VHDL design.
- Connect the clock signal (clk) and reset signal (reset) to appropriate sources.
- Connect the output signal (temperature) to the desired destination for temperature readings.

# Customization
To customize the temperature simulation, modify the simulateTemperature() function. You can implement your own logic or algorithm to generate simulated temperature values based on your requirements.

```
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
```

# Example
```
-- Instantiate TemperatureSensor
signal clk, reset : std_logic;
signal temperature : std_logic_vector(7 downto 0);

TemperatureSensor_inst : entity work.TemperatureSensor
  port map (
    clk => clk,
    reset => reset,
    temperature => temperature
  );
```
# Note
This program generates pseudo-random temperature values for simulation purposes and may not reflect actual temperature readings. For real-world temperature sensing, external hardware or sensors should be used.
