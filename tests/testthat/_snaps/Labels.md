# labels

    Code
      str(set_labels(datos, dict = dict))
    Output
      'data.frame':	10 obs. of  5 variables:
       $ SEXO  : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Sexo de la persona"
        ..- attr(*, "labels")= Named num [1:2] 1 2
        .. ..- attr(*, "names")= chr [1:2] "Hombre" "Mujer"
       $ Sexo2 : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Sexo de la persona"
        ..- attr(*, "labels")= Named num [1:2] 1 2
        .. ..- attr(*, "names")= chr [1:2] "Hombre" "Mujer"
       $ Sexo3 : num  1 1 1 1 1 2 2 2 2 2
       $ ESTADO: num  1 1 1 1 2 2 2 2 3 3
        ..- attr(*, "label")= chr "Estado marital de la persona"
        ..- attr(*, "labels")= Named num [1:3] 1 2 3
        .. ..- attr(*, "names")= chr [1:3] "Soltero" "Casado" "Viudo"
       $ Altura: num  1 1 1 1 2 2 2 2 3 3

---

    Code
      str(setLabels(datos, dict = dict))
    Condition
      [1m[33mWarning[39m:[22m
      [1m[22m`setLabels()` was deprecated in endomer 0.1.1.
      [36mℹ[39m Please use `set_labels()` instead.
    Output
      'data.frame':	10 obs. of  5 variables:
       $ SEXO  : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Sexo de la persona"
        ..- attr(*, "labels")= Named num [1:2] 1 2
        .. ..- attr(*, "names")= chr [1:2] "Hombre" "Mujer"
       $ Sexo2 : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Sexo de la persona"
        ..- attr(*, "labels")= Named num [1:2] 1 2
        .. ..- attr(*, "names")= chr [1:2] "Hombre" "Mujer"
       $ Sexo3 : num  1 1 1 1 1 2 2 2 2 2
       $ ESTADO: num  1 1 1 1 2 2 2 2 3 3
        ..- attr(*, "label")= chr "Estado marital de la persona"
        ..- attr(*, "labels")= Named num [1:3] 1 2 3
        .. ..- attr(*, "names")= chr [1:3] "Soltero" "Casado" "Viudo"
       $ Altura: num  1 1 1 1 2 2 2 2 3 3

---

    Code
      str(set_labels(datos, dict = dict, vars = c("SEXO")))
    Output
      'data.frame':	10 obs. of  5 variables:
       $ SEXO  : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Sexo de la persona"
        ..- attr(*, "labels")= Named num [1:2] 1 2
        .. ..- attr(*, "names")= chr [1:2] "Hombre" "Mujer"
       $ Sexo2 : num  1 1 1 1 1 2 2 2 2 2
       $ Sexo3 : num  1 1 1 1 1 2 2 2 2 2
       $ ESTADO: num  1 1 1 1 2 2 2 2 3 3
       $ Altura: num  1 1 1 1 2 2 2 2 3 3

---

    Code
      str(set_labels(datos, dict = dict, ignore_case = T))
    Output
      'data.frame':	10 obs. of  5 variables:
       $ SEXO  : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Sexo de la persona"
        ..- attr(*, "labels")= Named num [1:2] 1 2
        .. ..- attr(*, "names")= chr [1:2] "Hombre" "Mujer"
       $ Sexo2 : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Sexo de la persona"
        ..- attr(*, "labels")= Named num [1:2] 1 2
        .. ..- attr(*, "names")= chr [1:2] "Hombre" "Mujer"
       $ Sexo3 : num  1 1 1 1 1 2 2 2 2 2
       $ ESTADO: num  1 1 1 1 2 2 2 2 3 3
        ..- attr(*, "label")= chr "Estado marital de la persona"
        ..- attr(*, "labels")= Named num [1:3] 1 2 3
        .. ..- attr(*, "names")= chr [1:3] "Soltero" "Casado" "Viudo"
       $ Altura: num  1 1 1 1 2 2 2 2 3 3
        ..- attr(*, "label")= chr "Altura de la persona"
        ..- attr(*, "labels")= Named num [1:3] 1 2 3
        .. ..- attr(*, "names")= chr [1:3] "Baja" "Media" "Alta"

---

    Code
      use_labels(datos, dict = dict)
    Condition
      [1m[33mWarning[39m:[22m
      [1m[22m`use_labels()` was deprecated in labeler 0.7.0.
      [36mℹ[39m Please use `with_Dict()` instead.
      [36mℹ[39m See the new ?Dict API.
    Output
           SEXO  Sexo2 Sexo3  ESTADO Altura
      1  Hombre Hombre     1 Soltero      1
      2  Hombre Hombre     1 Soltero      1
      3  Hombre Hombre     1 Soltero      1
      4  Hombre Hombre     1 Soltero      1
      5  Hombre Hombre     1  Casado      2
      6   Mujer  Mujer     2  Casado      2
      7   Mujer  Mujer     2  Casado      2
      8   Mujer  Mujer     2  Casado      2
      9   Mujer  Mujer     2   Viudo      3
      10  Mujer  Mujer     2   Viudo      3

---

    Code
      useLabels(datos, dict = dict)
    Condition
      [1m[33mWarning[39m:[22m
      [1m[22m`useLabels()` was deprecated in endomer 0.1.1.
      [36mℹ[39m Please use `use_labels()` instead.
    Output
           SEXO  Sexo2 Sexo3  ESTADO Altura
      1  Hombre Hombre     1 Soltero      1
      2  Hombre Hombre     1 Soltero      1
      3  Hombre Hombre     1 Soltero      1
      4  Hombre Hombre     1 Soltero      1
      5  Hombre Hombre     1  Casado      2
      6   Mujer  Mujer     2  Casado      2
      7   Mujer  Mujer     2  Casado      2
      8   Mujer  Mujer     2  Casado      2
      9   Mujer  Mujer     2   Viudo      3
      10  Mujer  Mujer     2   Viudo      3

---

    Code
      use_labels(datos, dict = dict, vars = c("SEXO"))
    Output
           SEXO Sexo2 Sexo3 ESTADO Altura
      1  Hombre     1     1      1      1
      2  Hombre     1     1      1      1
      3  Hombre     1     1      1      1
      4  Hombre     1     1      1      1
      5  Hombre     1     1      2      2
      6   Mujer     2     2      2      2
      7   Mujer     2     2      2      2
      8   Mujer     2     2      2      2
      9   Mujer     2     2      3      3
      10  Mujer     2     2      3      3

---

    Code
      use_labels(datos, dict = dict, check = FALSE)
    Output
           SEXO  Sexo2 Sexo3  ESTADO Altura
      1  Hombre Hombre     1 Soltero      1
      2  Hombre Hombre     1 Soltero      1
      3  Hombre Hombre     1 Soltero      1
      4  Hombre Hombre     1 Soltero      1
      5  Hombre Hombre     1  Casado      2
      6   Mujer  Mujer     2  Casado      2
      7   Mujer  Mujer     2  Casado      2
      8   Mujer  Mujer     2  Casado      2
      9   Mujer  Mujer     2   Viudo      3
      10  Mujer  Mujer     2   Viudo      3

---

    Code
      use_labels(set_labels(datos, dict = dict, ignore_case = T), NULL)
    Output
           SEXO  Sexo2 Sexo3  ESTADO Altura
      1  Hombre Hombre     1 Soltero   Baja
      2  Hombre Hombre     1 Soltero   Baja
      3  Hombre Hombre     1 Soltero   Baja
      4  Hombre Hombre     1 Soltero   Baja
      5  Hombre Hombre     1  Casado  Media
      6   Mujer  Mujer     2  Casado  Media
      7   Mujer  Mujer     2  Casado  Media
      8   Mujer  Mujer     2  Casado  Media
      9   Mujer  Mujer     2   Viudo   Alta
      10  Mujer  Mujer     2   Viudo   Alta

---

    Code
      use_labels(datos, dict = dict, ignore_case = T)
    Message
      The following (1) variable was not labeled since it contain values not present in the dictionary:
      • Altura
      Please visit <https://adatar-do.github.io/labeler/articles/labeler.html#checking-labels> for more details.
    Output
           SEXO  Sexo2 Sexo3  ESTADO Altura
      1  Hombre Hombre     1 Soltero      2
      2  Hombre Hombre     1 Soltero      2
      3  Hombre Hombre     1 Soltero      2
      4  Hombre Hombre     1 Soltero      2
      5  Hombre Hombre     1  Casado      3
      6   Mujer  Mujer     2  Casado      3
      7   Mujer  Mujer     2  Casado      3
      8   Mujer  Mujer     2  Casado      3
      9   Mujer  Mujer     2   Viudo      4
      10  Mujer  Mujer     2   Viudo      4

---

    Code
      use_labels(dplyr::mutate(datos, Sexo2 = Sexo2 + 1), dict = dict)
    Message
      The following (1) variable was not labeled since it contain values not present in the dictionary:
      • Sexo2
      Please visit <https://adatar-do.github.io/labeler/articles/labeler.html#checking-labels> for more details.
    Output
           SEXO Sexo2 Sexo3  ESTADO Altura
      1  Hombre     2     1 Soltero      2
      2  Hombre     2     1 Soltero      2
      3  Hombre     2     1 Soltero      2
      4  Hombre     2     1 Soltero      2
      5  Hombre     2     1  Casado      3
      6   Mujer     3     2  Casado      3
      7   Mujer     3     2  Casado      3
      8   Mujer     3     2  Casado      3
      9   Mujer     3     2   Viudo      4
      10  Mujer     3     2   Viudo      4

---

    Code
      use_labels(datos, dict = dict)
    Output
           SEXO  Sexo2 Sexo3  ESTADO Altura
      1  Hombre Hombre     1 Soltero      2
      2  Hombre Hombre     1 Soltero      2
      3  Hombre Hombre     1 Soltero      2
      4  Hombre Hombre     1 Soltero      2
      5  Hombre Hombre     1  Casado      3
      6   Mujer  Mujer     2  Casado      3
      7   Mujer  Mujer     2  Casado      3
      8   Mujer  Mujer     2  Casado      3
      9   Mujer  Mujer     2   Viudo      4
      10  Mujer  Mujer     2   Viudo      4

---

    Code
      use_labels(datos, dict = dict)
    Message
      ! Sexo3: Warning
    Output
           SEXO  Sexo2 Sexo3  ESTADO Altura
      1  Hombre Hombre     1 Soltero      2
      2  Hombre Hombre     1 Soltero      2
      3  Hombre Hombre     1 Soltero      2
      4  Hombre Hombre     1 Soltero      2
      5  Hombre Hombre     1  Casado      3
      6   Mujer  Mujer     2  Casado      3
      7   Mujer  Mujer     2  Casado      3
      8   Mujer  Mujer     2  Casado      3
      9   Mujer  Mujer     2   Viudo      4
      10  Mujer  Mujer     2   Viudo      4

---

    Code
      use_labels(datos, dict = dict, warn = FALSE)
    Output
           SEXO  Sexo2 Sexo3  ESTADO Altura
      1  Hombre Hombre     1 Soltero      2
      2  Hombre Hombre     1 Soltero      2
      3  Hombre Hombre     1 Soltero      2
      4  Hombre Hombre     1 Soltero      2
      5  Hombre Hombre     1  Casado      3
      6   Mujer  Mujer     2  Casado      3
      7   Mujer  Mujer     2  Casado      3
      8   Mujer  Mujer     2  Casado      3
      9   Mujer  Mujer     2   Viudo      4
      10  Mujer  Mujer     2   Viudo      4

