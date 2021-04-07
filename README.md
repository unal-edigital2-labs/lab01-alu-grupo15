# lab05 : Unidad de suma, resta, multiplicación, división y visualización BCD
## Introducción


Para este paquete de trabajo, deben estar inscrito en un grupo y clonar la información del siguiente link [WP05](https://classroom.github.com/g/dHrBou9a). Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación deben estar diligencia en el archivo README.md del repositorio clonado.

Una vez clone el repositorio, realice lo siguiente:


## descipción 
La unidad aritmética, es tal que cuenta con componentes para realizar operaciones aritméticas. cada operación aritmética es ejecutada acuerdo al código de la operación. 

Como ejercicio académico, se propone construye una unidad con 4 operaciones aritméticas: suma, resta, multiplicación y división.  de igual manera, el resultados se visualiza en los display de siete segmentos. El flujo de datos y la selección de la operación se realiza acorde a la señal opcode, y segun la siguiente tabla:


opcode | operación  enteros positivos
00| suma
01| resta 
10|  multiplicación
11| división 

Por lo tanto, la unidad debe contar con:

1. Los dos puertos de entrada A y B. cada uno de  3 bits.
2. La señal `opcode` de dos bits, para configurar la operación que se realiza con los datos de `portA` y `portB`.
3. La a visualización de unidad debe tener las salidas de los 4 ánodos, `An`  y las 7 señales de los cátodos, `sseg`.
4. Para las FSM  y las visualización dinámica, se debe incluir la señal de `clk` de entrada.
5. la señal de reset del sistema

## Diagrama de caja negra

Según las especificaciones anteriormente descrita, la caja funcional de la unidad aritmética propuesta es:

![caja negra](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab06_Unidad_aritmetica/doc/cajanegra.png)


## Diagrama estructural

![estructural](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab06_Unidad_aritmetica/doc/diagraEstructural.png)

El diagrama estructural, se soporta en los componentes desarrollados en los anteriores laboratorios. De esta manera,  tanto el sumador, el multiplicador  y el Display, son tomados de los lab2, lab5 y lab4  respectivamente. Adicional a la estructura de cada operación se encuentra el decodificador  y el multiplexador.

## Entregables

1. Definir el diagrama estructurar interno de cada bloque funcionar 
2. Descargar la estructura propuesta de la  Unidad Aritmética del paquete de trabajo [WP05](https://classroom.github.com/g/dHrBou9a) Este proyecto cuenta con el archivo `alu.v` y, tiene la carpeta `src` que cuenta con las 5 carpetas de cada componente.
3. Implementar `alu.v` en la FPGA, y  comprobar el funcionamiento  de la suma la multiplicación y la visualización
4. Incluir el  HDL para le divisor  realizado en el ejercicio anterior, en la carpeta `src/divisor`  y, adicione los archivos e instanciar el bloque divisor.
5. Diseñar el bloque restador, adicionar dicho bloque a la respectiva carpeta e instanciar el modulo en `alu.v`.
6. Realizar el testbench del bloque alu.
7. implementar el sistema completo en la FPGA remota
8. hacer la documentación respectiva en el archivo README
  
## Explicación del Código

DIVISOR

 Para la realización del divisor usamos 5 entradas y una salida, entre las entradas se encuentra MR y MD, divisor y dividendo respectivamente cada uno de 3 bits, tenemos “init” que indicará cuando se inicia la operación, “clk” que permitirá que la ALU en conjunto con las operaciones sea síncrona  y “reset” que permitirá reinicializar las variables, finalmente cómo salida tenemos el registro A que nos guardará el resultado de la operación, esta salida es de 6 bits. 
A continuación, indicamos los registros y los Wire que se usarán en la implementación. 

Antes de realizar la máquina de estados generamos los bloques de comparación, desplazamiento de los registros A y B, para esto si “rst” es 1, A toma el valor de 3 bits en 0 concatenados con el valor de MD, por otra parte se obtiene el complemento a 2 de B y se le asigna a “count” un valor de 3 ya que este indicara el final de la operación.  Finalmente se genera el bloque add. 

Finalmente se da inicio a la máquina de estados finitos, que cuenta con 8 estados, la maquina de estados finitos se construyó haciendo uso de casos. 

MÚLTIPLICADOR
 
SUMA

 La suma es la operación más sencilla de la ALU, cómo en las otras se manejan 4 entradas y una salida, las entradas de 3 bits y la salida 6 bits.  En el posedge del clk una vez se indique mediante “init” que se va a operar una suma la salida toma el valor de la adición entre Xi y Yi. 
 
RESTA

En el caso de la resta usamos 4 entradas y una salida, al igual que en el divisor tendremos dos entradas de dos bits que son los números que deseamos operar y una salida de 6 bits donde se registrará el resultado de la operación.  A continuación, se inicializa el registro y el wire que se usaran. 

Se trabaja en este caso con el complemento a 2 de yi que es el sustraendo, teniendo en cuenta que el resultado de una resta debe ser siempre inferior o igual a número de bits de las entradas, por esta razón en nuestra salida, concatenamos el resultado con 3 bits que se encuentran en 0. 

Finalmente se debe aclarar que nuestra resta esta limitada para que únicamente se pueda realizar si el minuendo es mayor que el sustraendo de manera que no se de cómo resultado un número negativo. 
