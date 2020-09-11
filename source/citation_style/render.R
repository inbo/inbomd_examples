# citation_style bst is outdated, so temporarily disabling it for the website:
#########################
# rmarkdown::render_site(
#   output_format =  bookdown::pdf_book(
#     base_format = "INBOmd::inbo_rapport",
#     style = "INBO",
#     lof = FALSE,
#     lot =  FALSE
#   )
# )
# file.rename(
#   "../../docs/citation_style/citation_style.pdf",
#   "../../docs/citation_style/citation_style_bst.pdf"
# )
#########################

# Dutch bibliography
dir.create("../../docs/citation_style/nl", recursive = TRUE)
rmarkdown::render_site(
  output_format =  bookdown::pdf_book(
    base_format = "INBOmd::inbo_rapport",
    style = "INBO",
    lof = FALSE,
    lot =  FALSE,
    citation_package = "none",
    pandoc_args = c("--metadata", "lang=nl")
  )
)
file.rename(
  "../../docs/citation_style/citation_style.pdf",
  "../../docs/citation_style/nl/citation_style_csl.pdf"
)
rmarkdown::render_site(
  output_format =  bookdown::gitbook(
    split_by = "chapter+number",
    template = INBOmd::inbo_rapport_css("html"),
    pandoc_args = c(
      "--csl",
      system.file(
        "research-institute-for-nature-and-forest.csl",
        package = "INBOmd"
      ),
      "--metadata",
      "lang=nl"
    )
  )
)
website_files <- list.files("../../docs/citation_style")
website_files <- website_files[!website_files %in% c("nl", "en")]
file.rename(
  file.path("../../docs/citation_style", website_files),
  file.path("../../docs/citation_style/nl", website_files)
)


# English bibliography
dir.create("../../docs/citation_style/en", recursive = TRUE)
rmarkdown::render_site(
  output_format =  bookdown::pdf_book(
    base_format = "INBOmd::inbo_rapport",
    style = "INBO",
    lof = FALSE,
    lot =  FALSE,
    citation_package = "none",
    pandoc_args = c("--metadata", "lang=en")
  )
)
file.rename(
  "../../docs/citation_style/citation_style.pdf",
  "../../docs/citation_style/en/citation_style_csl.pdf"
)
rmarkdown::render_site(
  output_format =  bookdown::gitbook(
    split_by = "chapter+number",
    template = INBOmd::inbo_rapport_css("html"),
    pandoc_args = c(
      "--csl",
      system.file(
        "research-institute-for-nature-and-forest.csl",
        package = "INBOmd"
      ),
      "--metadata",
      "lang=en"
    )
  )
)
website_files <- list.files("../../docs/citation_style")
website_files <- website_files[!website_files %in% c("nl", "en")]
file.rename(
  file.path("../../docs/citation_style", website_files),
  file.path("../../docs/citation_style/en", website_files)
)
