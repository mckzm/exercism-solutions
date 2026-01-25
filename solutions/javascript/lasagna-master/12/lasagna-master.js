/// <reference path="./global.d.ts" />
// @ts-check

const DEFAULT_AVERAGE_PREPARATION_TIME = 2;

const portionRatio = 0.5;

const quantitiesPerLayer = {
    'noodles': 50,
    'sauce': 0.2,
};

const statusMessages = {
    done: 'Lasagna is done.',
    not_done: 'Not done, please wait.',
    time_missing: 'You forgot to set the timer.',
};

export function cookingStatus(remainingTime) {
    return remainingTime === 0 ?
        statusMessages.done :
        remainingTime ? statusMessages.not_done : statusMessages.time_missing;
}

export function preparationTime(layers, averagePreparationTime = DEFAULT_AVERAGE_PREPARATION_TIME) {
    return layers.length * averagePreparationTime;
}

export function quantities(layers) {
     return Object
        .assign({}, ...['noodles', 'sauce']
            .map(ingredient => ({[ingredient]: layers
                .filter(layer => layer === ingredient)
                .length * quantitiesPerLayer[ingredient]})));
}

export function addSecretIngredient(friendsList, myList) {
    myList.push(friendsList.at(-1));
    return;
}

export function scaleRecipe(recipe, portions) {
    const portionFactor = portions * portionRatio;
    return Object
        .keys(recipe)
        .reduce(
            (newRecipe, ingredient) => (
                newRecipe[ingredient] = recipe[ingredient] * portionFactor,
                newRecipe), {});
}
