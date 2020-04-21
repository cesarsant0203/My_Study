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
var _07_id_archivos_1 = require("./07-id-archivos");
var _08_case01_1 = require("./08-case01");
var _09_case02_1 = require("./09-case02");
var _10_case022_1 = require("./10-case022");
var _11_case023_1 = require("./11-case023");
var _12_case024_1 = require("./12-case024");
var _13_case025_1 = require("./13-case025");
var _14_case03_1 = require("./14-case03");
var _15_case04_1 = require("./15-case04");
var _01_archivos_1 = require("./01-archivos");
var _04_opcion_archivos_1 = require("./04-opcion-archivos");
var _03_escribir_archivo_1 = require("./03-escribir-archivo");
////////////////////////////////////////////////111111111111111111111111111111////////////////////////////////////////////////////////////////
function cases() {
    return __awaiter(this, void 0, void 0, function () {
        var opcion, arregloCarros, _a, arregloTexto;
        return __generator(this, function (_b) {
            switch (_b.label) {
                case 0: return [4 /*yield*/, _04_opcion_archivos_1.funcionOpcion()];
                case 1:
                    opcion = _b.sent();
                    return [4 /*yield*/, _07_id_archivos_1.arregloCargado()];
                case 2:
                    arregloCarros = _b.sent();
                    _a = opcion;
                    switch (_a) {
                        case 1: return [3 /*break*/, 3];
                        case 21: return [3 /*break*/, 6];
                        case 22: return [3 /*break*/, 9];
                        case 23: return [3 /*break*/, 12];
                        case 24: return [3 /*break*/, 15];
                        case 25: return [3 /*break*/, 18];
                        case 3: return [3 /*break*/, 21];
                        case 4: return [3 /*break*/, 24];
                    }
                    return [3 /*break*/, 27];
                case 3: return [4 /*yield*/, _08_case01_1.caseOne()];
                case 4:
                    _b.sent();
                    return [4 /*yield*/, _01_archivos_1.All()];
                case 5:
                    _b.sent();
                    return [3 /*break*/, 28];
                case 6: return [4 /*yield*/, _09_case02_1.caseTwo()];
                case 7:
                    _b.sent();
                    return [4 /*yield*/, _01_archivos_1.All()];
                case 8:
                    _b.sent();
                    return [3 /*break*/, 28];
                case 9: return [4 /*yield*/, _10_case022_1.caseTwoTwo()];
                case 10:
                    _b.sent();
                    return [4 /*yield*/, _01_archivos_1.All()];
                case 11:
                    _b.sent();
                    return [3 /*break*/, 28];
                case 12: return [4 /*yield*/, _11_case023_1.caseTwoThree()];
                case 13:
                    _b.sent();
                    return [4 /*yield*/, _01_archivos_1.All()];
                case 14:
                    _b.sent();
                    return [3 /*break*/, 28];
                case 15: return [4 /*yield*/, _12_case024_1.caseTwoFour()];
                case 16:
                    _b.sent();
                    return [4 /*yield*/, _01_archivos_1.All()];
                case 17:
                    _b.sent();
                    return [3 /*break*/, 28];
                case 18: return [4 /*yield*/, _13_case025_1.caseTwoFive()];
                case 19:
                    _b.sent();
                    return [4 /*yield*/, _01_archivos_1.All()];
                case 20:
                    _b.sent();
                    return [3 /*break*/, 28];
                case 21: return [4 /*yield*/, _14_case03_1.caseThree()];
                case 22:
                    _b.sent();
                    return [4 /*yield*/, _01_archivos_1.All()];
                case 23:
                    _b.sent();
                    return [3 /*break*/, 28];
                case 24: return [4 /*yield*/, _15_case04_1.caseFour()];
                case 25:
                    _b.sent();
                    return [4 /*yield*/, _01_archivos_1.All()];
                case 26:
                    _b.sent();
                    return [3 /*break*/, 28];
                case 27:
                    console.log("\nHASTA LUEGO!!");
                    return [3 /*break*/, 28];
                case 28:
                    arregloTexto = JSON.stringify(arregloCarros);
                    _03_escribir_archivo_1.escribirArchivo('./ejemplo.txt', arregloTexto);
                    return [2 /*return*/];
            }
        });
    });
}
exports.cases = cases;
