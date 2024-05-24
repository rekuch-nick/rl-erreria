if(arrayContains(mobsHit, other)){ return; }

mobsHit[array_length(mobsHit)] = other;

other.xPush = getDir(other.xx - pc.xx) * (push * other.pushMod);



var mm = might;
if(pc.buff[Buff.might] > 0){ mm = ceil(mm * 1.5); }



damageCreature(other, mm);
if(roll(burnChance)){ buffCreature(other, Buff.burn, burnPow); }
if(roll(poisonChance)){ buffCreature(other, Buff.poison, poisonPow); }