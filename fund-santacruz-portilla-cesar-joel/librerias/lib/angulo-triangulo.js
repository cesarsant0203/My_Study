module.exports = function(numUno, numDos) {
    if (numDos + numUno < 180) {
        return 180 - numUno - numDos;
    } else {
        return -1;
    }
}