library(hexSticker)
library(magick)
imgurl <- image_read("man/figures/fig/report.png")
(sticker(imgurl, package="fastrep", p_size=30, s_x=1.05, s_y=.75, s_width=.95,
         s_height=.85,
         h_fill="#e6eaf1", h_color="#000706",
         h_size = 2,
         filename="man/figures/fig/Rep.png",
         p_color  = "#000706"))
