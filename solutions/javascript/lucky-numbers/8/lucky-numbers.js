// @ts-check

const MSG_FOR_INCORRECT_INPUT = 'Must be a number besides 0';
const MSG_FOR_MISSING_INPUT = 'Required field';
const MSG_FOR_VALID_INPUT = '';

/**
 * Calculates the sum of the two input arrays.
 *
 * @param {number[]} array1
 * @param {number[]} array2
 * @returns {number} sum of the two arrays
 */
export function twoSum(array1, array2) {
    return Number(array1.join('')) + Number(array2.join(''));
}

/**
 * Checks whether a number is a palindrome.
 *
 * @param {number} value
 * @returns {boolean} whether the number is a palindrome or not
 */
export function luckyNumber(value) {
    return [...String(value)].reverse().join('') === String(value);
}

/**
 * Determines the error message that should be shown to the user
 * for the given input value.
 *
 * @param {string|null|undefined} input
 * @returns {string} error message
 */
export function errorMessage(input) {
    if (input === undefined || !input?.length) return MSG_FOR_MISSING_INPUT;

    let n = Number(input);
    return (isNaN(n) || n === 0) ?
        MSG_FOR_INCORRECT_INPUT :
        MSG_FOR_VALID_INPUT;
}
