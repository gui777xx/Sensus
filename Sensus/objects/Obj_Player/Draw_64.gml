if (global.overlay_alpha > 0.01) {
    var cam = view_camera[0];
    var vx  = camera_get_view_x(cam);
    var vy  = camera_get_view_y(cam);
    var vw  = camera_get_view_width(cam);
    var vh  = camera_get_view_height(cam);

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    var gui_x = (x - vx) * (gui_w / vw);
    var gui_y = (y - vy) * (gui_h / vh);

    // Desenhar o player branco com alpha da overlay
    draw_sprite_ext(sprite_index, image_index, gui_x, gui_y,
                    image_xscale, image_yscale, image_angle, c_white, global.overlay_alpha);
}
