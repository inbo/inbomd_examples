rmarkdown::render_site(
  output_format =  bookdown::pdf_book(
    base_format = "INBOmd::inbo_rapport",
    style = "INBO",
    lof = FALSE,
    lot =  FALSE
  )
)
file.rename(
  "../../output/citation_style/citation_style.pdf",
  "../../output/citation_style/citation_style_bst.pdf"
)
rmarkdown::render_site(
  output_format =  bookdown::pdf_book(
    base_format = "INBOmd::inbo_rapport",
    style = "INBO",
    lof = FALSE,
    lot =  FALSE,
    citation_package = "none"
  )
)
file.rename(
  "../../output/citation_style/citation_style.pdf",
  "../../output/citation_style/citation_style_csl.pdf"
)
rmarkdown::render_site(
  output_format =  bookdown::gitbook(
    split_by = "chapter+number",
    template = INBOmd::inbo_rapport_css("html"),
    pandoc_args = c("--csl", system.file("inbo.csl", package = "INBOmd"))
  )
)
