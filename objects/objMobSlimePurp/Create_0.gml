event_inherited();


drop = getItem("Gel");
if(irandom_range(1, 10) == 1){ drop = getItem("Healing Potion"); }
dropChance = 40;

hp = 40;
hpMax = 40;
bumpMight = 8;
bumpPoisons = 60;


moveSpeed = 3;
jumpPow = -12;


thinkCD = 0; 

thinkCDMax = 30 * 3;

huntOnThink = 50;
jumpOnThink = 0;
turnOnThink = 100;

turnOnBump = 0;
jumpOnBumb = 50;

jumpAnytime = 1;
jumpInAir = 0;