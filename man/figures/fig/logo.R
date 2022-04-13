
imgurl <- system.file("figures/teste.png", package="mypdf1")
(sticker(imgurl, package="mypdf1", p_size=20, s_x=1, s_y=.75, s_width=.55,
         filename="inst/figures/imgfile.png", h_fill="#CCD1D3", h_color="#135389",p_color  = "#135389"))
