if(other.hurtTime > 0){ return; }
other.yPush = -5;
other.hurtTime = pc.hurtTimeMax;


damageCreature(other, might);
if(burns){buffCreature(other, Buff.burn, burns); }
if(poisons){buffCreature(other, Buff.poison, poisons); }

instance_destroy();