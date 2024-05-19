draw_self();

var w = (pc.hp / pc.hpMax) * wMax;
draw_rectangle_color(x + 4, y + 4, x + 4 + w, y + 4 + 31, c_red, c_red, c_maroon, c_maroon, false);
draw_text(x + 8, y + 10, floor(pc.hp));

w = (pc.mp / pc.mpMax) * wMax;
draw_rectangle_color(x + 4, y + 40, x + 4 + w, y + 40 + 19, c_aqua, c_aqua, c_blue, c_blue, false);
draw_text(x + 8, y + 40, floor(pc.mp));