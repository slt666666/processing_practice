class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    float r = random(1);
    if (r < 0.5) { 
      particles.add(new Particle(origin));
    } 
    else {
      particles.add(new Confetti(origin));
    }
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()){
      Particle p = (Particle) it.next();
      p.run();
      if (p.isDead()){
        it.remove();
      }
    }
  }
  
  void applyForce(PVector f){
    for (Particle p: particles){
      p.applyForce(f);
    }
  }
}