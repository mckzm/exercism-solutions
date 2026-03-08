// @ts-check

export class ArgumentError extends Error {}

export class OverheatingError extends Error {
  constructor(temperature) {
    super(`The temperature is ${temperature} ! Overheating !`);
    this.temperature = temperature;
  }
}

const HUMIDITY_ALERT_THRESHOLD = 70; // %
const TEMPERATURE_ALERT_THRESHOLD = 500 // °C
const TEMPERATURE_SHUTDOWN_THRESHOLD = 650 // °C

/**
 * Check if the humidity level is not too high.
 *
 * @param {number} humidityPercentage
 * @throws {Error}
 */
export function checkHumidityLevel(humidityPercentage) {
    if (humidityPercentage > HUMIDITY_ALERT_THRESHOLD)
        throw new Error(`
            Humidity is > ${HUMIDITY_ALERT_THRESHOLD}%: ${humidityPercentage}%`
        );
}

/**
 * Check if the temperature is not too high.
 *
 * @param {number|null} temperature
 * @throws {ArgumentError|OverheatingError}
 */
export function reportOverheating(temperature) {
    if (temperature === null) {
        throw new ArgumentError(
            'Sensor malfunction: Expected temperature, got null'
        );
    }
    if (temperature > TEMPERATURE_ALERT_THRESHOLD)
        throw new OverheatingError(temperature);
}

/**
 *  Triggers the needed action depending on the result of the machine check.
 *
 * @param {{
 * check: function,
 * alertDeadSensor: function,
 * alertOverheating: function,
 * shutdown: function
 * }} actions
 * @throws {ArgumentError|OverheatingError|Error}
 */
export function monitorTheMachine({
    alertDeadSensor, alertOverheating, check, shutdown
}) {
    try {
        check();
    } catch (error) {
        if (error instanceof ArgumentError) alertDeadSensor();
        else if (error instanceof OverheatingError)
            error.temperature > TEMPERATURE_SHUTDOWN_THRESHOLD ?
                shutdown() :
                alertOverheating();
        else throw error;
    }
}
