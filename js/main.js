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

document.querySelectorAll('[data-carousel]').forEach((track, trackIndex)=>{
  const album = `carousel-${trackIndex}`;
  track.querySelectorAll('img, video').forEach(el=>{
    if(!el.dataset.album) el.dataset.album = album;
  });
});

document.querySelectorAll('.ep-media video').forEach((video, videoIndex)=>{
  if(video.closest('[data-carousel]')) return;
  if(!video.dataset.album) video.dataset.album = `standalone-video-${videoIndex}`;
});

document.querySelectorAll('.ep-media img').forEach((img, imgIndex)=>{
  if(img.closest('[data-carousel]')) return;
  if(!img.dataset.album) img.dataset.album = `standalone-img-${imgIndex}`;
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
  let activeIndex = 0;
  const goTo = index=>{
    activeIndex = (index + slides.length) % slides.length;
    track.scrollTo({left: track.clientWidth * activeIndex, behavior:'smooth'});
  };
  slides.forEach((_, i)=>{
    const d = document.createElement('span');
    if(i===0) d.classList.add('active');
    d.addEventListener('click', ()=> goTo(i));
    dotsWrap.appendChild(d);
    dots.push(d);
  });
  const slideIO = new IntersectionObserver((entries)=>{
    entries.forEach(e=>{
      if(e.isIntersecting){
        const idx = Array.from(slides).indexOf(e.target);
        activeIndex = idx;
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
  prevBtn.addEventListener('click', ()=> goTo(activeIndex - 1));
  nextBtn.addEventListener('click', ()=> goTo(activeIndex + 1));
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
const imgModal = document.getElementById('img-modal');
const openVideoModalBtn = document.getElementById('open-video-modal');

if(videoModal && imgModal){
  const modalVideo = document.getElementById('modal-video-player');
  const imgModalImage = document.getElementById('img-modal-image');
  const closeVideoModalBtn = document.getElementById('close-video-modal');
  const closeImgModalBtn = document.getElementById('close-img-modal');
  const prevVideoModalBtn = document.getElementById('video-modal-prev');
  const nextVideoModalBtn = document.getElementById('video-modal-next');
  const prevImgModalBtn = document.getElementById('img-modal-prev');
  const nextImgModalBtn = document.getElementById('img-modal-next');
  const videoModalBg = videoModal.querySelector('.modal-bg');
  const imgModalBg = imgModal.querySelector('.modal-bg');
  const imgModalContent = imgModal.querySelector('.img-modal-content');
  const videoModalContent = videoModal.querySelector('.v-modal-content');

  // Unified img+video albums, keyed by data-album, in DOM order, so a
  // mixed image/video group (e.g. 2 photos + 1 video) navigates as one
  // continuous sequence instead of getting stuck within a single type.
  const albumItems = new Map();
  document.querySelectorAll('[data-album]').forEach(el=>{
    const album = el.dataset.album;
    const isVideo = el.tagName === 'VIDEO';
    const src = isVideo ? (el.currentSrc || el.src) : el.src;
    if(!albumItems.has(album)) albumItems.set(album, []);
    const list = albumItems.get(album);
    if(!list.some(g=>g.src === src)){
      list.push({type: isVideo ? 'video' : 'img', src, alt: el.alt || '', poster: isVideo ? el.poster : null});
    }
  });
  const mainFilmAlbum = [{type:'video', src: modalVideo.src, poster: modalVideo.poster, alt:''}];

  let currentAlbum = [];
  let currentIndex = 0;

  const isOpen = ()=> imgModal.classList.contains('is-open') || videoModal.classList.contains('is-open');

  const pauseBackgroundVideos = ()=>{
    document.querySelectorAll('video').forEach(v=>{ if(v !== modalVideo) v.pause(); });
  };

  const updateArrows = ()=>{
    const hide = currentAlbum.length <= 1;
    [prevImgModalBtn, nextImgModalBtn, prevVideoModalBtn, nextVideoModalBtn].forEach(btn=>{
      if(btn) btn.style.display = hide ? 'none' : '';
    });
  };

  const closeMediaModal = ()=>{
    imgModal.classList.remove('is-open');
    imgModal.setAttribute('aria-hidden', 'true');
    videoModal.classList.remove('is-open');
    videoModal.setAttribute('aria-hidden', 'true');
    modalVideo.pause();
    modalVideo.currentTime = 0;
  };

  const showMediaAt = index=>{
    if(currentAlbum.length === 0) return;
    currentIndex = (index + currentAlbum.length) % currentAlbum.length;
    const item = currentAlbum[currentIndex];
    pauseBackgroundVideos();
    if(item.type === 'img'){
      videoModal.classList.remove('is-open');
      videoModal.setAttribute('aria-hidden', 'true');
      modalVideo.pause();
      imgModalImage.src = item.src;
      imgModalImage.alt = item.alt;
      imgModal.classList.add('is-open');
      imgModal.setAttribute('aria-hidden', 'false');
    } else {
      imgModal.classList.remove('is-open');
      imgModal.setAttribute('aria-hidden', 'true');
      modalVideo.src = item.src;
      if(item.poster) modalVideo.poster = item.poster;
      modalVideo.load();
      modalVideo.muted = false;
      modalVideo.currentTime = 0;
      videoModal.classList.add('is-open');
      videoModal.setAttribute('aria-hidden', 'false');
    }
    updateArrows();
  };
  const nextMedia = ()=> showMediaAt(currentIndex + 1);
  const prevMedia = ()=> showMediaAt(currentIndex - 1);

  const openMediaModal = (album, startSrc)=>{
    currentAlbum = album;
    const startIndex = startSrc ? album.findIndex(g=>g.src === startSrc) : 0;
    showMediaAt(startIndex === -1 ? 0 : startIndex);
  };

  if(openVideoModalBtn) openVideoModalBtn.addEventListener('click', ()=> openMediaModal(mainFilmAlbum));

  // Event delegation: one listener on document instead of per-element
  // listeners, so every current (and future) img/video[data-album]
  // reliably opens the modal regardless of its class or where it sits
  // in the markup, instead of depending on being individually wired up.
  document.addEventListener('click', e=>{
    const el = e.target.closest('img[data-album], video[data-album]');
    if(!el) return;
    const src = el.tagName === 'VIDEO' ? (el.currentSrc || el.src) : el.src;
    openMediaModal(albumItems.get(el.dataset.album) || [], src);
  });

  closeImgModalBtn.addEventListener('click', closeMediaModal);
  closeVideoModalBtn.addEventListener('click', closeMediaModal);
  imgModalBg.addEventListener('click', closeMediaModal);
  videoModalBg.addEventListener('click', closeMediaModal);
  modalVideo.addEventListener('click', ()=>{
    if(modalVideo.paused) modalVideo.play().catch(()=>{});
    else modalVideo.pause();
  });
  if(prevImgModalBtn) prevImgModalBtn.addEventListener('click', prevMedia);
  if(nextImgModalBtn) nextImgModalBtn.addEventListener('click', nextMedia);
  if(prevVideoModalBtn) prevVideoModalBtn.addEventListener('click', prevMedia);
  if(nextVideoModalBtn) nextVideoModalBtn.addEventListener('click', nextMedia);

  const getFullscreenElement = ()=> document.fullscreenElement || document.webkitFullscreenElement;
  const requestFullscreen = el=>{
    if(el.requestFullscreen) return el.requestFullscreen();
    if(el.webkitRequestFullscreen) return el.webkitRequestFullscreen();
    if(el.webkitEnterFullscreen) return el.webkitEnterFullscreen(); // iOS Safari <video>
  };
  const exitFullscreen = ()=>{
    if(document.exitFullscreen) return document.exitFullscreen();
    if(document.webkitExitFullscreen) return document.webkitExitFullscreen();
    if(modalVideo.webkitExitFullscreen) return modalVideo.webkitExitFullscreen();
  };

  // Single persistent listener (no re-registration per open/close) guarded
  // by isOpen(), so Esc/f/arrow handling never double-fires across toggles.
  document.addEventListener('keydown', e=>{
    if(!isOpen()) return;
    if(e.key === 'f' || e.key === 'F'){
      if(getFullscreenElement()) exitFullscreen();
      else requestFullscreen(modalVideo);
    } else if(e.key === 'Escape'){
      if(getFullscreenElement()) exitFullscreen();
      else closeMediaModal();
    } else if(e.key === 'ArrowRight'){
      nextMedia();
    } else if(e.key === 'ArrowLeft'){
      prevMedia();
    }
  });

  let touchStartX = null;
  [imgModalContent, videoModalContent].forEach(content=>{
    content.addEventListener('touchstart', e=>{
      touchStartX = e.touches[0].clientX;
    }, {passive:true});
    content.addEventListener('touchend', e=>{
      if(touchStartX === null) return;
      const dx = e.changedTouches[0].clientX - touchStartX;
      if(Math.abs(dx) > 40){ dx < 0 ? nextMedia() : prevMedia(); }
      touchStartX = null;
    }, {passive:true});
  });
}
