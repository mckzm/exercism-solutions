/// <reference path="./global.d.ts" />
//
// @ts-check

/**
 * Determine the price of the pizza given the pizza and optional extras
 *
 * @param {Pizza} pizza name of the pizza to be made
 * @param {Extra[]} extras list of extras
 *
 * @returns {number} the price of the pizza
 */
export function pizzaPrice(pizza, ...extras) {
    let pizzaPrices = {
        Margherita: 7,
        Caprese: 9,
        Formaggio: 10,
    };

    let optionPrices = {
        ExtraSauce: 1,
        ExtraToppings: 2,
    };

    if (extras.length === 0) {
        return pizzaPrices[pizza];
    } else {
        return pizzaPrice(pizza, ...extras.slice(0, -1)) + optionPrices[extras.at(-1)];
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
    return pizzaOrders.reduce((totalPrice, currentOrder) => (currentOrder.pizza ? pizzaPrice(currentOrder.pizza, ...currentOrder.extras) : 0) + totalPrice, 0);
}
