library(hexSticker)
library(magick)
library(extrafont)
library(showtext)
font_add_google("Gochi Hand", "gochi")
imgurl <- image_read("man/figures/fig/reports.png")
(sticker(imgurl, package="fastrep", p_size=27, s_x=1.05, s_y=.75, s_width=.95,
         p_family = "gochi",
         s_height=.85,
         h_fill="#f3f4fc", h_color="#222d6b",
         h_size = 2,
         filename="man/figures/fig/Rep1.png",
         p_color  = "#3f4c7d"))
