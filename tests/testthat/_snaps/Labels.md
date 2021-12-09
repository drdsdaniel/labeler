# labels

    Code
      parse_dict(dict)
    Output
      $SEXO
      $SEXO$lab
      [1] "Sexo de la persona"
      
      $SEXO$labs
      Hombre  Mujer 
           1      2 
      
      
      $ESTADO
      $ESTADO$lab
      [1] "Estado marital de la persona"
      
      $ESTADO$labs
      Soltero  Casado   Viudo 
            1       2       3 
      
      
      $ALTURA
      $ALTURA$lab
      [1] "Altura de la persona"
      
      $ALTURA$labs
       Baja Media  Alta 
          1     2     3 
      
      
      $Sexo2
      $Sexo2$lab
      [1] "Palabras cón caracteres nó ASCII"
      
      $Sexo2$labs
      [1] "link::SEXO"
      
      

---

    Code
      str(set_labels(datos, dict = dict))
    Output
      'data.frame':	10 obs. of  5 variables:
       $ SEXO  : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Sexo de la persona"
        ..- attr(*, "labels")= Named num [1:2] 1 2
        .. ..- attr(*, "names")= chr [1:2] "Hombre" "Mujer"
       $ Sexo2 : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Palabras cÃ³n caracteres nÃ³ ASCII"
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
    Warning <lifecycle_warning_deprecated>
      `setLabels()` was deprecated in endomer 0.1.1.
      Please use `set_labels()` instead.
      This warning is displayed once every 8 hours.
      Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.
    Output
      'data.frame':	10 obs. of  5 variables:
       $ SEXO  : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Sexo de la persona"
        ..- attr(*, "labels")= Named num [1:2] 1 2
        .. ..- attr(*, "names")= chr [1:2] "Hombre" "Mujer"
       $ Sexo2 : num  1 1 1 1 1 2 2 2 2 2
        ..- attr(*, "label")= chr "Palabras cÃ³n caracteres nÃ³ ASCII"
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
        ..- attr(*, "label")= chr "Palabras cÃ³n caracteres nÃ³ ASCII"
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
    Warning <lifecycle_warning_deprecated>
      `useLabels()` was deprecated in endomer 0.1.1.
      Please use `use_labels()` instead.
      This warning is displayed once every 8 hours.
      Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.
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
    Warning <simpleWarning>
      The following (1) variables contain values
            that are not in the dictionary and were not labeled: 
      Altura.
            Please see "https://adatar-do.github.io/labeler/articles/labeler.html" for more details.
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

