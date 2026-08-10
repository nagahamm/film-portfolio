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

document.querySelectorAll('.ep-media video').forEach(video=>{
  video.addEventListener('click', ()=>{
    if(video.paused) video.play().catch(()=>{});
    else video.pause();
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

document.querySelectorAll('.shotlist-marquee').forEach(marquee=>{
  let dragging = false;
  let moved = false;
  let startX = 0;
  let startScrollLeft = 0;
  marquee.addEventListener('pointerdown', e=>{
    if(e.pointerType !== 'mouse') return;
    dragging = true;
    moved = false;
    marquee.classList.add('is-dragging');
    marquee.setPointerCapture(e.pointerId);
    startX = e.clientX;
    startScrollLeft = marquee.scrollLeft;
  });
  marquee.addEventListener('pointermove', e=>{
    if(!dragging) return;
    const dx = e.clientX - startX;
    if(Math.abs(dx) > 5) moved = true;
    marquee.scrollLeft = startScrollLeft - dx;
  });
  const endDrag = e=>{
    dragging = false;
    marquee.classList.remove('is-dragging');
    if(marquee.hasPointerCapture(e.pointerId)) marquee.releasePointerCapture(e.pointerId);
  };
  marquee.addEventListener('pointerup', endDrag);
  marquee.addEventListener('pointercancel', endDrag);
  marquee.addEventListener('click', e=>{
    if(moved) e.stopPropagation();
  }, true);
});

const videoModal = document.getElementById('video-modal');
const openVideoModalBtn = document.getElementById('open-video-modal');
if(videoModal && openVideoModalBtn){
  const modalVideo = document.getElementById('modal-video-player');
  const closeVideoModalBtn = document.getElementById('close-video-modal');
  const videoModalBg = videoModal.querySelector('.modal-bg');

  const openVideoModal = ()=>{
    videoModal.classList.add('is-open');
    videoModal.setAttribute('aria-hidden', 'false');
    modalVideo.muted = false;
    modalVideo.currentTime = 0;
  };
  const closeVideoModal = ()=>{
    videoModal.classList.remove('is-open');
    videoModal.setAttribute('aria-hidden', 'true');
    modalVideo.pause();
    modalVideo.currentTime = 0;
  };

  const getFullscreenElement = ()=> document.fullscreenElement || document.webkitFullscreenElement;
  const requestFullscreen = el=> (el.requestFullscreen || el.webkitRequestFullscreen)?.call(el);
  const exitFullscreen = ()=> (document.exitFullscreen || document.webkitExitFullscreen)?.call(document);

  openVideoModalBtn.addEventListener('click', openVideoModal);
  closeVideoModalBtn.addEventListener('click', closeVideoModal);
  videoModalBg.addEventListener('click', closeVideoModal);
  modalVideo.addEventListener('click', ()=>{
    if(modalVideo.paused) modalVideo.play().catch(()=>{});
    else modalVideo.pause();
  });
  document.addEventListener('keydown', e=>{
    if(!videoModal.classList.contains('is-open')) return;
    if(e.key === 'f' || e.key === 'F'){
      if(getFullscreenElement()) exitFullscreen();
      else requestFullscreen(modalVideo);
    } else if(e.key === 'Escape'){
      if(getFullscreenElement()) exitFullscreen();
      else closeVideoModal();
    }
  });
}

const imgModal = document.getElementById('img-modal');
if(imgModal){
  const imgModalImage = document.getElementById('img-modal-image');
  const imgModalContent = imgModal.querySelector('.img-modal-content');
  const closeImgModalBtn = document.getElementById('close-img-modal');
  const prevImgModalBtn = document.getElementById('img-modal-prev');
  const nextImgModalBtn = document.getElementById('img-modal-next');
  const imgModalBg = imgModal.querySelector('.modal-bg');

  const trackImgs = Array.from(document.querySelectorAll('.shotlist-track img[data-album]'));
  const albumImages = new Map();
  trackImgs.forEach(img=>{
    const album = img.dataset.album;
    if(!albumImages.has(album)) albumImages.set(album, []);
    const list = albumImages.get(album);
    if(!list.some(g=>g.src === img.src)) list.push({src: img.src, alt: img.alt});
  });

  let currentAlbum = [];
  let currentIndex = 0;
  const showImage = index=>{
    currentIndex = (index + currentAlbum.length) % currentAlbum.length;
    imgModalImage.src = currentAlbum[currentIndex].src;
    imgModalImage.alt = currentAlbum[currentIndex].alt;
  };
  const nextImage = ()=> showImage(currentIndex + 1);
  const prevImage = ()=> showImage(currentIndex - 1);

  const openImgModal = img=>{
    currentAlbum = albumImages.get(img.dataset.album) || [];
    const startIndex = currentAlbum.findIndex(g=>g.src === img.src);
    showImage(startIndex === -1 ? 0 : startIndex);
    imgModal.classList.add('is-open');
    imgModal.setAttribute('aria-hidden', 'false');
  };
  const closeImgModal = ()=>{
    imgModal.classList.remove('is-open');
    imgModal.setAttribute('aria-hidden', 'true');
  };

  trackImgs.forEach(img=>{
    img.addEventListener('click', ()=> openImgModal(img));
  });
  closeImgModalBtn.addEventListener('click', closeImgModal);
  imgModalBg.addEventListener('click', closeImgModal);
  prevImgModalBtn.addEventListener('click', prevImage);
  nextImgModalBtn.addEventListener('click', nextImage);
  document.addEventListener('keydown', e=>{
    if(!imgModal.classList.contains('is-open')) return;
    if(e.key === 'Escape') closeImgModal();
    else if(e.key === 'ArrowRight') nextImage();
    else if(e.key === 'ArrowLeft') prevImage();
  });

  let touchStartX = null;
  imgModalContent.addEventListener('touchstart', e=>{
    touchStartX = e.touches[0].clientX;
  }, {passive:true});
  imgModalContent.addEventListener('touchend', e=>{
    if(touchStartX === null) return;
    const dx = e.changedTouches[0].clientX - touchStartX;
    if(Math.abs(dx) > 40){ dx < 0 ? nextImage() : prevImage(); }
    touchStartX = null;
  }, {passive:true});
}
