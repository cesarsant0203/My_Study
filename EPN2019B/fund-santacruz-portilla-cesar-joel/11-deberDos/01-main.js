"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var _03_opcion_1 = require("./03-opcion");
//////////////////////////////////////////////
var arr = [1, 2, 3, 4, 5, 6, 7, 8, 0];
var arrO = [1, 2, 3, 4, 5, 6, 7, 8, 0];
//arr = shuffle(arr);
var arrOneOne = (arr[0]);
var arrOneTwo = (arr[1]);
var arrOneThree = (arr[2]);
var arrTwoOne = (arr[3]);
var arrTwoTwo = (arr[4]);
var arrTwoThree = (arr[5]);
var arrThreeOne = (arr[6]);
var arrThreeTwo = (arr[7]);
var arrThreeT = (arr[8]);
var arrOOneOne = (arrO[0]);
var arrOOneTwo = (arrO[1]);
var arrOOneThree = (arrO[2]);
var arrOTwoOne = (arrO[3]);
var arrOTwoTwo = (arrO[4]);
var arrOTwoThree = (arrO[5]);
var arrOThreeOne = (arrO[6]);
var arrOThreeTwo = (arrO[7]);
var arrOThreeT = (arrO[8]);
//////////////////////////////////////////////
function main() {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            console.log('\t \t \t -------------Que comience el juego------------- \t \t \t \t \n \t \t \t Seleccione la posicion que desea mover y a donde desea mover \n \t \t \t \t \t POSICIONES \t \t \t \t \t ');
            console.log('El formato para ingresar datos es el siguiente\nEl primer numero es la posicion a mover\nEl segundo numero es igual a la posicion de llegas\n\nlas posiciones son\n\n 1, 2, 3 \n 4, 5, 6 \n 7, 8, 9 \n');
            console.log('Para salir preciona 99');
            console.log('DEBES LLEGAR A ESTO');
            console.log(arrOOneOne, arrOOneTwo, arrOOneThree);
            console.log(arrOTwoOne, arrOTwoTwo, arrOTwoThree);
            console.log(arrOThreeOne, arrOThreeTwo, arrOThreeT);
            console.log('ESTAS AQUI');
            console.log(arrOneOne, arrOneTwo, arrOneThree);
            console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
            console.log(arrThreeOne, arrThreeTwo, arrThreeT);
            all();
            return [2 /*return*/];
        });
    });
}
main();
function all() {
    return __awaiter(this, void 0, void 0, function () {
        var movimiento;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (!((arrOneOne == arrOOneOne) && (arrOneTwo == arrOOneTwo) && (arrOneThree == arrOOneThree) && (arrTwoOne == arrOTwoOne) && (arrTwoTwo == arrOTwoTwo) && (arrTwoThree == arrOTwoThree) && (arrThreeOne == arrOThreeOne) && (arrThreeTwo == arrOThreeTwo) && (arrThreeT == arrOThreeT))) return [3 /*break*/, 1];
                    console.log('GANASTE');
                    return [3 /*break*/, 3];
                case 1: return [4 /*yield*/, _03_opcion_1.funcionOpcion()];
                case 2:
                    movimiento = _a.sent();
                    if ((movimiento == 12) && (arrOneTwo == 0)) {
                        arrOneTwo = arrOneTwo + arrOneOne;
                        arrOneOne = arrOneOne - arrOneOne;
                        console.log(arrOneOne, arrOneTwo, arrOneThree);
                        console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                        console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                        all();
                    }
                    else {
                        if ((movimiento == 14) && (arrTwoOne == 0)) {
                            arrTwoOne = arrTwoOne + arrOneOne;
                            arrOneOne = arrOneOne - arrOneOne;
                            console.log(arrOneOne, arrOneTwo, arrOneThree);
                            console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                            console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                            all();
                        }
                        else {
                            if ((movimiento == 21) && (arrOneOne == 0)) {
                                arrOneOne = arrOneOne + arrOneTwo;
                                arrOneTwo = arrOneTwo - arrOneTwo;
                                console.log(arrOneOne, arrOneTwo, arrOneThree);
                                console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                all();
                            }
                            else {
                                if ((movimiento == 23) && (arrOneThree == 0)) {
                                    arrOneThree = arrOneThree + arrOneTwo;
                                    arrOneTwo = arrOneTwo - arrOneTwo;
                                    console.log(arrOneOne, arrOneTwo, arrOneThree);
                                    console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                    console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                    all();
                                }
                                else {
                                    if ((movimiento == 25) && (arrTwoTwo == 0)) {
                                        arrTwoTwo = arrTwoTwo + arrOneTwo;
                                        arrOneTwo = arrOneTwo - arrOneTwo;
                                        console.log(arrOneOne, arrOneTwo, arrOneThree);
                                        console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                        console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                        all();
                                    }
                                    else {
                                        if ((movimiento == 32) && (arrOneTwo == 0)) {
                                            arrOneTwo = arrOneTwo + arrOneThree;
                                            arrOneThree = arrOneThree - arrOneThree;
                                            console.log(arrOneOne, arrOneTwo, arrOneThree);
                                            console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                            console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                            all();
                                        }
                                        else {
                                            if ((movimiento == 36) && (arrTwoThree == 0)) {
                                                arrTwoThree = arrTwoThree + arrOneThree;
                                                arrOneThree = arrOneThree - arrOneThree;
                                                console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                all();
                                            }
                                            else {
                                                if ((movimiento == 41) && (arrOneOne == 0)) {
                                                    arrOneOne = arrOneOne + arrTwoOne;
                                                    arrTwoOne = arrTwoOne - arrTwoOne;
                                                    console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                    console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                    console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                    all();
                                                }
                                                else {
                                                    if ((movimiento == 45) && (arrTwoTwo == 0)) {
                                                        arrTwoTwo = arrTwoTwo + arrTwoOne;
                                                        arrTwoOne = arrTwoOne - arrTwoOne;
                                                        console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                        console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                        console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                        all();
                                                    }
                                                    else {
                                                        if ((movimiento == 47) && (arrThreeOne == 0)) {
                                                            arrThreeOne = arrThreeOne + arrTwoOne;
                                                            arrTwoOne = arrTwoOne - arrTwoOne;
                                                            console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                            console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                            console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                            all();
                                                        }
                                                        else {
                                                            if ((movimiento == 52) && (arrOneTwo == 0)) {
                                                                arrOneTwo = arrOneTwo + arrTwoTwo;
                                                                arrTwoTwo = arrTwoTwo - arrTwoTwo;
                                                                console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                all();
                                                            }
                                                            else {
                                                                if ((movimiento == 54) && (arrTwoOne == 0)) {
                                                                    arrTwoOne = arrTwoOne + arrTwoTwo;
                                                                    arrTwoTwo = arrTwoTwo - arrTwoTwo;
                                                                    console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                    console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                    console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                    all();
                                                                }
                                                                else {
                                                                    if ((movimiento == 56) && (arrTwoThree == 0)) {
                                                                        arrTwoThree = arrTwoThree + arrTwoTwo;
                                                                        arrTwoTwo = arrTwoTwo - arrTwoTwo;
                                                                        console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                        console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                        console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                        all();
                                                                    }
                                                                    else {
                                                                        if ((movimiento == 58) && (arrThreeTwo == 0)) {
                                                                            arrThreeTwo = arrThreeTwo + arrTwoTwo;
                                                                            arrTwoTwo = arrTwoTwo - arrTwoTwo;
                                                                            console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                            console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                            console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                            all();
                                                                        }
                                                                        else {
                                                                            if ((movimiento == 63) && (arrOneThree == 0)) {
                                                                                arrOneThree = arrOneThree + arrTwoThree;
                                                                                arrTwoThree = arrTwoThree - arrTwoThree;
                                                                                console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                all();
                                                                            }
                                                                            else {
                                                                                if ((movimiento == 65) && (arrTwoTwo == 0)) {
                                                                                    arrTwoTwo = arrTwoTwo + arrTwoThree;
                                                                                    arrTwoThree = arrTwoThree - arrTwoThree;
                                                                                    console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                    console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                    console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                    all();
                                                                                }
                                                                                else {
                                                                                    if ((movimiento == 69) && (arrThreeT == 0)) {
                                                                                        arrThreeT = arrThreeT + arrTwoThree;
                                                                                        arrTwoThree = arrTwoThree - arrTwoThree;
                                                                                        console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                        console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                        console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                        all();
                                                                                    }
                                                                                    else {
                                                                                        if ((movimiento == 74) && (arrTwoOne == 0)) {
                                                                                            arrTwoOne = arrTwoOne + arrThreeOne;
                                                                                            arrThreeOne = arrThreeOne - arrThreeOne;
                                                                                            console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                            console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                            console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                            all();
                                                                                        }
                                                                                        else {
                                                                                            if ((movimiento == 78) && (arrThreeTwo == 0)) {
                                                                                                arrThreeTwo = arrThreeTwo + arrThreeOne;
                                                                                                arrThreeOne = arrThreeOne - arrThreeOne;
                                                                                                console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                                console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                                console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                                all();
                                                                                            }
                                                                                            else {
                                                                                                if ((movimiento == 87) && (arrThreeOne == 0)) {
                                                                                                    arrThreeOne = arrThreeOne + arrThreeTwo;
                                                                                                    arrThreeTwo = arrThreeTwo - arrThreeTwo;
                                                                                                    console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                                    console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                                    console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                                    all();
                                                                                                }
                                                                                                else {
                                                                                                    if ((movimiento == 85) && (arrTwoTwo == 0)) {
                                                                                                        arrTwoTwo = arrTwoTwo + arrThreeTwo;
                                                                                                        arrThreeTwo = arrThreeTwo - arrThreeTwo;
                                                                                                        console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                                        console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                                        console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                                        all();
                                                                                                    }
                                                                                                    else {
                                                                                                        if ((movimiento == 89) && (arrThreeT == 0)) {
                                                                                                            arrThreeT = arrThreeT + arrThreeTwo;
                                                                                                            arrThreeTwo = arrThreeTwo - arrThreeTwo;
                                                                                                            console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                                            console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                                            console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                                            all();
                                                                                                        }
                                                                                                        else {
                                                                                                            if ((movimiento == 98) && (arrThreeTwo == 0)) {
                                                                                                                arrThreeTwo = arrThreeTwo + arrThreeT;
                                                                                                                arrThreeT = arrThreeT - arrThreeT;
                                                                                                                console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                                                console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                                                console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                                                all();
                                                                                                            }
                                                                                                            else {
                                                                                                                if ((movimiento == 96) && (arrTwoThree == 0)) {
                                                                                                                    arrTwoThree = arrTwoThree + arrThreeT;
                                                                                                                    arrThreeT = arrThreeT - arrThreeT;
                                                                                                                    console.log(arrOneOne, arrOneTwo, arrOneThree);
                                                                                                                    console.log(arrTwoOne, arrTwoTwo, arrTwoThree);
                                                                                                                    console.log(arrThreeOne, arrThreeTwo, arrThreeT);
                                                                                                                    all();
                                                                                                                }
                                                                                                                else {
                                                                                                                    if (movimiento == 99) {
                                                                                                                        console.log('Hasta luego');
                                                                                                                    }
                                                                                                                    else {
                                                                                                                        console.log("Estas haciendo tonteras");
                                                                                                                        all();
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    _a.label = 3;
                case 3: return [2 /*return*/];
            }
        });
    });
}
