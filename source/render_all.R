stopifnot(
  package_version(installed.packages()["INBOmd", "Version"]) >=
    package_version("0.5.0")
)
library(here)
base_folder <- here("source")

options(bookdown.render.file_scope = FALSE)
old_wd <- getwd()
on.exit(setwd(old_wd), add = TRUE)
# main file
setwd(base_folder)
rmarkdown::render("index.Rmd", output_dir = here("docs"))

# citation styles
setwd(here(base_folder, "citation_style"))
index <- readLines("index.Rmd")
index[index == "lang: nl"] <- "lang: en"
index[index == "style: INBO"] <- "style: Flanders"
writeLines(index, "index.Rmd")
yml <- readLines("_bookdown.yml")
yml[yml == "output_dir: \"../../docs/citation_style/nl\""] <-
  "output_dir: \"../../docs/citation_style/en\""
writeLines(yml, "_bookdown.yml")
rmarkdown::render_site(output_format = "INBOmd::report", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::gitbook", encoding = "UTF-8")
index <- readLines("index.Rmd")
index[index == "lang: en"] <- "lang: nl"
index[index == "style: Flanders"] <- "style: INBO"
writeLines(index, "index.Rmd")
yml <- readLines("_bookdown.yml")
yml[yml == "output_dir: \"../../docs/citation_style/en\""] <-
  "output_dir: \"../../docs/citation_style/nl\""
writeLines(yml, "_bookdown.yml")
rmarkdown::render_site(output_format = "INBOmd::report", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::gitbook", encoding = "UTF-8")

# flanders report
setwd(here(base_folder, "flanders_report"))
rmarkdown::render_site(output_format = "INBOmd::report", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::gitbook", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::ebook", encoding = "UTF-8")

# flandre rapport
setwd(here(base_folder, "flandre_rapport"))
rmarkdown::render_site(output_format = "INBOmd::report", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::gitbook", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::ebook", encoding = "UTF-8")

# flanders slides
setwd(here(base_folder, "flanders_slides"))
rmarkdown::render_site(output_format = "INBOmd::handouts", encoding = "UTF-8")
file.rename(
  here("docs", "flanders_slides", "flanders_slides.pdf"),
  here("docs", "flanders_slides", "flanders_slides_handout.pdf")
)
rmarkdown::render_site(output_format = "INBOmd::report", encoding = "UTF-8")
file.rename(
  here("docs", "flanders_slides", "flanders_slides.pdf"),
  here("docs", "flanders_slides", "flanders_slides_report.pdf")
)
rmarkdown::render_site(output_format = "INBOmd::slides", encoding = "UTF-8")

# inbo rapport
setwd(here(base_folder, "/inbo_rapport"))
rmarkdown::render_site(output_format = "INBOmd::report", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::gitbook", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::ebook", encoding = "UTF-8")

# inbo rapport basic
setwd(here(base_folder, "inbo_rapport_delen"))
rmarkdown::render_site(output_format = "INBOmd::report", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::gitbook", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::ebook", encoding = "UTF-8")

# inbo slides
setwd(here(base_folder, "inbo_slides"))
rmarkdown::render_site(output_format = "INBOmd::handouts", encoding = "UTF-8")
file.rename(
  here("docs", "inbo_slides", "inbo_slides.pdf"),
  here("docs", "inbo_slides", "inbo_slides_handout.pdf")
)
rmarkdown::render_site(output_format = "INBOmd::report", encoding = "UTF-8")
file.rename(
  here("docs", "inbo_slides", "inbo_slides.pdf"),
  here("docs", "inbo_slides", "inbo_slides_rapport.pdf")
)
rmarkdown::render_site(output_format = "INBOmd::slides", encoding = "UTF-8")

# vlaanderen rapport
setwd(here(base_folder, "vlaanderen_rapport"))
rmarkdown::render_site(output_format = "INBOmd::report", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::gitbook", encoding = "UTF-8")
rmarkdown::render_site(output_format = "INBOmd::ebook", encoding = "UTF-8")

# INBOmd workshop
setwd(here(base_folder, "inbomd_workshop"))
rmarkdown::render_site(output_format = "INBOmd::slides", encoding = "UTF-8")

setwd(base_folder)
