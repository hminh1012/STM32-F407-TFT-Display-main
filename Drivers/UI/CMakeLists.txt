SET(SOURCES screens/ui_screen.c
    ui.c
    components/ui_comp_hook.c
    ui_helpers.c
    ui_events.c
    images/ui_img_1425725674.c
    images/ui_img_1334565599.c
    images/ui_img_1334569699.c
    images/ui_img_airbag_png.c
    images/ui_img_1774135500.c)

add_library(ui ${SOURCES})
