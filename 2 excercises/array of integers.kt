fun main() {
    val inputArray = arrayOf(1, 2, 1)
    val elemToReplace = 1
    val substitutionElem = 3
    val result = arrayReplace(inputArray, elemToReplace, substitutionElem)
    println(result.joinToString(", "))
}

fun arrayReplace(inputArray: Array<Int>, elemToReplace: Int, substitutionElem: Int): Array<Int> {
    // Crear un nuevo arreglo para almacenar el resultado
    val resultArray = mutableListOf<Int>()

    // Iterar sobre el arreglo de entrada
    for (num in inputArray) {
        // Si el elemento coincide con elemToReplace, agregar substitutionElem al resultado
        if (num == elemToReplace) {
            resultArray.add(substitutionElem)
        } else {
            // De lo contrario, agregar el elemento original al resultado
            resultArray.add(num)
        }
    }

    // Convertir la lista de resultados en un arreglo y devolverlo
    return resultArray.toTypedArray()
}
