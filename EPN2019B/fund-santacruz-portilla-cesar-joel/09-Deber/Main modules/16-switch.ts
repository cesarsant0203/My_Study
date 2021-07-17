import { iniciar } from "./05-Iniciar-archivos"
import { idArchivo, arregloCargado } from "./07-id-archivos";
import { caseOne } from "./08-case01";
import { caseTwo } from "./09-case02";
import { caseTwoTwo } from "./10-case022";
import { caseTwoThree } from "./11-case023";
import { caseTwoFour } from "./12-case024";
import { caseTwoFive } from "./13-case025";
import { caseThree } from "./14-case03";
import { caseFour } from "./15-case04";
import * as prompts from 'prompts';
import {All } from "./01-archivos"
import { carro } from "../interfaces/carro.interface";
import { funcionOpcion } from "./04-opcion-archivos";
import { escribirArchivo } from "./03-escribir-archivo";


////////////////////////////////////////////////111111111111111111111111111111////////////////////////////////////////////////////////////////

export async function cases(){
    const opcion = await funcionOpcion();
    const arregloCarros: carro[] = await arregloCargado();
switch(opcion)
        {
            case 1:
                await caseOne();
                await All();
                break;
            case 21:
                await caseTwo();
                await All();
                break;
            case 22:
                await caseTwoTwo();
                await All();
                break;
            case 23:
                await caseTwoThree();
                await All();
                break;
            case 24:
                await caseTwoFour();
                await All();
                break;
            case 25:
                await caseTwoFive();
                await All();
                break;
            case 3:
                await caseThree();
                await All();
                break;
            case 4:
                await caseFour();
                await All();
                break;
            default:
                console.log("\nHASTA LUEGO!!");
                break;
        }
    const arregloTexto = JSON.stringify(arregloCarros);
        escribirArchivo('./ejemplo.txt',arregloTexto);
    }