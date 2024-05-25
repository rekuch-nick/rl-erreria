event_inherited();


drop = getItem("Gel"); dropChance = 80;
if(irandom_range(1, 20) == 1){ drop = getItem("Healing Potion"); dropChance = 100; }


moveSpeed = 3;
jumpPow = -12;


thinkCD = 0; 

thinkCDMax = 30 * 5;

huntOnThink = 50;
jumpOnThink = 0;
turnOnThink = 100;

turnOnBump = 0;
jumpOnBumb = 50;

jumpAnytime = 1;
jumpInAir = 0;

shotKind = noone;
shotCDMax = 150; shotCD = shotCDMax;
clusterMax = 0; cluster = clusterMax; clusterCD = 10;