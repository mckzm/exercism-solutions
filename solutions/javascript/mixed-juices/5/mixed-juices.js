// @ts-check

const DEFAULT_MIXING_TIME = 2.5;

const JUICES_TO_MINUTES = {
    'All or Nothing' : 5,
    'Energizer': 1.5,
    'Green Garden': 1.5,
    'Pure Strawberry Joy': 0.5,
    'Tropical Island': 3,
};

const JUICES_TO_MINUTES_PROXY = new Proxy(JUICES_TO_MINUTES, {
    get: function (target, prop) {
        return target.hasOwnProperty(prop) ? target[prop] : DEFAULT_MIXING_TIME;
    }
});

const LIME_SIZES_TO_WEDGES = {
    small: 6,
    medium: 8,
    large: 10,
};

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
    return JUICES_TO_MINUTES_PROXY[name];
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
    let limesCut = 0;

    while (wedgesNeeded > 0 && limes.length) {
        wedgesNeeded -= LIME_SIZES_TO_WEDGES[limes.shift()];
        limesCut++;
    }

    return limesCut;
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
    while (timeLeft > 0 && orders.length) {
        timeLeft -= timeToMixJuice(orders.shift());
    }

    return orders;
}
