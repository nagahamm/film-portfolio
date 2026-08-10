const els = document.querySelectorAll('.fade');
const io = new IntersectionObserver((entries)=>{
  entries.forEach(e=>{ if(e.isIntersecting){ e.target.classList.add('in'); io.unobserve(e.target);} });
},{threshold:0, rootMargin:'0px 0px -10% 0px'});
els.forEach(el=>io.observe(el));

window.addEventListener('DOMContentLoaded', function(){
  if(!window.imagesLoaded || !window.Masonry) return;
  document.querySelectorAll('.masonry-grid').forEach(function(grid){
    imagesLoaded(grid, function(){
      new Masonry(grid, {
        itemSelector: '.masonry-item',
        columnWidth: '.masonry-sizer',
        percentPosition: true,
        gutter: 10
      });
      grid.classList.add('is-loaded');
    });
  });
});

document.querySelectorAll('[data-carousel]').forEach(track=>{
  const card = track.closest('.craft-card, .ep-media');
  const slides = track.querySelectorAll('.craft-slide, .ep-media-slide');
  const dotsWrap = card.querySelector('.craft-dots, .ep-media-dots');
  const prevBtn = card.querySelector('.craft-arrow-prev, .ep-media-arrow-prev');
  const nextBtn = card.querySelector('.craft-arrow-next, .ep-media-arrow-next');
  if(slides.length <= 1){
    if(dotsWrap) dotsWrap.remove();
    if(prevBtn) prevBtn.remove();
    if(nextBtn) nextBtn.remove();
    return;
  }
  const dots = [];
  slides.forEach((_, i)=>{
    const d = document.createElement('span');
    if(i===0) d.classList.add('active');
    d.addEventListener('click', ()=>{
      track.scrollTo({left: track.clientWidth * i, behavior:'smooth'});
    });
    dotsWrap.appendChild(d);
    dots.push(d);
  });
  const slideIO = new IntersectionObserver((entries)=>{
    entries.forEach(e=>{
      if(e.isIntersecting){
        const idx = Array.from(slides).indexOf(e.target);
        dots.forEach((d,i)=>d.classList.toggle('active', i===idx));
        slides.forEach((s,i)=>{
          const v = s.querySelector('video');
          if(!v) return;
          if(i===idx){
            v.dataset.active = 'true';
            if(v.dataset.inViewport !== 'false') v.play().catch(()=>{});
          } else {
            v.dataset.active = 'false';
            v.pause();
          }
        });
      }
    });
  }, {root: track, threshold: 0.6});
  slides.forEach(s=>slideIO.observe(s));
  prevBtn.addEventListener('click', ()=> track.scrollBy({left: -track.clientWidth, behavior:'smooth'}));
  nextBtn.addEventListener('click', ()=> track.scrollBy({left: track.clientWidth, behavior:'smooth'}));
});

document.querySelectorAll('.ep-video-mute').forEach(btn=>{
  const video = btn.closest('.ep-media-slide').querySelector('video');
  btn.addEventListener('click', (e)=>{
    e.stopPropagation();
    video.muted = !video.muted;
    btn.classList.toggle('is-unmuted', !video.muted);
  });
});

document.querySelectorAll('[data-compare]').forEach(slider=>{
  const range = slider.querySelector('.compare-range');
  const setPos = pct=>{
    pct = Math.min(100, Math.max(0, pct));
    slider.style.setProperty('--pos', pct + '%');
    range.value = pct;
  };
  const posFromEvent = e=>{
    const rect = slider.getBoundingClientRect();
    return ((e.clientX - rect.left) / rect.width) * 100;
  };

  // キーボード操作(矢印キー)用
  range.addEventListener('input', ()=> setPos(Number(range.value)));

  // マウス/タッチ/ペン共通のドラッグ操作(Pointer Events)
  let dragging = false;
  slider.addEventListener('pointerdown', e=>{
    dragging = true;
    slider.setPointerCapture(e.pointerId);
    setPos(posFromEvent(e));
  });
  slider.addEventListener('pointermove', e=>{
    if(!dragging) return;
    setPos(posFromEvent(e));
  });
  slider.addEventListener('pointerup', e=>{
    dragging = false;
    slider.releasePointerCapture(e.pointerId);
  });
  slider.addEventListener('pointercancel', ()=> dragging = false);

  setPos(Number(range.value));
});

const videoViewportIO = new IntersectionObserver((entries)=>{
  entries.forEach(entry=>{
    const video = entry.target;
    if(entry.isIntersecting){
      video.dataset.inViewport = 'true';
      if(video.dataset.active !== 'false') video.play().catch(()=>{});
    } else {
      video.dataset.inViewport = 'false';
      video.pause();
    }
  });
}, {threshold:0.4});
document.querySelectorAll('.ep-media-slide video').forEach(v=>videoViewportIO.observe(v));
