# Instructions

Elena is the new quality manager of a newspaper factory.
As she has just arrived in the company, she has decided to review some of the processes in the factory to see what could be improved.

She found out that technicians are doing a lot of quality checks by hand.

She sees there is a good opportunity for automation and asks you, a freelance developer, to develop a piece of software to monitor some of the machines.

## 1. Monitor the humidity level of the room

Your first mission is to write a piece of software to monitor the humidity level of the production room.
There is already a sensor connected to the software of the company that returns periodically the humidity percentage of the room.

You need to implement a function in the software that will throw an error if the humidity percentage is too high.
The function should be called `check_humidity_level` and take the humidity percentage as a parameter.

You should halt with an error (the message is not important) if the percentage exceeds 70%. 
Otherwise, return `TRUE` to confirm the measurement is good.

```R
check_humidity_level(60)
#> humidity test passed
#> [1] TRUE

check_humidity_level(100)
#> Error in check_humidity_level(100) : pct_humidity <= 70 is not TRUE
```

## 2. Detect overheating

Elena is very pleased with your first assignment and asks you to deal with the monitoring of the machines' temperature.
While chatting with a technician, Greg, you are told that if the temperature of a machine exceeds 500°C, the technicians start worrying about overheating.

The machine is equipped with a sensor that measures its internal temperature.
You should know that the sensor is very sensitive and often breaks.
In this case, the technicians will need to change it.

Your job is to implement a function `report_overheating` that takes the temperature as a parameter and throws an error if the sensor is broken or if the machine starts overheating.

Knowing that you will later need to react differently depending on the error, you need a mechanism to differentiate the two kinds of errors.

- If the sensor is broken, the temperature will be `NULL`.
  In this case, you should halt with an error message that includes "Sensor Broken" as part of the string.
- When the sensor is working, if the temperature exceeds 600°C, you should halt with a message that includes the temperature.
- If the temperature exceeds 500°C but not 600°C, you should issue a warning that includes the temperature, and return `FALSE`.
- Otherwise, all is well, so issue the message `"temperature check passed: t °C"`, where `t` is the temperature, and return `TRUE`.

```R
report_overheating(NULL)
#> Error in report_overheating(NULL) : Sensor Broken

report_overheating(800)
#> Error in report_overheating(800) : Overheating: 800 C

report_overheating(550)
#> [1] FALSE
#> Warning message:
#> In report_overheating(550) : Risk of overheating: 550 C

report_overheating(450)
#> temperature check passed: 450 °C
#> [1] TRUE
```


## 3. Monitor the machine

Now that your machine can detect errors and you have a custom machine error, you add a wrapper function that can report how everything is working.
Beyond returning the logs from the previous functions, this wrapper will also need to add logs depending on any type(s) of failure(s) that occur.

- Check the humidity and temperature.
- If there are problems, just let `check_humidity_level()` and `report_overheating()` output their logs.
- If all is well, add a message that includes "All OK".

Implement a function `monitor_the_machine()` that takes humidity and temperature as arguments.

```R
# Working well
monitor_the_machine(53, 200)
#> humidity test passed
#> temperature check passed: 200 °C
#> All OK!

# High humidity
monitor_the_machine(90, 200)
#> Error in check_humidity_level(pct_humidity) : 
#>   pct_humidity <= 70 is not TRUE

# Faulty sensor
monitor_the_machine(53, NULL)
#> humidity test passed
#> Error in report_overheating(temperature) : Sensor Broken

# Mild overheating
monitor_the_machine(53, 550)
#> humidity test passed
#> Warning message:
#> In report_overheating(temperature) : Risk of overheating: 550 C

# Dangerous overheating: shutdown
monitor_the_machine(53, 650)
#> humidity test passed
#> Error in report_overheating(temperature) : Overheating: 650 C
```
