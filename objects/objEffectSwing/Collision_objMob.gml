if(arrayContains(mobsHit, other)){ return; }

mobsHit[array_length(mobsHit)] = other;

other.xPush = getDir(other.xx - pc.xx) * (push * other.pushMod);
damageCreature(other, might);