/// <reference path="./global.d.ts" />
// @ts-check

const statusMessages = {
    done: 'Lasagna is done.',
    not_done: 'Not done, please wait.',
    time_missing: 'You forgot to set the timer.',
};

const quantitiesPerLayer = {
    'noodles': 50,
    'sauce': 0.2,
};

const portionRatio = 0.5;

export function cookingStatus(remainingTime) {
    return remainingTime === 0 ?
        statusMessages.done :
        remainingTime ? statusMessages.not_done : statusMessages.time_missing;
}

export function preparationTime(layers, avgPrepTimePerLayer = 2) {
    return layers.length * avgPrepTimePerLayer;
}

export function quantities(layers) {
    return {
        noodles: layers
        .filter(layer => layer === 'noodles')
        .length * quantitiesPerLayer.noodles,
        sauce: layers
        .filter(layer => layer === 'sauce')
        .length * quantitiesPerLayer.sauce,
    };
}

export function addSecretIngredient(friendsList, myList) {
    myList.push(friendsList[friendsList.length - 1]);
    return;
}

export function scaleRecipe(recipe, portions) {
    const portionFactor = portions * portionRatio;
    return Object
        .keys(recipe)
        .reduce(
            (newRecipe, ingredient) => (
                newRecipe[ingredient] = recipe[ingredient] * portionFactor,
                newRecipe),
            {});
}
