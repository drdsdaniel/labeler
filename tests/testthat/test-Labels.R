test_that("labels", {
  local_edition(3)
  dict <- list(
    SEXO = list(
      lab = "Sexo de la persona",
      labs = c("Hombre" = 1, "Mujer" = 2)
    ),
    ESTADO = list(
      lab = "Estado marital de la persona",
      labs = c("Soltero" = 1, "Casado" = 2, "Viudo" = 3)
    ),
    ALTURA = list(
      lab = "Altura de la persona",
      labs = c("Baja" = 1, "Media" = 2, "Alta" = 3)
    ),
    Sexo2 = list(
      lab = "Palabras cón caracteres nó ASCII",
      labs = "link::SEXO"
    )
  )
  datos <- data.frame(
    SEXO = c(rep(1, 5), rep(2, 5)),
    Sexo2 = c(rep(1, 5), rep(2, 5)),
    Sexo3 = c(rep(1, 5), rep(2, 5)),
    ESTADO = c(rep(1, 4), rep(2, 4), 3, 3),
    Altura = c(rep(1, 4), rep(2, 4), 3, 3)
  )
  expect_snapshot(parse_dict(dict))

  expect_snapshot(str(set_labels(datos, dict = dict)))
  expect_snapshot(str(setLabels(datos, dict = dict)))
  expect_snapshot(str(set_labels(datos, dict = dict, vars = c("SEXO"))))
  expect_snapshot(str(set_labels(datos, dict = dict, ignore_case = T)))

  expect_snapshot(use_labels(datos, dict = dict))
  expect_snapshot(useLabels(datos, dict = dict))
  expect_snapshot(use_labels(datos, dict = dict, vars = c("SEXO")))
  expect_snapshot(use_labels(datos, dict = dict, check = FALSE))
  expect_null(set_labels(NULL, dict = dict, vars = c("SEXO")))
  expect_snapshot(use_labels(set_labels(datos, dict = dict, ignore_case = T), NULL))

  datos <- dplyr::mutate(datos, Altura = Altura + 1)
  expect_snapshot(use_labels(datos, dict = dict, ignore_case = T))

  expect_null(set_labels(NULL, NULL, NULL))
  dict[["Sexo3"]] <- list(lab = 5, labs = c(1, 2))
  dict[["Sexo4"]] <- list(lab = "link::Sexo3", labs = c(1, 2))
  expect_snapshot(use_labels(datos, dict = dict))


})
