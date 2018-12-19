# main file
setwd("source")
rmarkdown::render("index.Rmd", output_dir = "../docs")

# inbo rapport
setwd("inbo_rapport")
rmarkdown::render_site(encoding = "UTF-8")

# inbo rapport basic
setwd("../inbo_rapport_delen")
rmarkdown::render_site(encoding = "UTF-8")

# flanders slides
setwd("../flanders_slides")
source("handout_slides.R")
file.rename(
  "../../docs/flanders_slides/flanders_slides.pdf",
  "../../docs/flanders_slides/flanders_slides_handout.pdf"
)
rmarkdown::render_site(encoding = "UTF-8")

# inbo slides
setwd("../inbo_slides")
source("handout_slides.R")
file.rename(
  "../../docs/inbo_slides/inbo_slides.pdf",
  "../../docs/inbo_slides/inbo_slides_handout.pdf"
)
source("handout_rapport.R")
file.rename(
  "../../docs/inbo_slides/inbo_slides.pdf",
  "../../docs/inbo_slides/inbo_slides_rapport.pdf"
)
rmarkdown::render_site(encoding = "UTF-8")
setwd("../..")
