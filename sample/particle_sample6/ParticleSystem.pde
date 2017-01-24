class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PImage img;
  
  ParticleSystem(int num, PVector v, PImage img_) {
    particles = new ArrayList<Particle>();
    origin = v.get();
    img = img_;
    for (int i = 0; i < num; i++){
      particles.add(new Particle(origin,img));
    }
  }

  void addParticle() { 
    particles.add(new Particle(origin, img));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--){
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()){
        particles.remove(i);
      }
    }
  }
  
  void applyForce(PVector f){
    for (Particle p: particles){
      p.applyForce(f);
    }
  }
}