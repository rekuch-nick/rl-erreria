event_inherited();


drop = getItem("Stinger");
dropChance = 80;
if(irandom_range(1, 15) == 1 && !ww.gotBookGel){ drop = getItem(imgBookGold); dropChance = 100; }

grav = .5;


moveSpeed = 5;
jumpPow = -7;

thinkCD = 0; 

thinkCDMax = 30 * 2;

huntOnThink = 80;
jumpOnThink = 70;
turnOnThink = 70;

turnOnBump = 0;
jumpOnBumb = 50;

jumpAnytime = 1;
jumpInAir = 100;