
window.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector(".navbar");
  const topBtn = document.getElementById("backToTop");

  function onScroll(){
    if(nav) nav.classList.toggle("scrolled", window.scrollY > 20);
    if(topBtn) topBtn.classList.toggle("show", window.scrollY > 450);
  }
  window.addEventListener("scroll", onScroll);
  onScroll();

  if(topBtn){
    topBtn.addEventListener("click", () => window.scrollTo({top:0, behavior:"smooth"}));
  }

  const revealObserver = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if(entry.isIntersecting){
        entry.target.classList.add("visible");
        revealObserver.unobserve(entry.target);
      }
    });
  }, {threshold:.12});
  document.querySelectorAll(".reveal").forEach(el => revealObserver.observe(el));

  document.querySelectorAll("#navMenu a").forEach(link => {
    link.addEventListener("click", () => {
      const menu = document.getElementById("navMenu");
      const inst = bootstrap.Collapse.getInstance(menu);
      if(inst && window.innerWidth < 992) inst.hide();
    });
  });

  const form = document.getElementById("enquiryForm");
  const ok = document.getElementById("formSuccess");
  if(form){
    form.addEventListener("submit", e => {
      e.preventDefault();
      e.stopPropagation();
      if(!form.checkValidity()){
        form.classList.add("was-validated");
        return;
      }
      form.classList.add("was-validated");
      if(ok) ok.classList.remove("d-none");
      const name = document.getElementById("fullName")?.value || "";
      const course = document.getElementById("course")?.value || "";
      const mobile = document.getElementById("mobile")?.value || "";
      const msg = encodeURIComponent(`Hello Aslam Khan Academy, I want to enroll.\nName: ${name}\nCourse: ${course}\nMobile: ${mobile}`);
      const wa = document.getElementById("formWhatsapp");
      if(wa){
        wa.href = `https://wa.me/916306596098?text=${msg}`;
        wa.classList.remove("d-none");
      }
    });
  }

  const counters = document.querySelectorAll(".counter");
  if(counters.length){
    const counterObserver = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if(!entry.isIntersecting) return;
        counters.forEach(c => {
          const target = Number(c.dataset.target || 0);
          const suffix = c.dataset.suffix || "";
          const start = performance.now();
          const duration = 1000;
          function animate(now){
            const p = Math.min((now-start)/duration,1);
            const value = Math.floor(target*(1-Math.pow(1-p,3)));
            c.textContent = value + suffix;
            if(p<1) requestAnimationFrame(animate);
          }
          requestAnimationFrame(animate);
        });
        counterObserver.disconnect();
      });
    }, {threshold:.3});
    counterObserver.observe(counters[0]);
  }
});

// GSAP enhanced animations
document.addEventListener("DOMContentLoaded",()=>{
  const reduce=window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  if(!reduce && window.gsap && window.ScrollTrigger){
    gsap.registerPlugin(ScrollTrigger);
    gsap.from(".hero-home .kicker",{y:18,opacity:0,duration:.65,ease:"power2.out"});
    gsap.from(".hero-home .display-title",{y:34,opacity:0,duration:.85,delay:.12,ease:"power3.out"});
    gsap.from(".hero-home .lead-copy",{y:24,opacity:0,duration:.75,delay:.24,ease:"power2.out"});
    gsap.from(".hero-home .hero-actions .btn",{y:18,opacity:0,stagger:.12,duration:.55,delay:.36,ease:"back.out(1.8)"});
    gsap.from(".hero-home .trust-row span",{y:14,opacity:0,stagger:.08,duration:.5,delay:.46});
    gsap.from(".hero-home .hero-visual",{x:42,opacity:0,rotateY:-7,duration:1,delay:.18,ease:"power3.out"});
    gsap.utils.toArray(".course-card").forEach((card,i)=>gsap.from(card,{scrollTrigger:{trigger:card,start:"top 88%",once:true},y:48,opacity:0,scale:.97,duration:.72,delay:(i%3)*.06,ease:"power3.out"}));
    gsap.utils.toArray(".feature-card,.review-card,.tech-chip,.timeline-item").forEach(el=>gsap.from(el,{scrollTrigger:{trigger:el,start:"top 90%",once:true},y:34,opacity:0,duration:.62,ease:"power2.out"}));
  }
  if(!reduce && window.matchMedia("(hover:hover) and (pointer:fine)").matches){
    document.querySelectorAll(".course-card").forEach(card=>{
      const glow=document.createElement("span");glow.className="cursor-glow";card.appendChild(glow);
      card.addEventListener("mousemove",e=>{const r=card.getBoundingClientRect(),x=e.clientX-r.left,y=e.clientY-r.top;const rx=((y/r.height)-.5)*-8,ry=((x/r.width)-.5)*10;card.style.transform=`perspective(900px) rotateX(${rx}deg) rotateY(${ry}deg) translateY(-6px)`;glow.style.left=x+"px";glow.style.top=y+"px"});
      card.addEventListener("mouseleave",()=>card.style.transform="");
    });
  }
  document.querySelectorAll("[data-testimonial-slider]").forEach(stage=>{
    const track=stage.querySelector(".testimonial-track"),slides=[...stage.querySelectorAll(".testimonial-slide")];if(slides.length<2)return;
    const prev=stage.querySelector("[data-prev]"),next=stage.querySelector("[data-next]"),dotsWrap=stage.querySelector(".slider-dots");let index=0,timer;
    slides.forEach((_,i)=>{const d=document.createElement("button");d.className="slider-dot"+(i===0?" active":"");d.setAttribute("aria-label",`Go to testimonial ${i+1}`);d.onclick=()=>go(i);dotsWrap.appendChild(d)});
    const dots=[...dotsWrap.children];function go(i){index=(i+slides.length)%slides.length;track.style.transform=`translateX(-${index*100}%)`;dots.forEach((d,n)=>d.classList.toggle("active",n===index));restart()}function restart(){clearInterval(timer);timer=setInterval(()=>go(index+1),5200)}
    prev?.addEventListener("click",()=>go(index-1));next?.addEventListener("click",()=>go(index+1));stage.addEventListener("mouseenter",()=>clearInterval(timer));stage.addEventListener("mouseleave",restart);restart();
  });
});


// Premium V2 homepage depth interactions
window.addEventListener('DOMContentLoaded',()=>{
  const consoleCard=document.querySelector('.academy-console');
  if(consoleCard && window.matchMedia('(hover:hover) and (pointer:fine)').matches){
    consoleCard.addEventListener('mousemove',(e)=>{
      const r=consoleCard.getBoundingClientRect();
      const x=(e.clientX-r.left)/r.width-.5;
      const y=(e.clientY-r.top)/r.height-.5;
      consoleCard.style.transform=`perspective(1200px) rotateY(${x*6-4}deg) rotateX(${-y*5+2}deg) translateY(-2px)`;
    });
    consoleCard.addEventListener('mouseleave',()=>consoleCard.style.transform='perspective(1200px) rotateY(-4deg) rotateX(2deg)');
  }
});
