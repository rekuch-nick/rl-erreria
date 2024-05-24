if(other.hurtTime > 0){ return; }

other.yPush = -5;
other.hurtTime = pc.hurtTimeMax;



damageCreature(other, bumpMight);
if(bumpBurns){buffCreature(other, Buff.burn, bumpBurns); }
if(bumpPoisons){buffCreature(other, Buff.poison, bumpPoisons); }