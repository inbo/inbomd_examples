# main file
setwd("source")
rmarkdown::render("index.Rmd", output_dir = "../docs")

# inbo rapport
setwd("inbo_rapport")
rmarkdown::render_site(encoding = "UTF-8")
setwd("../..")

# flanders slides
source("source/flanders_slides/handout_slides.R")
file.rename(
  "docs/flanders_slides/flanders_slides.pdf",
  "docs/flanders_slides/flanders_slides_handout.pdf"
)
setwd("source/flanders_slides")
rmarkdown::render_site(encoding = "UTF-8")
setwd("../..")

# inbo slides
source("source/inbo_slides/handout_slides.R")
file.rename(
  "docs/inbo_slides/inbo_slides.pdf",
  "docs/inbo_slides/inbo_slides_handout.pdf"
)
source("source/inbo_slides/handout_rapport.R")
file.rename(
  "docs/inbo_slides/inbo_slides.pdf",
  "docs/inbo_slides/inbo_slides_rapport.pdf"
)
setwd("source/inbo_slides")
rmarkdown::render_site(encoding = "UTF-8")
setwd("../..")
