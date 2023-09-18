fun main() {
    val inputArray = arrayOf("aba", "aa", "ad", "vcd", "aba")
    val result = allLongestStrings(inputArray)
    println(result.joinToString(", "))
}

fun allLongestStrings(inputArray: Array<String>): Array<String> {
    val longestStrings = mutableListOf<String>()
    var maxLength = 0

    // Encontrar la longitud máxima de las cadenas en inputArray
    for (str in inputArray) {
        if (str.length > maxLength) {
            maxLength = str.length
        }
    }

    // Agregar las cadenas con la longitud máxima a longestStrings
    for (str in inputArray) {
        if (str.length == maxLength) {
            longestStrings.add(str)
        }
    }

    // Convertir la lista de cadenas en un arreglo de cadenas
    return longestStrings.toTypedArray()
}
