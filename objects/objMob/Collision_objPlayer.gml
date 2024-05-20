if(other.hurtTime > 0){ return; }

other.yPush = -5;
other.hurtTime = pc.hurtTimeMax;
damageCreature(other, bumpMight, Ele.bump);