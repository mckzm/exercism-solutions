/// <reference path="./global.d.ts" />
//
// @ts-check

const PRICES = {
    options: {
        ExtraSauce: 1,
        ExtraToppings: 2,
    },
    pizza: {
        Caprese: 9,
        Formaggio: 10,
        Margherita: 7,
    },
};

/**
 * Determine the price of the pizza given the pizza and optional extras
 *
 * @param {Pizza} pizza name of the pizza to be made
 * @param {Extra[]} extras list of extras
 *
 * @returns {number} the price of the pizza
 */
export function pizzaPrice(pizza, ...[firstExtra, ...otherExtras]) {
    if (typeof firstExtra === 'undefined') {
        return PRICES.pizza[pizza];
    } else {
        return pizzaPrice(pizza, ...otherExtras) +
            PRICES.options[firstExtra];
    }
}

/**
 * Calculate the price of the total order, given individual orders
 *
 * (HINT: For this exercise, you can take a look at the supplied "global.d.ts" file
 * for more info about the type definitions used)
 *
 * @param {PizzaOrder[]} pizzaOrders a list of pizza orders
 * @returns {number} the price of the total order
 */
export function orderPrice(pizzaOrders) {
    return pizzaOrders.reduce(
        (totalPrice, {pizza, extras}) =>
            (pizza ? pizzaPrice(pizza, ...extras) : 0) + totalPrice,
        0);
}
