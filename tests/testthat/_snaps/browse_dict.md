# browse_dict and labels

    Code
      browse_dict(dict, testing = TRUE)
    Condition
      [1m[33mWarning[39m:[22m
      [1m[22m`browse_dict()` was deprecated in labeler 0.7.0.
      [36mℹ[39m Please use `dict_browser()` instead.
      [36mℹ[39m See the new ?Dict class.
    Output
           var                          lab
      1   SEXO           Sexo de la persona
      2 ESTADO Estado marital de la persona
      3 ALTURA         Altura de la persona
                                                            labs warn
      1                 <div>1: Hombre<br />2: Mujer<br /></div> <NA>
      2 <div>1: Soltero<br />2: Casado<br />3: Viudo<br /></div> <NA>
      3      <div>1: Baja<br />2: Media<br />3: Alta<br /></div> <NA>

---

    Code
      browse_dict(dict)

