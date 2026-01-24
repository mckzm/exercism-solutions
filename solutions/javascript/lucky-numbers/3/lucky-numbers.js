// @ts-check

/**
 * Calculates the sum of the two input arrays.
 *
 * @param {number[]} array1
 * @param {number[]} array2
 * @returns {number} sum of the two arrays
 */
export function twoSum(array1, array2) {
    let sum = 0;
    const fromDigits = (digit, index, _) => (sum += digit * (10 ** index));

    for (let array of [array1, array2]) {
        array.reverse();
        array.forEach(fromDigits);
    }

    return sum;
}

/**
 * Checks whether a number is a palindrome.
 *
 * @param {number} value
 * @returns {boolean} whether the number is a palindrome or not
 */
export function luckyNumber(value) {
    return String(value).split('').reverse().join('') === String(value);
}

/**
 * Determines the error message that should be shown to the user
 * for the given input value.
 *
 * @param {string|null|undefined} input
 * @returns {string} error message
 */
export function errorMessage(input) {
    if (input === undefined || !input?.length) return 'Required field';

    let n = Number(input);
    return (isNaN(n) || n === 0) ? 'Must be a number besides 0' : '';
}
