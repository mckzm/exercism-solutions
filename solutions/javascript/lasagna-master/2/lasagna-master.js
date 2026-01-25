/// <reference path="./global.d.ts" />
// @ts-check

export function cookingStatus(remainingTime) {
    return remainingTime === 0 ?
        'Lasagna is done.' :
        remainingTime ? 'Not done, please wait.' : 'You forgot to set the timer.';
}

export function preparationTime(layers, avgPrepTimePerLayer = 2) {
    return layers.length * avgPrepTimePerLayer;
}

export function quantities(layers) {
    return {
        noodles: layers.filter(layer => layer === 'noodles').length * 50,
        sauce: layers.filter(layer => layer === 'sauce').length * 0.2,
    };
}

export function addSecretIngredient(friendsList, myList) {
    myList.push(friendsList[friendsList.length - 1]);
    return;
}

export function scaleRecipe(recipe, portions) {
    return Object
        .keys(recipe)
        .reduce(
            (newRecipe, ingredient) => (
                newRecipe[ingredient] = recipe[ingredient] * portions / 2,
                newRecipe),
            {});
}
