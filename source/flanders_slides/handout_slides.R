warning("output file generated by other format will be overwritten")
bookdown::render_book(
  input = "index.Rmd",
  output_format = bookdown::pdf_book(
    base_format = INBOmd::inbo_handouts,
    theme = "vlaanderen",
    lang = "english",
    subtitle = "Here comes the optional subtitle",
    location = "Here comes the optional location",
    institute = "Here comes the optional affilitation",
    toc_name = "Title of the table of content",
    cover = "trees-1036958.jpg",
    cover_horizontal = FALSE,
    slide_level = 3,
    font_flanders = TRUE
  )
)
