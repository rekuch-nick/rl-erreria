if(other.hurtTime > 0){ return; }

other.hurtTime = pc.hurtTimeMax;
damageCreature(other, bumpMight, Ele.bump);