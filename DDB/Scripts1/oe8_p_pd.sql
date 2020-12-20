REM script oe_p_pd.sql
REM populates the PRODUCT_DESCRIPTIONS table of the OE schema
REM version: 8.1.7
REM ============================================================================
set define off
REM === Spanish translations ===================================================
insert into product_descriptions values (1726-
, 'E'-
, TRANSLATE('LCD Monitor 11/PM' USING NCHAR_CS)-
, TRANSLATE('Encantado de conocerle.-
Placeholder for a Spanish description' USING NCHAR_CS)
);
REM === French translations ====================================================
insert into product_descriptions values (1726-
, 'F'-
, TRANSLATE('LCD Monitor 11/PM' USING NCHAR_CS)-
, TRANSLATE('Vive la France!-
Placeholder for a French description' USING NCHAR_CS)
);
REM === German translations ====================================================
insert into product_descriptions values (1726-
, 'D'-
, TRANSLATE('LCD Monitor 11/PM' USING NCHAR_CS)-
, TRANSLATE('Wein, Weib, und Gesang:-
Placeholder for a German description' USING NCHAR_CS)
);
REM === Dutch translations =====================================================
insert into product_descriptions values (1726-
, 'NL'-
, TRANSLATE('LCD Monitor 11/PM' USING NCHAR_CS)-
, TRANSLATE('Wat een flauwekul allemaal...-
Placeholder for a Dutch description' USING NCHAR_CS)
);
REM === Italian translations ===================================================
insert into product_descriptions values (1726-
, 'I'-
, TRANSLATE('LCD Monitor 11/PM' USING NCHAR_CS)-
, TRANSLATE('Dolce far niente...-
Placeholder for an Italian description' USING NCHAR_CS)
);
REM === Japanese translations ==================================================

REM === Barzil Portuguese translations =========================

INSERT INTO product_descriptions VALUES (2359 -
 ,'PTB' -
 ,TRANSLATE(' LCD Monitor 9/PM' USING NCHAR_CS) -
 ,TRANSLATE('Tela de cristal l�quido de 9 polegadas, matriz passiva. Divirta-se com a produtividade que um pequeno monitor pode trazer deixando mais espa�o livre para voc�. F�cil configura��o plug-and-play.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3155 -
 ,'PTB' -
 ,TRANSLATE('Monitor Hinge - HD' USING NCHAR_CS) -
 ,TRANSLATE('Monitor Hinge, suporta grande processamento, peso m�ximo de 30 Kg.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3234 -
 ,'PTB' -
 ,TRANSLATE('Monitor Hinge - STD' USING NCHAR_CS) -
 ,TRANSLATE('Monitor Hinge padr�o, peso m�ximo de 10 Kg.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3060 -
 ,'PTB' -
 ,TRANSLATE('Monitor 17/HR' USING NCHAR_CS) -
 ,TRANSLATE('onitor de 17 polegadas (16 vis�veis) alta resolu��o. Performance excepcional al�m do benef�cio adicional do espa�o da tela. Este monitor oferece performance com alta defini��o de cores. Inclui visualiza��o dos controles na tela' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2243 -
 ,'PTB' -
 ,TRANSLATE(' Monitor 17/HR/F' USING NCHAR_CS) -
 ,TRANSLATE('Monitor de 17 polegadas (16 vis�veis) com alta resolu��o e tela plana. Canh�o de alta densidade de f�tons com sistema melhorado de corre��o el�ptica para mais consist�ncia e precis�o no foco, mesmo nos cantos.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3057 -
 ,'PTB' -
 ,TRANSLATE(' Monitor 17/SD' USING NCHAR_CS) -
 ,TRANSLATE('Monitor CRT de 17 polegadas (16 vis�veis). Imagem clara e precisa. Proporciona a profissionais em cores, engenheiros t�cnicos e usu�rios de visualiza��o uma fidelidade de cores que precisam, al�m de uma maior �rea de trabalho  melhorando a produtividade.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3061 -
 ,'PTB' -
 ,TRANSLATE(' Monitor 19/SD' USING NCHAR_CS) -
 ,TRANSLATE('Monitor CRT de 19 polegadas (18 vis�veis). Possui contraste superior e performance em tons de cinza. O novo design dos alto-falantes profissionais com resposta em tons graves din�micos produzem um som real�stico. Al�m disso, oferece identifica��o de cabos' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2245 -
 ,'PTB' -
 ,TRANSLATE(' Monitor 19/SD/M' USING NCHAR_CS) -
 ,TRANSLATE('Monitor de 19 polegadas (18 vis�veis), monocrom�tico. Um simples menu na tela auxilia o ajuste das dimens�es da tela, cores e imagem. Basta conectar o monitor ao PC e pronto.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3065 -
 ,'PTB' -
 ,TRANSLATE(' Monitor 21/D' USING NCHAR_CS) -
 ,TRANSLATE('onitor CRT de 21 polegadas (20 vis�veis). Tecnlogia OptiScan digital: resolu��o de at� 1600 x 1200 a 75Hz. Dimens�es 8.3 x 18.5 x 15 polegadas. Os alto-falantes remov�veis do monitor da s�rie Platinum oferecem som real�stico e f�cil utiliza��o. Basta co' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3331 -
 ,'PTB' -
 ,TRANSLATE(' Monitor 21/HR' USING NCHAR_CS) -
 ,TRANSLATE('Monitor de 21 polegadas (20 vis�veis) com alta resolu��o. Este monitor � ideal para neg�cios, editora��o e aplica��es gr�ficas pesadas. Melhor visualiza��o levando a uma melhor produtividade.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2252 -
 ,'PTB' -
 ,TRANSLATE(' Monitor 21/HR/M' USING NCHAR_CS) -
 ,TRANSLATE('Monitor de 21 polegadas (20 vis�veis) alta resolu��o, monocrom�tico. Dimens�es: 35.6 x 29.6 x 33.3 cm (14.6 kg). Frequ�ncia horizontal 31.5 - 54 kHz, frequ�ncia vertical 50 - 120 Hz. Fonte universal de voltagem: 90 - 132 V, 50 - 60 Hz.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3064 -
 ,'PTB' -
 ,TRANSLATE(' Monitor 21/SD' USING NCHAR_CS) -
 ,TRANSLATE('onitor de 21 polegadas (20 vis�veis). Suporta uma resolu��o de at� 1920 x 1200 a 76Hz e possui uma tela de filme anti-reflexivo' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3350 -
 ,'PTB' -
 ,TRANSLATE(' Plasma Monitor 10/LE/VGA' USING NCHAR_CS) -
 ,TRANSLATE('Monitor de 10 polegadas, resolu��o VGA.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2236 -
 ,'PTB' -
 ,TRANSLATE('Plasma Monitor 10/TFT/XGA' USING NCHAR_CS) -
 ,TRANSLATE('Monitor de 10 polegadas TFT XGA, com tela plana para notebooks' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3054 -
 ,'PTB' -
 ,TRANSLATE('Plasma Monitor 10/XGA' USING NCHAR_CS) -
 ,TRANSLATE('Monitor de 10 polegadas padr�o, resolu��o XGA. Imagem com alta resolu��o e possui imagem com intensidade de luz reduzida.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1782 -
 ,'PTB' -
 ,TRANSLATE('Compact 400/DQ' USING NCHAR_CS) -
 ,TRANSLATE('Impressora com velocidade de 400 caracteres por segundo. Dimens�es: 17.34 x 24.26 x 26.32 polegadas. Interface: serial RS-232 (9 pinos) sem slots para expans�o. Tamanho de papel: A4, carta.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2430 -
 ,'PTB' -
 ,TRANSLATE('Compact 400/LQ' USING NCHAR_CS) -
 ,TRANSLATE('Impressora com velocidade de 400 caracteres por segundo, qualidade de carta. Dimens�es: 12.37 x 27.96 x 23.92 polegadas. Interface: serial RS-232 (25 pinos) com 3 slots para expans�o. Tamanho de papel: A2, A3, A4' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1792 -
 ,'PTB' -
 ,TRANSLATE('Industrial 600/DQ' USING NCHAR_CS) -
 ,TRANSLATE('mpressora com velocidade de 600 caracteres por segundo com maior n�mero de colunas. Dimens�es: 22.31 x 25.73 x 20.12 polegadas. Tamanho de papel: 3x5 polegadas a 11x17 polegas' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1791 -
 ,'PTB' -
 ,TRANSLATE('Industrial 700/HD' USING NCHAR_CS) -
 ,TRANSLATE('Impressora matricial com velocidade de 700 caracteres por segundo com prote��o contra poeira em caso de uso industrial. Interface: Centronics parallel, compat�vel com IEEE 1284. Tamanho de papel: 3x5 polegadas por 11x17 polegadas. Mem�ria: 4MB. Dimens�es:' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2302 -
 ,'PTB' -
 ,TRANSLATE('Inkjet B/6' USING NCHAR_CS) -
 ,TRANSLATE('Impressora a jato de tinta, preto e branco, 6 p�ginas por minuto, resolu��o de 600x300 dpi. Interface: Centronics parallel, compat�vel com IEEE 1284. Dimens�es: 7.3 x 17.5 x 14 polegas. Tamanho de papel: A3, A4. Sem slots para expans�o' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2453 -
 ,'PTB' -
 ,TRANSLATE('Inkjet C/4' USING NCHAR_CS) -
 ,TRANSLATE('Impressora a jato de tinta, colorida (com dois cartuchos de tinta separados), 6 p�ginas por minuto em preto e branco e 4 p�ginas por minuto coloridas, resolu��o de 600x300 dpi. Interface: compat�vel com Biodirectional IEEE 1284 e sa�da serial RS-232 (9 pi' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1797 -
 ,'PTB' -
 ,TRANSLATE('Inkjet C/8/HQ' USING NCHAR_CS) -
 ,TRANSLATE('Impressora a jato de tinta, colorida, 8 p�ginas por minuto, alta resolu��o (qualidade de foto). Mem�ria: 16MB. Dimens�es: 7.3 x 17.5 x 14 polegadas. Tamanho de papel: A4, carta, envelope. Interface: Centronics parallel, compat�vel com IEEE 1284' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2459 -
 ,'PTB' -
 ,TRANSLATE('LaserPro 1200/8/BW' USING NCHAR_CS) -
 ,TRANSLATE('Impressora a laser, branco e preto, profissional, resolu��o de 1200 dpi, 8 p�ginas por segundo. Dimens�es: 22.37 x 19.86 x 21.92 polegadas. Software: drive compat�vel com SPNIX v4.0. ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3127 -
 ,'PTB' -
 ,TRANSLATE('LaserPro 600/6/BW' USING NCHAR_CS) -
 ,TRANSLATE('Impressora a laser, branco e preto, padr�o, resolu��o de 600 dpi, 6 p�ginas por segundo. Interface: Centronics parallel, compat�vel com IEEE 1284. Mem�ria: 8MB 96 KB de buffer de recebimento.  Utilit�rios MS-DOS ToolBox compat�vel com SPINIX Auto CAM v.17' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2254 -
 ,'PTB' -
 ,TRANSLATE('HD 10GB /I' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 10GB (interno). � destinado a ambientes com dados cr�ticos e s�o ideais para uso com RAID.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3353 -
 ,'PTB' -
 ,TRANSLATE('HD 10GB /R' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido remov�vel de 10GB. Os drives Supra7 prov�em a mais recente tecnologia em termos de desempenho, aumentando a taxa de tranfer�ncia para at� 160MB/s.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3069 -
 ,'PTB' -
 ,TRANSLATE('HD 10GB /S' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 10GB. Compat�vel com sistemas Supra5. Os drives Supra eliminam o risco de incompatibilidade de firmware' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2253 -
 ,'PTB' -
 ,TRANSLATE('HD 10GB @5400 /SE' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido de 10GB (externo) interface SCSI, 5400 RPM. Os drives Supra eliminam o risco de incompatibilidade de firmware.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3354 -
 ,'PTB' -
 ,TRANSLATE('HD 12GB /I' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 12GB (interno). Os drives Supra eliminam o risco de incompatibilidade de firmware. Compat�vel com vers�es anteriores. Possibilita a exist�ncia de dispositivos Supra2 com Supra3 para solu��es otimizadas e futuro crescimento' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3072 -
 ,'PTB' -
 ,TRANSLATE('HD 12GB /N' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 12Gb. Supra9 prov� mecanismos que possibilitam a instala��o e remo��o de drives de modo on-line. Satisfaz padr�es de confiabilidade e performance' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3334 -
 ,'PTB' -
 ,TRANSLATE('HD 12GB /R' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 12GB remov�vel. Compat�vel com v�rias plataformas.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3071 -
 ,'PTB' -
 ,TRANSLATE('HD 12GB /S' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 12GB. Supra9 prov� mecanismos que possibilitam a instala��o e remo��o de drives de modo on-line. Satisfaz padr�es de confiabilidade e performance' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2255 -
 ,'PTB' -
 ,TRANSLATE('HD 12GB @7200 /SE' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido de 12GB (externo) SCSI, 7200 RPM. Estes drives s�o recomendados para ambientes com dados cr�ticos e s�o ideais para uso com RAID.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3399 -
 ,'PTB' -
 ,TRANSLATE('HD 18GB /SE' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 18GB externo. Supra5 Universal pode ser conectado em v�rios servidores e suporta v�rios tipos de RAID' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1743 -
 ,'PTB' -
 ,TRANSLATE('HD 18.2GB @10000 /E' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido de 18.2 GB externo, taxa de at� 10.000 RPM. S�o recomendados para ambientes com dados cr�ticos e s�o ideais para uso com RAID.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2382 -
 ,'PTB' -
 ,TRANSLATE('HD 18.2GB@10000 /I' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido de 18.2 GB SCSI, taxa de 10.000 RPM, interno. Supra7 Universal fornece grande compatibilidade entre as diversas plataformas.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3073 -
 ,'PTB' -
 ,TRANSLATE('HD 6GB /I' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 6GB (interno). Os drives Supra eliminam o risco de incompatibilidade de firmware' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2257 -
 ,'PTB' -
 ,TRANSLATE('HD 8GB /I' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 8GB (interno). Supra9 permite a instala��o e remo��o de discos on-line. Compatibilidade com vers�es anteriores. Possibilita a exist�ncia de dispositivos Supra2 com Supra3 para solu��es otimizadas e futuro crescimento' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3400 -
 ,'PTB' -
 ,TRANSLATE('HD 8GB /SE' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 8GB SCSI (externo). Supra7 oferece uma tecnologia mais recente que melhora a performance e aumenta a taxa de transfer�ncia para at� 255 MB/s' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3355 -
 ,'PTB' -
 ,TRANSLATE('HD 8GB /SI' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido de 8GB, interno. Compat�vel com v�rias plataformas e f�cil manuten��o.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1768 -
 ,'PTB' -
 ,TRANSLATE('HD 8.2GB @5400' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido de 8.2 GB, taxa de at� 5400 RPM. Os drives Supra eliminam o risco de incompatibilidade de firmware. Interface RS-232 padr�o.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2410 -
 ,'PTB' -
 ,TRANSLATE('HD 8.4GB @5400' USING NCHAR_CS) -
 ,TRANSLATE('isco r�gido de 8.4 GB a 5400 RPM. Custo reduzido. Satisfaz padr�es de confiabilidade e performance' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1772 -
 ,'PTB' -
 ,TRANSLATE('HD 9.1GB @10000' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido de 9.1 GB, a uma taxa de at� 10.000 RPM. S�o recomendados para para ambientes com dados cr�ticos e s�o ideais para uso com RAID. ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2414 -
 ,'PTB' -
 ,TRANSLATE('HD 9.1GB @10000 /I' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido de 9.1 GB, 10.000 RPM (interno). Os drives para disco Supra7 est�o dispon�veis em 10.000 RPM e capacidade de 18GB e 9.1 GB. Interfaces SCSI e RS-232.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2415 -
 ,'PTB' -
 ,TRANSLATE('HD 9.1GB @7200' USING NCHAR_CS) -
 ,TRANSLATE('Disco r�gido de 9.1 GB, 7200 RPM. ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2384 -
 ,'PTB' -
 ,TRANSLATE('DIMM - 1GB' USING NCHAR_CS) -
 ,TRANSLATE('em�ria DIMM: RAM - 1 GB de capacidade' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2378 -
 ,'PTB' -
 ,TRANSLATE('DIMM - 128 MB' USING NCHAR_CS) -
 ,TRANSLATE('em�ria DIMM 128 MB. O principal motivo para a mudan�a de SIMM para DIMM � suportar o barramento maior dos processadores de 64 bits. A mem�ria DIMM suporta de 64 a 72 bits; enquanto que a outra suporta somente de 32 a 36 bits (com paridade)' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3087 -
 ,'PTB' -
 ,TRANSLATE('DIMM - 16 MB' USING NCHAR_CS) -
 ,TRANSLATE('itrus OLX DIMM - 16 MB de capacidade' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1750 -
 ,'PTB' -
 ,TRANSLATE('DIMM - 2GB' USING NCHAR_CS) -
 ,TRANSLATE('em�ria DIMM: RAM de 2 GB de capacidade' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1749 -
 ,'PTB' -
 ,TRANSLATE('DIMM - 256MB' USING NCHAR_CS) -
 ,TRANSLATE('em�ria DIMM: RAM de 256MB.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2394 -
 ,'PTB' -
 ,TRANSLATE('DIMM - 32MB' USING NCHAR_CS) -
 ,TRANSLATE('pgrade de mem�ria DIMM de 32MB' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2400 -
 ,'PTB' -
 ,TRANSLATE('DIMM - 512 MB' USING NCHAR_CS) -
 ,TRANSLATE('Mem�ria de 512 MB. Menos unidades de DIMM s�o necess�rios para um upgrade do que o exigido pela mem�ria SIMM para um mesmo sistema. Com o mesmo n�mero de slots, consegue-se mais mem�ria usando-se mem�ria DIMM. A mem�ria DIMM tem contatos diferentes em cad' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1763 -
 ,'PTB' -
 ,TRANSLATE('DIMM - 64MB' USING NCHAR_CS) -
 ,TRANSLATE('em�ria DIMM: 64MB de RA' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2396 -
 ,'PTB' -
 ,TRANSLATE('EDO - 32MB' USING NCHAR_CS) -
 ,TRANSLATE('Mem�ria EDO SIMM: 32 MB de RAM. Como FPM, EDO est� dispon�vel para SIMM e DIMM, a 3.3 e 5 volts. Se a mem�ria EDO for instalada em um computador que n�o foi desenhado para suport�-la ent�o a mem�ria pode n�o funcionar.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2272 -
 ,'PTB' -
 ,TRANSLATE('RAM - 16 MB' USING NCHAR_CS) -
 ,TRANSLATE('em�ria SIMM: 16MB de capacidade' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2274 -
 ,'PTB' -
 ,TRANSLATE('RAM - 32 MB' USING NCHAR_CS) -
 ,TRANSLATE('em�ria SIMM: 32MB de capacidade' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3090 -
 ,'PTB' -
 ,TRANSLATE('RAM - 48 MB' USING NCHAR_CS) -
 ,TRANSLATE('em�ria SIMM de acesso rand�mico - 48MB de capacidade' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1739 -
 ,'PTB' -
 ,TRANSLATE('SDRAM - 128 MB' USING NCHAR_CS) -
 ,TRANSLATE('Mem�ria SDRAM, 128MB de capacidade. Pode acessar dados a uma velocidade de at� 100 MHz, o que � 4 vezes mais r�pido como no padr�o DRAM. As vantagens do SDRAM s�o vis�veis. Est� dispon�vel para DIMM de 5 e 3.3 volts ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3359 -
 ,'PTB' -
 ,TRANSLATE('SDRAM - 16 MB' USING NCHAR_CS) -
 ,TRANSLATE('Upgrade de mem�ria SDRAM de 16 MB. Mem�ria de acesso rand�mico, din�mico e s�ncrono. Foi lan�ado ap�s o EDO. Sua arquitetura e opera��o s�o baseados no padr�o do DRAM, mas no SDRAM existe uma mudan�a que reduz muito tempo de recupera��o de dados. SDRAM � ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3088 -
 ,'PTB' -
 ,TRANSLATE('SDRAM - 32 MB' USING NCHAR_CS) -
 ,TRANSLATE('�dulo SDRAM com ECC - 32 MB de capacidade. SDRAM tem m�ltiplos bancos de mem�ria que podem trabalhar simultaneamente. Alternando entre os bancos permite um fluxo de dados cont�nu' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2276 -
 ,'PTB' -
 ,TRANSLATE('SDRAM - 48 MB' USING NCHAR_CS) -
 ,TRANSLATE('Mem�ria SIMM: 48MB de RAM. SDRAM pode operar em burst mode. Neste modo, quando um endere�o de um dado � acessado, um bloco inteiro de dados � recuperado ao inv�s de somente parte dele. Assume-se que o pr�ximo peda�o do dado que ser� requisitado ser� seque' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3086 -
 ,'PTB' -
 ,TRANSLATE('VRAM - 16 MB' USING NCHAR_CS) -
 ,TRANSLATE('�dulo de mem�ria RAM de v�deo Citrus - 16 MB de capacidade. VRAM � usado pelo sistema de v�deo do computador para armazenar informa��es e � reservada exclusivamente para opera��es de v�deo.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3091 -
 ,'PTB' -
 ,TRANSLATE('VRAM - 64 MB' USING NCHAR_CS) -
 ,TRANSLATE('M�dulo de mem�ria RAM de v�deo Citrus - 64 MB de capacidade. Fisicamente, VRAM parece com o DRAM adicionando-se um registrador. A caracter�stica especial do VRAM � que ele pode transferir uma linha inteira de dados (at� 256 bits) para este registrador em ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2395 -
 ,'PTB' -
 ,TRANSLATE('32MB Cache /M' USING NCHAR_CS) -
 ,TRANSLATE('em�ria cache de 32MB espelhad' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1755 -
 ,'PTB' -
 ,TRANSLATE('32MB Cache /NM' USING NCHAR_CS) -
 ,TRANSLATE('em�ria cache de 32MB n�o espelhad' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2406 -
 ,'PTB' -
 ,TRANSLATE('64MB Cache /M' USING NCHAR_CS) -
 ,TRANSLATE('em�ria cache de 64MB espelhad' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2404 -
 ,'PTB' -
 ,TRANSLATE('64MB Cache /NM' USING NCHAR_CS) -
 ,TRANSLATE('em�ria cache de 64MB n�o espelhada. Chips de mem�ria FPM s�o implementados em SIMM de 5 volts mas tamb�m em DIMM de 3.3 volts' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1770 -
 ,'PTB' -
 ,TRANSLATE('8MB Cache /NM' USING NCHAR_CS) -
 ,TRANSLATE('em�ria cache de 8MB n�o espelhada' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2412 -
 ,'PTB' -
 ,TRANSLATE('8MB EDO Memory' USING NCHAR_CS) -
 ,TRANSLATE('em�ria 8 MB 8x32 EDO SIM. EDO est� dispon�vel para SIMM e DIMM de 3.3 e 5 volts' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1787 -
 ,'PTB' -
 ,TRANSLATE('CPU D300' USING NCHAR_CS) -
 ,TRANSLATE('Dual CPU a 300MHZ. Para processamento leve apenas, ou servidor de arquivos com menos que 5 usu�rios concorrentes. Este produto provavelmente ficar� obsoleto em breve.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2439 -
 ,'PTB' -
 ,TRANSLATE('CPU D400' USING NCHAR_CS) -
 ,TRANSLATE('ual CPU a 400MHz. Bom pre�o e desempenho; para servidores de arquivos de LAN de tamanho m�dio (de at� 100 usu�rios concorrentes)' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1788 -
 ,'PTB' -
 ,TRANSLATE('CPU D600' USING NCHAR_CS) -
 ,TRANSLATE('ual CPU a 600MHz. Alta velocidade de clock; para servidores de WAN com carga pesada (at� 200 usu�rios concorrentes)' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2375 -
 ,'PTB' -
 ,TRANSLATE('GP 1024x768' USING NCHAR_CS) -
 ,TRANSLATE('Processador gr�fico, resolu��o de 1024 X 768 pixels. Conhecido pelo pre�o e desempenho em aplica��es de 2D e 3D em SPNIX v3.3 e v4.0. Duplica o campo de visualiza��o executando dois monitores com uma �nica placa. Dois monitores de 17 polegadas tem maior c' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2411 -
 ,'PTB' -
 ,TRANSLATE('GP 1280x1024' USING NCHAR_CS) -
 ,TRANSLATE('Processador gr�fico, resolu��o de 1280 X 1024 pixels. Top para aplica��es 3D a um pre�o m�dio. 15 milh�es de tri�ngulos sombreados de Gouraud por segundo, drives 3D otimizados para aplica��es MCAD e DCC,  com possibilidade de personaliza��o. ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1769 -
 ,'PTB' -
 ,TRANSLATE('GP 800x600' USING NCHAR_CS) -
 ,TRANSLATE('Processador gr�fico, resolu��o de 800 x 600 pixels. De grande utilidade para usu�rios de aplica��es 2D ou 3D. Alta performance nos drives em modelos altamente complexos. Libera o foco para a modelagem ao inv�s do processo de renderiza��o.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2049 -
 ,'PTB' -
 ,TRANSLATE('MB - S300' USING NCHAR_CS) -
 ,TRANSLATE('Placa-m�e, S�rie 300.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2751 -
 ,'PTB' -
 ,TRANSLATE(' MB - S450' USING NCHAR_CS) -
 ,TRANSLATE('Placa-m�e, S�rie 450.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3112 -
 ,'PTB' -
 ,TRANSLATE(' MB - S500' USING NCHAR_CS) -
 ,TRANSLATE('Placa-m�e, S�rie 500.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2752 -
 ,'PTB' -
 ,TRANSLATE(' MB - S550' USING NCHAR_CS) -
 ,TRANSLATE('Placa-m�e, S�rie 550.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2293 -
 ,'PTB' -
 ,TRANSLATE(' MB - S600' USING NCHAR_CS) -
 ,TRANSLATE('Placa-m�e, S�rie 600' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3114 -
 ,'PTB' -
 ,TRANSLATE(' MB - S900/650+' USING NCHAR_CS) -
 ,TRANSLATE('Placa-m�e, S�rie 900; placa-m�e padr�o para todos os modelos 650 e superiores.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3129 -
 ,'PTB' -
 ,TRANSLATE(' Sound Card STD' USING NCHAR_CS) -
 ,TRANSLATE('Placa de som - vers�o padr�o, com interface MIDI, line in/out, baixa imped�ncia para entrada de microfone.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2308 -
 ,'PTB' -
 ,TRANSLATE(' Video Card /E32' USING NCHAR_CS) -
 ,TRANSLATE('Placa de v�deo 3-D ELSA, com 32 MB de mem�ria.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3133 -
 ,'PTB' -
 ,TRANSLATE(' Video Card /32' USING NCHAR_CS) -
 ,TRANSLATE('Placa de v�deo, com 32 MB de mem�ria cache.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2496 -
 ,'PTB' -
 ,TRANSLATE(' WSP DA-130' USING NCHAR_CS) -
 ,TRANSLATE('rocessador para grandes storages DA-130' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2497 -
 ,'PTB' -
 ,TRANSLATE(' WSP DA-290' USING NCHAR_CS) -
 ,TRANSLATE('rocessador para grandes storages DA-290' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3108 -
 ,'PTB' -
 ,TRANSLATE(' KB E/EN' USING NCHAR_CS) -
 ,TRANSLATE('Teclado ergon�mico com duas �reas de teclas separadas, com almofada num�rica descart�vel. Disposi��o do teclado em modo americano.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3106 -
 ,'PTB' -
 ,TRANSLATE(' KB 101/EN' USING NCHAR_CS) -
 ,TRANSLATE('eclado extendido padr�o PC/AT (101/102 teclas). Disposi��o do teclado em modo americano' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2289 -
 ,'PTB' -
 ,TRANSLATE(' KB 101/ES' USING NCHAR_CS) -
 ,TRANSLATE('eclado extendido padr�o PC/AT (101/102 teclas). Disposi��o do teclado em modo espanhol' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3110 -
 ,'PTB' -
 ,TRANSLATE(' KB 101/FR' USING NCHAR_CS) -
 ,TRANSLATE('eclado extendido padr�o PC/AT (101/102 teclas). Disposi��o do teclado em modo franc�s' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3117 -
 ,'PTB' -
 ,TRANSLATE(' Mouse C/E' USING NCHAR_CS) -
 ,TRANSLATE('ouse ergon�mico sem fio. Com track-ball para maior conforto e f�cil utiliza��o' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2056 -
 ,'PTB' -
 ,TRANSLATE(' Mouse Pad /CL' USING NCHAR_CS) -
 ,TRANSLATE('Mouse pad padr�o, com logotipo da empresa.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2058 -
 ,'PTB' -
 ,TRANSLATE(' Mouse +WP' USING NCHAR_CS) -
 ,TRANSLATE('ombina��o de mouse com almofada para o pulso para maior conforto na digita��o e uso do mouse' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2761 -
 ,'PTB' -
 ,TRANSLATE(' Mouse +WP/CL' USING NCHAR_CS) -
 ,TRANSLATE('onjunto de mouse e almofada para o pulso com o logotipo da empresa' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2211 -
 ,'PTB' -
 ,TRANSLATE(' Wrist Pad' USING NCHAR_CS) -
 ,TRANSLATE('ira de espuma para sustentar os pulsos quando utilizando o teclado' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2944 -
 ,'PTB' -
 ,TRANSLATE(' Wrist Pad /CL' USING NCHAR_CS) -
 ,TRANSLATE('lmofada para pulso com logotipo da empresa' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1742 -
 ,'PTB' -
 ,TRANSLATE(' CD-ROM 500/16x' USING NCHAR_CS) -
 ,TRANSLATE('Drive de CD, somente para leitura, velocidade 16x, capacidade m�xima de 500MB.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2402 -
 ,'PTB' -
 ,TRANSLATE(' CD-ROM 600/E/24x' USING NCHAR_CS) -
 ,TRANSLATE('Drive de CD-ROM, externo, 600MB, velocidade de 24x (somente para leitura).' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2403 -
 ,'PTB' -
 ,TRANSLATE(' CD-ROM 600/I/24x' USING NCHAR_CS) -
 ,TRANSLATE('Drive de CD-ROM, interno, 600MB, velocidade de 24x (somente para leitura).' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1761 -
 ,'PTB' -
 ,TRANSLATE(' CD-ROM 600/I/32x' USING NCHAR_CS) -
 ,TRANSLATE('Drive de CD-ROM, interno, 600MB, velocidade de 32x (somente para leitura).' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2381 -
 ,'PTB' -
 ,TRANSLATE(' CD-ROM 8x' USING NCHAR_CS) -
 ,TRANSLATE('Gravador de CD, velocidade 8x para leitura.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2424 -
 ,'PTB' -
 ,TRANSLATE(' CDW 12/24' USING NCHAR_CS) -
 ,TRANSLATE('Gravador de CD, velocidade de 12x para escrita e de 24x para leitura. Aten��o: ficar� obsoleto em breve.; esta velocidade n�o � alta o suficiente e melhores alternativas est�o dispon�veis por pre�os razo�veis.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1781 -
 ,'PTB' -
 ,TRANSLATE(' CDW 20/48/E' USING NCHAR_CS) -
 ,TRANSLATE('Gravador de CD, velocidade de 48x para leitura e 20x para escrita.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2264 -
 ,'PTB' -
 ,TRANSLATE(' CDW 20/48/I' USING NCHAR_CS) -
 ,TRANSLATE('ravador de CD-ROM: velocidade de 20x para leitura e 48x para escrita (interno)' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2260 -
 ,'PTB' -
 ,TRANSLATE(' DFD 1.44/3.5' USING NCHAR_CS) -
 ,TRANSLATE('rive para disquete - 1.44MB - 3.5 polegadas' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2266 -
 ,'PTB' -
 ,TRANSLATE(' DVD 12x' USING NCHAR_CS) -
 ,TRANSLATE('rive de DVD-ROM: velocidade de 12x' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3077 -
 ,'PTB' -
 ,TRANSLATE(' DVD 8x' USING NCHAR_CS) -
 ,TRANSLATE('rive de DVD-ROM: velocidade de 8x. Ficar� obsoleto em breve..' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2259 -
 ,'PTB' -
 ,TRANSLATE(' FD 1.44/3.5' USING NCHAR_CS) -
 ,TRANSLATE('rive para disquete - 1.44 MB. Alta densidade - 3.5 polegada' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2261 -
 ,'PTB' -
 ,TRANSLATE(' FD 1.44/3.5/E' USING NCHAR_CS) -
 ,TRANSLATE('rive para disquete - 1.44 MB (alta densidade) - 3.5 polegadas (externo' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2374 -
 ,'PTB' -
 ,TRANSLATE(' Modem - C/100' USING NCHAR_CS) -
 ,TRANSLATE('abo para modem externo compat�vel com DOCSIS/EURODOCSIS 1.0/1.1' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2268 -
 ,'PTB' -
 ,TRANSLATE(' Modem - 56/H/E' USING NCHAR_CS) -
 ,TRANSLATE('Modem compat�vel com padr�o Hayes - 56kb por segundo, externo. Voltagem: 220V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3083 -
 ,'PTB' -
 ,TRANSLATE(' Modem - 56/H/I' USING NCHAR_CS) -
 ,TRANSLATE('Modem padr�o Hayes - 56kb por segundo, interno, para 3.5 polegadas.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3082 -
 ,'PTB' -
 ,TRANSLATE(' Modem - 56/90/E' USING NCHAR_CS) -
 ,TRANSLATE('Modem - 56kb, compat�vel com PCI Global v.90. Externo. Voltagem: 110V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2270 -
 ,'PTB' -
 ,TRANSLATE(' Modem - 56/90/I' USING NCHAR_CS) -
 ,TRANSLATE('Modem - 56kb, compat�vel com PCI Global v.90. Interno. Para 3.5 polegadas.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1740 -
 ,'PTB' -
 ,TRANSLATE(' TD 12GB/DAT' USING NCHAR_CS) -
 ,TRANSLATE('Drive de fita - capacidade de 12 Gb, formato DAT.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2409 -
 ,'PTB' -
 ,TRANSLATE(' TD 7GB/8' USING NCHAR_CS) -
 ,TRANSLATE('Drive de fita, capacidade de 7Gb, cartucho de fita de 8mm.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2262 -
 ,'PTB' -
 ,TRANSLATE(' ZIP 100' USING NCHAR_CS) -
 ,TRANSLATE('Drive de ZIP, capacidade de 100Mb (externo) mais cabo para conex�o em porta paralela.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2522 -
 ,'PTB' -
 ,TRANSLATE(' Battery - EL' USING NCHAR_CS) -
 ,TRANSLATE('ateria para notebooks com vida prolongada' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2278 -
 ,'PTB' -
 ,TRANSLATE(' Battery - NiHM' USING NCHAR_CS) -
 ,TRANSLATE('ateria NiHM recarreg�vel para notebooks' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2418 -
 ,'PTB' -
 ,TRANSLATE(' Battery Backup (DA-130)' USING NCHAR_CS) -
 ,TRANSLATE('arregador de bateria com indicadores atrav�s de LED' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2419 -
 ,'PTB' -
 ,TRANSLATE(' Battery Backup (DA-290)' USING NCHAR_CS) -
 ,TRANSLATE('arregador duplo de bateria com indicadores atrav�s de LEDs' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3097 -
 ,'PTB' -
 ,TRANSLATE(' Cable Connector - 32R' USING NCHAR_CS) -
 ,TRANSLATE('abo de conex�o - 32 pinos' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3099 -
 ,'PTB' -
 ,TRANSLATE(' Cable Harness' USING NCHAR_CS) -
 ,TRANSLATE('rendedor de cabos para organizar e agrupar fios' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2408 -
 ,'PTB' -
 ,TRANSLATE(' Cable PR/P/6' USING NCHAR_CS) -
 ,TRANSLATE('Cabo de impresssora Centronics 6ft padr�o, porta paralela.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2457 -
 ,'PTB' -
 ,TRANSLATE(' Cable PR/S/6' USING NCHAR_CS) -
 ,TRANSLATE('Cabo de impressora serial RS232 padr�o, 6 ft.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2380 -
 ,'PTB' -
 ,TRANSLATE(' Cable PR/15/P' USING NCHAR_CS) -
 ,TRANSLATE('abo de impressora paralelo 15' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2373 -
 ,'PTB' -
 ,TRANSLATE(' Cable RS232 10/AF' USING NCHAR_CS) -
 ,TRANSLATE('abo RS232 10ft com F/F e adaptadores 9F/25F' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1734 -
 ,'PTB' -
 ,TRANSLATE(' Cable RS232 10/AM' USING NCHAR_CS) -
 ,TRANSLATE('abo RS232 10ft com M/M e adaptadores 9M/25M' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1737 -
 ,'PTB' -
 ,TRANSLATE(' Cable SCSI 10/FW/ADS' USING NCHAR_CS) -
 ,TRANSLATE('1745	 Cable SCSI 20/WD->D' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2982 -
 ,'PTB' -
 ,TRANSLATE(' Drive Mount - A' USING NCHAR_CS) -
 ,TRANSLATE('3277	 Drive Mount - A/T' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2976 -
 ,'PTB' -
 ,TRANSLATE(' Drive Mount - D' USING NCHAR_CS) -
 ,TRANSLATE('3204	 Envoy DS	Docking Station' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2638 -
 ,'PTB' -
 ,TRANSLATE(' Envoy DS/E' USING NCHAR_CS) -
 ,TRANSLATE('ocking Station extendido' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3020 -
 ,'PTB' -
 ,TRANSLATE(' Envoy IC' USING NCHAR_CS) -
 ,TRANSLATE('Computador para Internet, Plug-and-Play.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1948 -
 ,'PTB' -
 ,TRANSLATE(' Envoy IC/58' USING NCHAR_CS) -
 ,TRANSLATE('omputador para Internet com modem de 58K' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3003 -
 ,'PTB' -
 ,TRANSLATE(' Laptop 128/12/56/v90/110' USING NCHAR_CS) -
 ,TRANSLATE('Notebook com mem�ria de 128MB, 12GB de disco, modem v90, fonte de 110V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2999 -
 ,'PTB' -
 ,TRANSLATE(' Laptop 16/8/110' USING NCHAR_CS) -
 ,TRANSLATE('Notebook com mem�ria de 16MB, 8GB de disco, fonte de 110V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3000 -
 ,'PTB' -
 ,TRANSLATE(' Laptop 32/10/56' USING NCHAR_CS) -
 ,TRANSLATE('Notebook com mem�ria de 32MB, 10GB de disco, modem de 56K, fonte 110V/220V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3001 -
 ,'PTB' -
 ,TRANSLATE(' Laptop 48/10/56/110' USING NCHAR_CS) -
 ,TRANSLATE('Notebook com mem�ria de 48MB, 10GB de disco, modem de 56K, fonte de 110V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3004 -
 ,'PTB' -
 ,TRANSLATE(' Laptop 64/10/56/220' USING NCHAR_CS) -
 ,TRANSLATE('Notebook com mem�ria de 64MB, 10GB de disco, modem de 56K, fonte de 220V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2377 -
 ,'PTB' -
 ,TRANSLATE(' PS 110V HS/US' USING NCHAR_CS) -
 ,TRANSLATE('onte el�trica de 110V' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3124 -
 ,'PTB' -
 ,TRANSLATE(' PS 110V /T' USING NCHAR_CS) -
 ,TRANSLATE('Fonte el�trica para PC em torre, 110V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1738 -
 ,'PTB' -
 ,TRANSLATE(' PS 110V /US' USING NCHAR_CS) -
 ,TRANSLATE('Fonte el�trica, 110V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3391 -
 ,'PTB' -
 ,TRANSLATE(' PS 110/220' USING NCHAR_CS) -
 ,TRANSLATE('onte el�trica - 100V/220V' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2299 -
 ,'PTB' -
 ,TRANSLATE(' PS 12V /P' USING NCHAR_CS) -
 ,TRANSLATE('onte el�trica - 12V port�til' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3123 -
 ,'PTB' -
 ,TRANSLATE(' PS 220V /D' USING NCHAR_CS) -
 ,TRANSLATE('Fonte el�trica, 220V, para computadores.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1748 -
 ,'PTB' -
 ,TRANSLATE(' PS 220V /EUR' USING NCHAR_CS) -
 ,TRANSLATE('onte el�trica de 220V - compatibilidade europ�i' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2387 -
 ,'PTB' -
 ,TRANSLATE(' PS 220V /FR' USING NCHAR_CS) -
 ,TRANSLATE('onte el�trica de 220V - compatibilidade frances' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2370 -
 ,'PTB' -
 ,TRANSLATE(' PS 220V /HS/FR' USING NCHAR_CS) -
 ,TRANSLATE('Fonte el�trica, 220V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2311 -
 ,'PTB' -
 ,TRANSLATE(' PS 220V /L' USING NCHAR_CS) -
 ,TRANSLATE('Fonte el�trica para notebooks, 220V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1733 -
 ,'PTB' -
 ,TRANSLATE(' PS 220V /UK' USING NCHAR_CS) -
 ,TRANSLATE('Fonte el�trica, 220V.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2878 -
 ,'PTB' -
 ,TRANSLATE(' Router - ASR/2W' USING NCHAR_CS) -
 ,TRANSLATE('oteador Especial ALS' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2879 -
 ,'PTB' -
 ,TRANSLATE(' Router - ASR/3W' USING NCHAR_CS) -
 ,TRANSLATE('oteador Especial AL' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2152 -
 ,'PTB' -
 ,TRANSLATE(' Router - DTMF4' USING NCHAR_CS) -
 ,TRANSLATE('3301	 Screws <B.28.P>	"Parafusos: lat�o, 28mm, tipo philips. Caixa pl�stica com 500.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3143 -
 ,'PTB' -
 ,TRANSLATE(' Screws <B.28.S>' USING NCHAR_CS) -
 ,TRANSLATE('Parafusos: lat�o, 28mm. Caixa pl�stica com 500.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2323 -
 ,'PTB' -
 ,TRANSLATE(' Screws <B.32.P>' USING NCHAR_CS) -
 ,TRANSLATE('Parafusos: lat�o, 32mm, tipo philips. Caixa pl�stica com 400.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3134 -
 ,'PTB' -
 ,TRANSLATE('Screws <B.32.S>' USING NCHAR_CS) -
 ,TRANSLATE('Parafusos: lat�o, 32mm. Caixa pl�stica com 400.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3139 -
 ,'PTB' -
 ,TRANSLATE(' Screws <S.16.S>' USING NCHAR_CS) -
 ,TRANSLATE('Parafusos: a�o, 16mm. Caixa de papel�o com 750.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3300 -
 ,'PTB' -
 ,TRANSLATE(' Screws <S.32.P>' USING NCHAR_CS) -
 ,TRANSLATE('Parafusos: lat�o, 32mm, tipo philips. Caixa pl�stica com 400.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2316 -
 ,'PTB' -
 ,TRANSLATE(' Screws <S.32.S>' USING NCHAR_CS) -
 ,TRANSLATE('Parafusos: lat�o, 32mm. Caixa pl�stica com 500.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3140 -
 ,'PTB' -
 ,TRANSLATE(' Screws <Z.16.S>' USING NCHAR_CS) -
 ,TRANSLATE('Parafusos: zinco, 16mm. Caixa de papel�o com 750.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2319 -
 ,'PTB' -
 ,TRANSLATE(' Screws <Z.24.S>' USING NCHAR_CS) -
 ,TRANSLATE('Parafusos: zinco, 24mm. Caixa de papel�o com 500.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2322 -
 ,'PTB' -
 ,TRANSLATE(' Screws <Z.28.P>' USING NCHAR_CS) -
 ,TRANSLATE('Parafusos: zinco, 28mm, tipo philips. Caixa de papel�o com 850.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3361 -
 ,'PTB' -
 ,TRANSLATE(' Spreadsheet - SSP/S 1.5' USING NCHAR_CS) -
 ,TRANSLATE('SmartSpread Spreadsheet, Standard Edition Version 1.5, para SPNIX Release 3.3. Inclui CD-ROM com o software e documenta��o online, manual, tutorial e licen�a.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3178 -
 ,'PTB' -
 ,TRANSLATE(' Spreadsheet - SSP/V 2.0' USING NCHAR_CS) -
 ,TRANSLATE('SmartSpread Spreadsheet, Professional Edition Version 2.0, para Vision Releases 11.1 e 11.2. Inclui CD-ROM com o software e documenta��o online, manual, tutorial e licen�a.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3255 -
 ,'PTB' -
 ,TRANSLATE(' Spreadsheet - SSS/CD 2.2B' USING NCHAR_CS) -
 ,TRANSLATE('SmartSpread Spreadsheet, Standard Edition, Beta Version 2.2, para SPNIX Release 4.1. Inclui somente o CD-ROM.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3179 -
 ,'PTB' -
 ,TRANSLATE(' Spreadsheet - SSS/S 2.1' USING NCHAR_CS) -
 ,TRANSLATE('SmartSpread Spreadsheet, Standard Edition Version 2.1, para SPNIX Release 4.0. Inclui CD-ROM com o software e documenta��o online, manual, tutorial e licen�a.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3262 -
 ,'PTB' -
 ,TRANSLATE(' Spreadsheet - SSS/S 2.2' USING NCHAR_CS) -
 ,TRANSLATE('SmartSpread Spreadsheet, Standard Edition Version 2.2, para SPNIX Release 4.1. Inclui CD-ROM com o software e documenta��o online, manual, tutorial e licen�a.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3256 -
 ,'PTB' -
 ,TRANSLATE(' Spreadsheet - SSS/V 2.0' USING NCHAR_CS) -
 ,TRANSLATE('SmartSpread Spreadsheet, Standard Edition Version 2.0, para Vision Release 11.0. Inclui CD-ROM com o software e documenta��o online, manual, tutorial e licen�a.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3197 -
 ,'PTB' -
 ,TRANSLATE(' Spreadsheet - SSS/V 2.1' USING NCHAR_CS) -
 ,TRANSLATE('SmartSpread Spreadsheet, Standard Edition Version 2.1, para Vision Release 11.1 and 11.2. Inclui CD-ROM com o software e documenta��o online, manual, tutorial e licen�a.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3260 -
 ,'PTB' -
 ,TRANSLATE(' Word Processing - SWP/S 4.4' USING NCHAR_CS) -
 ,TRANSLATE('SmartSpread Spreadsheet, Standard Edition Version 2.2, para SPNIX Release 4.x. Inclui CD-ROM com o software e documenta��o online, manual, tutorial e licen�a.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3182 -
 ,'PTB' -
 ,TRANSLATE(' Word Processing - SWP/V 4.5' USING NCHAR_CS) -
 ,TRANSLATE('SmartWord Word Processor, Professional Edition Version 4.5, para Vision Release 11.x. Inclui CD-ROM com o software e documenta��o online, manual, tutorial e licen�a.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3183 -
 ,'PTB' -
 ,TRANSLATE(' Word Processing - SWS/V 4.5' USING NCHAR_CS) -
 ,TRANSLATE('SmartWord Word Processor, Standard Edition Version 4.5, for Vision Release 11.x. Inclui o CD-ROM e licen�a.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1801 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 - AL' USING NCHAR_CS) -
 ,TRANSLATE('Sistema operacional: SPNIX V3.3 - licen�a adicional para administrador do sistema, incluindo acesso � rede.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1803 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 - DL' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V3.3 - com licen�a adicional para desenvolvedor' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1820 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 - NL' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V3.3 - com licen�a adicional para acesso � rede' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1799 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 - SL' USING NCHAR_CS) -
 ,TRANSLATE('Sistema operacional: SPNIX V3.3 - licen�a b�sica. Inclui 10 licen�as para administrador do sistema, desenvolvedores ou usu�rios. Mas nenhuma para rede.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1805 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 - UL/A' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V3.3 - com licen�a adicional para usu�rio classe A' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1806 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 - UL/C' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V3.3 - com licen�a adicional para usu�rio classe C' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1808 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 - UL/D' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V3.3 - com licen�a adicional para usu�rio classe D' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1804 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 - UL/N' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V3.3 - com licen�a adicional para usu�rio com acesso � rede' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2492 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 AU' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: upgrade do SPNIX V3.3 para V4.0 ; usu�rio classe A' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2493 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 C/DU' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: upgrade do SPNIX V3.3 para V4.0 ; usu�rio classe C ou D' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3290 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 DU' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: upgrade do SPNIX V3.3 para V4.0 ; licen�a de desenvolvedor' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2494 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 NU' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: upgrade do SPNIX V3.3 para V4.0 ; licen�a para acesso � rede' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2995 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 SAU' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: upgrade do SPNIX V3.3 para V4.0 ; licen�a para administrador do sistema' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2471 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX3.3 SU' USING NCHAR_CS) -
 ,TRANSLATE('perating System Software: SPNIX V3.3 - licen�a b�sica para upgrade para V4.0' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2452 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX4.0 - DL' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V4.0 - com licen�a adicional para desenvolvedor' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2470 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX4.0 - NL' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V4.0 - com licen�a adicional para acesso � rede' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2422 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX4.0 - SAL' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V4.0 - com licen�a adicional para o administrador do sistema incluindo acesso � rede' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1822 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX4.0 - SL' USING NCHAR_CS) -
 ,TRANSLATE('Sistema operacional: SPNIX V4.0 -licen�a B�sica. Inclui 10 licen�as para administradores do sistema, desenvolvedores ou usu�rios. Mas nenhuma para rede.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2464 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX4.0 - UL/A' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V4.0 - com licen�a adicional para usu�rio classe ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2468 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX4.0 - UL/C' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V4.0 - com licen�a adicional para usu�rio classe ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2467 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX4.0 - UL/D' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V4.0 - com licen�a adicional para usu�rio classe ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2462 -
 ,'PTB' -
 ,TRANSLATE(' SPNIX4.0 - UL/N' USING NCHAR_CS) -
 ,TRANSLATE('istema operacional: SPNIX V4.0 - com licen�a adicional para acesso � red' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1779 -
 ,'PTB' -
 ,TRANSLATE(' C for SPNIX3.3 - Doc' USING NCHAR_CS) -
 ,TRANSLATE('Documenta��o da linguagem de programa��o C, SPINIX V3.3' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3503 -
 ,'PTB' -
 ,TRANSLATE(' C for SPNIX3.3 - Seat/U' USING NCHAR_CS) -
 ,TRANSLATE('pgrade do software para programa��o em C da vers�o SPINIX V3.3 para v4.0 - mono-usu�rio' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1780 -
 ,'PTB' -
 ,TRANSLATE(' C for SPNIX3.3 - Sys' USING NCHAR_CS) -
 ,TRANSLATE('Software para programa��o em C para SPNIX V3.3 - compilador, bibliotecas e linker.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1778 -
 ,'PTB' -
 ,TRANSLATE(' C for SPNIX3.3 - 1 Seat' USING NCHAR_CS) -
 ,TRANSLATE('oftware para programa��o em C para SPNIX V3.3 - mono-usu�rio' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3502 -
 ,'PTB' -
 ,TRANSLATE(' C for SPNIX3.3 -Sys/U' USING NCHAR_CS) -
 ,TRANSLATE('Upgrade do software para programa��o em C da vers�o SPINIX V3.3 para v4.0 - compilador, bibliotecas e linker.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2371 -
 ,'PTB' -
 ,TRANSLATE(' C for SPNIX4.0 - Doc' USING NCHAR_CS) -
 ,TRANSLATE('Documenta��o da linguagem de programa��o C, SPINIX V4.0' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3501 -
 ,'PTB' -
 ,TRANSLATE(' C for SPNIX4.0 - Sys' USING NCHAR_CS) -
 ,TRANSLATE('Software para programa��o em C para SPNIX V4.0 - compilador, bibliotecas e linker' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2423 -
 ,'PTB' -
 ,TRANSLATE(' C for SPNIX4.0 - 1 Seat' USING NCHAR_CS) -
 ,TRANSLATE('oftware para programa��o em C para SPNIX V4.0 - mono-usu�rio' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1774 -
 ,'PTB' -
 ,TRANSLATE(' Base ISO CP - BL' USING NCHAR_CS) -
 ,TRANSLATE('acote de comunica��o ISO b�sico - licen�a b�sic' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1775 -
 ,'PTB' -
 ,TRANSLATE(' Client ISO CP - S' USING NCHAR_CS) -
 ,TRANSLATE('acote de comunica��o ISO - licen�a adicional para cliente SPNIX V3.3.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2416 -
 ,'PTB' -
 ,TRANSLATE(' Client ISO CP - S' USING NCHAR_CS) -
 ,TRANSLATE('acote de comunica��o ISO - licen�a adicional para cliente SPNIX V4.0' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2417 -
 ,'PTB' -
 ,TRANSLATE(' Client ISO CP - V' USING NCHAR_CS) -
 ,TRANSLATE('acote de comunica��o ISO - licen�a adicional para cliente Vision' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3250 -
 ,'PTB' -
 ,TRANSLATE(' Graphics - DIK' USING NCHAR_CS) -
 ,TRANSLATE('Kit Graphics: pacote gr�fico para sistemas Vision, com op��es nos formatos GIF, JPG, e BMP.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3172 -
 ,'PTB' -
 ,TRANSLATE(' Graphics - DIK+' USING NCHAR_CS) -
 ,TRANSLATE('Kit Graphics: inclui ferramentas avan�adas para desenho em 3-D, sombreamento e fontes de caracteres extendidas.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3173 -
 ,'PTB' -
 ,TRANSLATE(' Graphics - SA' USING NCHAR_CS) -
 ,TRANSLATE('Kit Graphics: SmartArt. Pacote gr�fico profissional para SPNIX com v�rios estilos de linha, texturas, formas e s�mbolos.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2004 -
 ,'PTB' -
 ,TRANSLATE(' IC Browser - S' USING NCHAR_CS) -
 ,TRANSLATE('C Web Browser para SPNIX. Browser com capacidade para email' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3101 -
 ,'PTB' -
 ,TRANSLATE(' IC Browser - V' USING NCHAR_CS) -
 ,TRANSLATE('C Web Browser para Vision com manual. Browser com capacidade para email' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2005 -
 ,'PTB' -
 ,TRANSLATE(' IC Browser Doc - S' USING NCHAR_CS) -
 ,TRANSLATE('Documenta��o para IC Web Browser para SPNIX. Inclui manual de instala��o, guia de administra��o do servidor de email e guia de refer�ncia r�pida para o usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2449 -
 ,'PTB' -
 ,TRANSLATE(' OSI 1-4/IL' USING NCHAR_CS) -
 ,TRANSLATE('amadas 1 a 4 OSI - licen�a incrementa' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1794 -
 ,'PTB' -
 ,TRANSLATE(' OSI 8-16/IL' USING NCHAR_CS) -
 ,TRANSLATE('amadas 8 a 16 OSI - licen�a incrementa' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3252 -
 ,'PTB' -
 ,TRANSLATE(' Project Management - S3.3' USING NCHAR_CS) -
 ,TRANSLATE('Project Management para SPNIX V3.3. Inclui interface por linha de comando ou gr�fica com textos, gr�ficos, planilhas e relat�rios personalizados.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3175 -
 ,'PTB' -
 ,TRANSLATE(' Project Management - S4.0' USING NCHAR_CS) -
 ,TRANSLATE('Project Management para SPNIX V4.0. Inclui interface por linha de comando ou gr�fica com textos, gr�ficos, planilhas e relat�rios personalizados.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3251 -
 ,'PTB' -
 ,TRANSLATE(' Project Management - V' USING NCHAR_CS) -
 ,TRANSLATE('Project Management para Vision. Inclui interface por linha de comando ou gr�fica com textos, gr�ficos, planilhas e relat�rios personalizados.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3171 -
 ,'PTB' -
 ,TRANSLATE(' Smart Suite - S3.3/EN' USING NCHAR_CS) -
 ,TRANSLATE('Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) para SPNIX Version 3.3. Software em ingl�s e manuais de usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3248 -
 ,'PTB' -
 ,TRANSLATE(' Smart Suite - S4.0/DE' USING NCHAR_CS) -
 ,TRANSLATE('Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) para SPNIX V4.0. Software em alem�o e manuais de usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3253 -
 ,'PTB' -
 ,TRANSLATE(' Smart Suite - S4.0/EN' USING NCHAR_CS) -
 ,TRANSLATE('Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) para SPNIX V4.0. Software em ingl�s e manuais de usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3245 -
 ,'PTB' -
 ,TRANSLATE(' Smart Suite - S4.0/FR' USING NCHAR_CS) -
 ,TRANSLATE('Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) para SPNIX V4.0. Software em franc�s e manuais de usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3246 -
 ,'PTB' -
 ,TRANSLATE(' Smart Suite - S4.0/SP' USING NCHAR_CS) -
 ,TRANSLATE('Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) para SPNIX V4.0. Software em espanhol e manuais de usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3247 -
 ,'PTB' -
 ,TRANSLATE(' Smart Suite - V/DE' USING NCHAR_CS) -
 ,TRANSLATE('Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) para Vision. Software em alem�o e manuais de usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3176 -
 ,'PTB' -
 ,TRANSLATE(' Smart Suite - V/EN' USING NCHAR_CS) -
 ,TRANSLATE('Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) para Vision. Software em ingl�s e manuais de usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3177 -
 ,'PTB' -
 ,TRANSLATE(' Smart Suite - V/FR' USING NCHAR_CS) -
 ,TRANSLATE('Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) para Vision. Software em franc�s e manuais de usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3170 -
 ,'PTB' -
 ,TRANSLATE(' Smart Suite - V/SP' USING NCHAR_CS) -
 ,TRANSLATE('Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) para Vision. Software em espanhol e manuais de usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3257 -
 ,'PTB' -
 ,TRANSLATE(' Web Browser - SB/S 2.1' USING NCHAR_CS) -
 ,TRANSLATE('it Web Browser: SmartBrowse V2.1 para SPNIX V3.3. Inclui arquivos de ajuda sens�vel ao contexto e documenta��o online' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3362 -
 ,'PTB' -
 ,TRANSLATE(' Web Browser - SB/S 4.0' USING NCHAR_CS) -
 ,TRANSLATE('it Web Browser: SmartBrowse V4.0 para SPNIX V4.0. Inclui arquivos de ajuda sens�vel ao contexto e documenta��o online' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3258 -
 ,'PTB' -
 ,TRANSLATE(' Web Browser - SB/V 1.0' USING NCHAR_CS) -
 ,TRANSLATE('it Web Browser: SmartBrowse V2.1 para Vision. Inclui arquivos de ajuda sens�vel ao contexto e documenta��o online' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1825 -
 ,'PTB' -
 ,TRANSLATE(' X25 - 1 Line License' USING NCHAR_CS) -
 ,TRANSLATE('sistema de controle de acesso X25, mono-usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2779 -
 ,'PTB' -
 ,TRANSLATE(' Desk - OS/O/F' USING NCHAR_CS) -
 ,TRANSLATE('Mesa de carvalho estilo executivo com gaveta. O revestimento final � personalizado quando requisitado, claro ou escuro, natural.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2231 -
 ,'PTB' -
 ,TRANSLATE(' Desk - S/V' USING NCHAR_CS) -
 ,TRANSLATE('Mesa feita sob medida. O revestimento final depende do estoque da �poca, incluindo carvalho, cereja, e mogno.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2350 -
 ,'PTB' -
 ,TRANSLATE(' Desk - W/48' USING NCHAR_CS) -
 ,TRANSLATE('esa de 48 polegadas' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2351 -
 ,'PTB' -
 ,TRANSLATE(' Desk - W/48/R' USING NCHAR_CS) -
 ,TRANSLATE('esa de 60 polegadas' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2335 -
 ,'PTB' -
 ,TRANSLATE(' Mobile phone' USING NCHAR_CS) -
 ,TRANSLATE('Celular com bateria de baixo consumo. Leve, dobr�vel com encaixe para fone de ouvido e compartimento para bateria extra.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3337 -
 ,'PTB' -
 ,TRANSLATE(' Mobile Web Phone' USING NCHAR_CS) -
 ,TRANSLATE('elular incluindo taxa mensal para acesso � Web. Capa de couro com clips para prender � cintura' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2337 -
 ,'PTB' -
 ,TRANSLATE(' Business Cards - 1000/2L' USING NCHAR_CS) -
 ,TRANSLATE('Caixa de cart�o de apresenta��o, quantidade de 1000. Duas faces com diferentes idiomas em cada lado. Envie o formul�rio com todos os campos com asterisco preenchidos e indica um segundo idioma (ingl�s estar� sempre no lado 1).' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2536 -
 ,'PTB' -
 ,TRANSLATE(' Business Cards - 250/2L' USING NCHAR_CS) -
 ,TRANSLATE('Caixa de cart�o de apresenta��o, quantidade de 250. Duas faces com diferentes idiomas em cada lado. Envie o formul�rio com todos os campos com asterisco preenchidos e indica um segundo idioma (ingl�s estar� sempre no lado 1).' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2537 -
 ,'PTB' -
 ,TRANSLATE(' Business Cards Box - 1000' USING NCHAR_CS) -
 ,TRANSLATE('Caixa de cart�o de apresenta��o, quantidade de 1000. Envie o formul�rio com todos os campos com asterisco preenchidos.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2336 -
 ,'PTB' -
 ,TRANSLATE(' Business Cards Box - 250' USING NCHAR_CS) -
 ,TRANSLATE('Caixa de cart�o de apresenta��o, quantidade de 250. Envie o formul�rio com todos os campos com asterisco preenchidos.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3150 -
 ,'PTB' -
 ,TRANSLATE(' Card Holder - 25' USING NCHAR_CS) -
 ,TRANSLATE('orta-cart�es de pl�stico com o logotipo da empresa. Guarda at� 25 cart�es dependendo da espessura dos mesmos' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3225 -
 ,'PTB' -
 ,TRANSLATE(' Card Organizer - 1000' USING NCHAR_CS) -
 ,TRANSLATE('Porta-cart�es com divisores em ordem alfab�tica; capacidade para 1000. Para mesa, com tampa na cor cinza e base preta. A tampa � remov�vel permitindo guard�-lo dentro da gaveta.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3224 -
 ,'PTB' -
 ,TRANSLATE(' Card Organizer - 250' USING NCHAR_CS) -
 ,TRANSLATE('Suporte port�til para cart�es de apresenta��o, capacidade de 250 cart�es. Abas opcionais do alfabeto. Pode-se especificar a cor                                 da tampa quando for requisitar (marrom, bege, preto e cinza claro).' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2144 -
 ,'PTB' -
 ,TRANSLATE(' Card Organizer Cover' USING NCHAR_CS) -
 ,TRANSLATE('ampa extra para o porta-cart�es de mesa. Cinza ou transparente' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2783 -
 ,'PTB' -
 ,TRANSLATE(' Clips - Paper' USING NCHAR_CS) -
 ,TRANSLATE('lips para papel. 10 caixas com 100 cada.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2810 -
 ,'PTB' -
 ,TRANSLATE(' Inkvisible Pens' USING NCHAR_CS) -
 ,TRANSLATE('Caneta Rollerball com ponta de alta precis�o. Embalagem com 4: preta, azul, vermelha e verde.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3515 -
 ,'PTB' -
 ,TRANSLATE(' Lead Replacement' USING NCHAR_CS) -
 ,TRANSLATE('Grafite para lapiseira. Cada pacote contem 25 e uma borracha extra. Dispon�vel em 3 tamanhos: 5mm, 7mm e 9 mm .' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3511 -
 ,'PTB' -
 ,TRANSLATE(' Paper - HQ Printer' USING NCHAR_CS) -
 ,TRANSLATE('apel para impressoras laser e a jato de tinta. Testados contra atolamento de papel. Tamanho: 8 .5 x 11 polegadas' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2339 -
 ,'PTB' -
 ,TRANSLATE(' Paper - Std Printer' USING NCHAR_CS) -
 ,TRANSLATE('apel para impressora a laser. Tamanho 8.5 x 11 polegadas' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2091 -
 ,'PTB' -
 ,TRANSLATE(' Paper Tablet LW 8 1/2 x 11' USING NCHAR_CS) -
 ,TRANSLATE('Bloco de papel branco, com linhas, tamanho 8 .5 x 11 polegadas.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2808 -
 ,'PTB' -
 ,TRANSLATE(' Paper Tablet LY 8 1/2 x 11' USING NCHAR_CS) -
 ,TRANSLATE('Bloco de papel amarelo, com linhas, tamanho 8 .5 x 11 polegadas.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2870 -
 ,'PTB' -
 ,TRANSLATE(' Pencil - Mech' USING NCHAR_CS) -
 ,TRANSLATE('Lapiseira ergon�mica para melhor conforto. Dispon�vel em 3 tamamhos: 5mm, 7mm e 9 mm.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3208 -
 ,'PTB' -
 ,TRANSLATE(' Pencils - Wood' USING NCHAR_CS) -
 ,TRANSLATE('Caixa com 2 d�zias de l�pis. Especificar o tipo quando solicitar: 2H, H, HB, B.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2093 -
 ,'PTB' -
 ,TRANSLATE(' Pens - 10/FP' USING NCHAR_CS) -
 ,TRANSLATE('Caneta com tinta resistente. Ponta fina. Caixa com um s� cor: preta, azul e vermelha ou com cores sortidas: 6 pretas, 3 azuis e 1 vermelha.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3051 -
 ,'PTB' -
 ,TRANSLATE(' Pens - 10/MP' USING NCHAR_CS) -
 ,TRANSLATE('Caneta com tinta resistente. Ponta m�dia. Caixa com uma s� cor: preta, azul e vermelha ou com cores sortidas: 6 pretas, 3 azuis e 1 vermelha.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3209 -
 ,'PTB' -
 ,TRANSLATE(' Sharpener - Pencil' USING NCHAR_CS) -
 ,TRANSLATE('pontador de l�pis el�trico. P�s de borracha antiderrapantes.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3216 -
 ,'PTB' -
 ,TRANSLATE(' Manual - Vision Net6.3' USING NCHAR_CS) -
 ,TRANSLATE('anual de refer�ncia Vision Networking V6.3. Vers�o n�o americana com encripta��o b�sica' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3163 -
 ,'PTB' -
 ,TRANSLATE(' Manual - Vision Net6.3/US' USING NCHAR_CS) -
 ,TRANSLATE('anual de refer�ncia Vision Networking V6.3. Vers�o americana com encripta��o avan�ada' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3220 -
 ,'PTB' -
 ,TRANSLATE(' Manual - Vision OS/1.2' USING NCHAR_CS) -
 ,TRANSLATE('Manual de refer�ncia Vision Operating System V1.2. Instala��o completa, configura��o, gerenciamento e informa��es para melhorar a performance para administra��o de sistemas Vision. Este manual substitui os manuais individuais das vers�es 2.0 e 2.1.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3167 -
 ,'PTB' -
 ,TRANSLATE(' Manual - Vision OS/2.x' USING NCHAR_CS) -
 ,TRANSLATE('Manuais de refer�ncia Vision Operating System V2.0/2.1/2/3. Instala��o completa, configura��o, gerenciamento e informa��es para melhorar a performance para administra��o de sistemas Vision. Este manual substitui os manuais individuais das vers�es 2.0 e 2.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2986 -
 ,'PTB' -
 ,TRANSLATE(' Manual - Vision OS/2x +' USING NCHAR_CS) -
 ,TRANSLATE('anuais para sistema operacional Vision V2.x e Vision Office Suite' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (3165 -
 ,'PTB' -
 ,TRANSLATE(' Manual - Vision Tools2.0' USING NCHAR_CS) -
 ,TRANSLATE('Manual de refer�ncia Vision Business Tools Suite V2.0. Inclui instala��o, configura��o e guia do usu�rio.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1729 -
 ,'PTB' -
 ,TRANSLATE(' Chemicals - RCP' USING NCHAR_CS) -
 ,TRANSLATE('olos tratados quimicamente para limpeza' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2340 -
 ,'PTB' -
 ,TRANSLATE(' Chemicals - SW' USING NCHAR_CS) -
 ,TRANSLATE('aterial tratado quimicamente para remo��o de eletricidade est�tica' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2365 -
 ,'PTB' -
 ,TRANSLATE(' Chemicals - TCS' USING NCHAR_CS) -
 ,TRANSLATE('olhas de papel tratadas quimicamente para limpeza de tape drives' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1940 -
 ,'PTB' -
 ,TRANSLATE(' ESD Bracelet/Clip' USING NCHAR_CS) -
 ,TRANSLATE('racelete para descarga el�trica com um prendedor jacar� que facilita a conex�o com o gabinete ou outro ponto terra' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2631 -
 ,'PTB' -
 ,TRANSLATE(' ESD Bracelet/QR' USING NCHAR_CS) -
 ,TRANSLATE('racelete para descarga el�trica: duas pe�as. Uma pe�a fica presa no gabinete atrav�s de parafusos e a outra no bracelete. Extremidades adicionais dispon�veis' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (1910 -
 ,'PTB' -
 ,TRANSLATE(' FG Stock - H' USING NCHAR_CS) -
 ,TRANSLATE('olhas de fibra de vidro - espessura de 1 polegada' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2594 -
 ,'PTB' -
 ,TRANSLATE(' FG Stock - L' USING NCHAR_CS) -
 ,TRANSLATE('Folhas de fibra de vidro - leves, para isolamento t�rmico, espessura de 1 polegada.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2030 -
 ,'PTB' -
 ,TRANSLATE(' Latex Gloves' USING NCHAR_CS) -
 ,TRANSLATE('Luvas de l�tex. Resistente, seguro, com textura diferenciada nos dedos e polegar. Imperme�veis e anti-choques de at� 220V/2amp�res, 110V/5 amp�res. � prova de �cido por at� 5 minutos.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2725 -
 ,'PTB' -
 ,TRANSLATE(' Machine Oil' USING NCHAR_CS) -
 ,TRANSLATE('leo de m�quina para a lubrifica��o de portas e de corredi�as do CD-ROM. Fluxo de sa�da ajust�vel' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2782 -
 ,'PTB' -
 ,TRANSLATE(' PC Bag - C/S' USING NCHAR_CS) -
 ,TRANSLATE('Mochila de lona para notebooks com bolsos para manuais, acess�rios e pap�is. Al�as ajust�veis e bolso remov�vel para fonte e cabos. ' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2722 -
 ,'PTB' -
 ,TRANSLATE(' PC Bag - L/D' USING NCHAR_CS) -
 ,TRANSLATE('Maleta de couro preta para notebooks - capacidade para 2 notebooks com bolsos para manuais, acess�rios e pap�is. Al�as ajust�veis e bolso remov�vel para fonte e cabos. Al�as mais largas para maior conforto dos ombros.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2721 -
 ,'PTB' -
 ,TRANSLATE(' PC Bag - L/S' USING NCHAR_CS) -
 ,TRANSLATE('Maleta de couro preta para notebooks com bolsos para manuais, acess�rios e pap�is. Al�as ajust�veis e bolso remov�vel para fonte e cabos. Al�as mais largas para maior conforto dos ombros.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3187 -
 ,'PTB' -
 ,TRANSLATE(' Plastic Stock - B/HD' USING NCHAR_CS) -
 ,TRANSLATE('Folhas de pl�stico - azul, alta densidade.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3189 -
 ,'PTB' -
 ,TRANSLATE(' Plastic Stock - G' USING NCHAR_CS) -
 ,TRANSLATE('Folhas de pl�stico - verde, densidade padr�o.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3191 -
 ,'PTB' -
 ,TRANSLATE(' Plastic Stock - O' USING NCHAR_CS) -
 ,TRANSLATE('Folhas de pl�stico - laranja, densidade padr�o.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2330 -
 ,'PTB' -
 ,TRANSLATE(' Plastic Stock - R' USING NCHAR_CS) -
 ,TRANSLATE('Folhas de pl�stico - vermelho, qualidade padr�o.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (3193 -
 ,'PTB' -
 ,TRANSLATE(' Plastic Stock - W/HD' USING NCHAR_CS) -
 ,TRANSLATE('Folhas de pl�stico - branco, alta densidade.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2326 -
 ,'PTB' -
 ,TRANSLATE(' Plastic Stock - Y' USING NCHAR_CS) -
 ,TRANSLATE('Folhas de pl�stico - amarelo, qualidade padr�o.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (2334 -
 ,'PTB' -
 ,TRANSLATE(' Resin' USING NCHAR_CS) -
 ,TRANSLATE('esina sint�tica para prop�sitos gerais' USING NCHAR_CS));

INSERT INTO product_descriptions VALUES (2596 -
 ,'PTB' -
 ,TRANSLATE(' SS Stock - 1mm' USING NCHAR_CS) -
 ,TRANSLATE('Folhas de a�o inoxid�vel - 3mm. Pode ser pr�-perfurado para o modelo padr�o de placa-m�e e de bateria. Utilize o modelo apropriado ao identificar o n�mero do modelo, coloca��o e tamanho da folha.' USING NCHAR_CS)); 
INSERT INTO product_descriptions VALUES (1912 -
 ,'PTB' -
 ,TRANSLATE(' SS Stock - 3mm' USING NCHAR_CS) -
 ,TRANSLATE('Folhas de a�o inoxid�vel - 3mm. Pode ser pr�-perfurado para o modelo padr�o de fonte el�trica. Utilize o modelo apropriado ao identificar o n�mero do modelo, coloca��o e tamanho da folha.' USING NCHAR_CS));

commit;
set define on
