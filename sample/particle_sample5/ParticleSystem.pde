class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() { 
    particles.add(new Particle(origin));
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

  void applyRepeller(Repeller r){
    for (Particle p: particles){
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
}