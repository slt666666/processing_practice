import java.util.*;

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void run(){
    Iterator<Particle> it = particles.iterator();
    
    while (it.hasNext()){
      Particle p = it.next();
      p.run();
      if (p.isDead()){
        it.remove();
      }
    }
  }
}