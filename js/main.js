/* ==========================================================
   Film Portfolio — interactions
   HTML(構造) / CSS(装飾) / JS(制御) を分離するため、
   JS からは class / hidden 属性の切り替えのみを行い、
   style プロパティは直接触らない。
   ========================================================== */

/* ---------- スクロール連動フェードイン ---------- */
const fadeIO = new IntersectionObserver((entries)=>{
  entries.forEach(e=>{
    if(!e.isIntersecting) return;
    e.target.classList.add('in');
    fadeIO.unobserve(e.target);
  });
}, {threshold:0, rootMargin:'0px 0px -10% 0px'});
document.querySelectorAll('.fade').forEach(el=>fadeIO.observe(el));

/* ---------- Masonry（Slate / Craft）----------
   ガター幅は CSS の --masonry-gutter を唯一の定義元として読み出し、
   カラム幅の calc() と Masonry の値がずれないようにする。 */
window.addEventListener('DOMContentLoaded', ()=>{
  if(!window.imagesLoaded || !window.Masonry) return;
  const gutter = parseFloat(
    getComputedStyle(document.documentElement).getPropertyValue('--masonry-gutter')
  );
  document.querySelectorAll('.masonry-grid').forEach(grid=>{
    imagesLoaded(grid, ()=>{
      new Masonry(grid, {
        itemSelector:'.masonry-item',
        columnWidth:'.masonry-sizer',
        percentPosition:true,
        gutter
      });
      grid.classList.add('is-loaded');
    });
  });
});

/* ---------- アルバム割り当て ----------
   モーダルは data-album 単位で前後送りするため、
   同じカルーセル内のメディアに共通のアルバム名を与える。
   単独メディアは1件だけのアルバムとなり、矢印は出ない。 */
document.querySelectorAll('[data-carousel]').forEach((track, i)=>{
  track.querySelectorAll('img, video').forEach(el=>{
    if(!el.dataset.album) el.dataset.album = `carousel-${i}`;
  });
});
// カルーセルを持たない単独メディア（.ep-media 直下、Craftカード直下の写真）も
// 1件だけのアルバムとして登録する。矢印は出ず、拡大表示だけができる。
document.querySelectorAll('.ep-media img, .ep-media video, .craft-card > img').forEach((el, i)=>{
  if(el.closest('[data-carousel]')) return;
  if(!el.dataset.album) el.dataset.album = `standalone-${i}`;
});

/* ---------- カルーセル（Episode / Craft 共通）---------- */
document.querySelectorAll('[data-carousel]').forEach(track=>{
  const host = track.closest('.craft-card, .ep-media');
  const slides = Array.from(track.querySelectorAll('.carousel-slide'));
  const dotsWrap = host.querySelector('.carousel-dots');
  const prevBtn = host.querySelector('.carousel-arrow-prev');
  const nextBtn = host.querySelector('.carousel-arrow-next');

  if(slides.length <= 1){
    [dotsWrap, prevBtn, nextBtn].forEach(el=> el && el.remove());
    return;
  }

  let activeIndex = 0;
  const dots = slides.map((_, i)=>{
    const dot = document.createElement('span');
    if(i === 0) dot.classList.add('active');
    dot.addEventListener('click', ()=> goTo(i));
    dotsWrap.appendChild(dot);
    return dot;
  });

  const updateArrows = ()=>{
    prevBtn.hidden = activeIndex <= 0;
    nextBtn.hidden = activeIndex >= slides.length - 1;
  };

  function goTo(index){
    activeIndex = Math.max(0, Math.min(index, slides.length - 1));
    track.scrollTo({left: track.clientWidth * activeIndex, behavior:'smooth'});
    updateArrows();
  }

  // 表示中スライドの動画だけを再生し、隠れたスライドは止める
  const syncSlideVideos = ()=>{
    slides.forEach((slide, i)=>{
      const video = slide.querySelector('video');
      if(!video) return;
      const isActive = i === activeIndex;
      video.dataset.active = String(isActive);
      if(isActive && video.dataset.inViewport !== 'false') video.play().catch(()=>{});
      if(!isActive) video.pause();
    });
  };

  const slideIO = new IntersectionObserver((entries)=>{
    entries.forEach(e=>{
      if(!e.isIntersecting) return;
      activeIndex = slides.indexOf(e.target);
      dots.forEach((dot, i)=> dot.classList.toggle('active', i === activeIndex));
      updateArrows();
      syncSlideVideos();
    });
  }, {root:track, threshold:0.6});
  slides.forEach(slide=> slideIO.observe(slide));

  prevBtn.addEventListener('click', ()=> goTo(activeIndex - 1));
  nextBtn.addEventListener('click', ()=> goTo(activeIndex + 1));
  updateArrows();
});

/* ---------- 動画のミュート切り替え ---------- */
document.querySelectorAll('.ep-video-mute').forEach(btn=>{
  const video = btn.closest('.carousel-slide').querySelector('video');
  btn.addEventListener('click', e=>{
    e.stopPropagation();   // モーダルを開くクリックと競合させない
    video.muted = !video.muted;
    btn.classList.toggle('is-unmuted', !video.muted);
  });
});

/* ---------- 画面内に入った動画のみ再生 ---------- */
const videoViewportIO = new IntersectionObserver((entries)=>{
  entries.forEach(entry=>{
    const video = entry.target;
    video.dataset.inViewport = String(entry.isIntersecting);
    if(entry.isIntersecting){
      if(video.dataset.active !== 'false') video.play().catch(()=>{});
    } else {
      video.pause();
    }
  });
}, {threshold:0.4});
document.querySelectorAll('.carousel-slide video').forEach(v=> videoViewportIO.observe(v));

/* ---------- Before/After 比較スライダー ---------- */
document.querySelectorAll('[data-compare]').forEach(slider=>{
  const range = slider.querySelector('.compare-range');

  const setPos = pct=>{
    const clamped = Math.min(100, Math.max(0, pct));
    slider.style.setProperty('--pos', `${clamped}%`);
    range.value = clamped;
  };
  const posFromEvent = e=>{
    const rect = slider.getBoundingClientRect();
    return ((e.clientX - rect.left) / rect.width) * 100;
  };

  // キーボード操作（矢印キー）用
  range.addEventListener('input', ()=> setPos(Number(range.value)));

  // マウス / タッチ / ペン共通のドラッグ操作
  let dragging = false;
  slider.addEventListener('pointerdown', e=>{
    dragging = true;
    slider.setPointerCapture(e.pointerId);
    setPos(posFromEvent(e));
  });
  slider.addEventListener('pointermove', e=>{
    if(dragging) setPos(posFromEvent(e));
  });
  slider.addEventListener('pointerup', e=>{
    dragging = false;
    slider.releasePointerCapture(e.pointerId);
  });
  slider.addEventListener('pointercancel', ()=>{ dragging = false; });

  setPos(Number(range.value));
});

/* ---------- ショットリストの横ドラッグスクロール ---------- */
document.querySelectorAll('.shotlist-marquee').forEach(marquee=>{
  let dragging = false;
  let moved = false;
  let startX = 0;
  let startScrollLeft = 0;

  marquee.addEventListener('pointerdown', e=>{
    moved = false;
    if(e.pointerType !== 'mouse') return;   // タッチはネイティブスクロールに任せる
    dragging = true;
    startX = e.clientX;
    startScrollLeft = marquee.scrollLeft;
  });
  marquee.addEventListener('pointermove', e=>{
    if(!dragging) return;
    const dx = e.clientX - startX;
    if(!moved){
      if(Math.abs(dx) <= 5) return;
      // ポインタキャプチャはドラッグ確定後に取る。pointerdown の時点で捕らえると
      // 互換マウスイベントまで marquee にリターゲットされ、単純クリックでも
      // click の target が <img> ではなく marquee になり、
      // モーダルを開くイベント委譲が要素を見つけられなくなる
      moved = true;
      marquee.classList.add('is-dragging');
      marquee.setPointerCapture(e.pointerId);
    }
    marquee.scrollLeft = startScrollLeft - dx;
  });
  const endDrag = e=>{
    dragging = false;
    marquee.classList.remove('is-dragging');
    if(marquee.hasPointerCapture(e.pointerId)) marquee.releasePointerCapture(e.pointerId);
  };
  marquee.addEventListener('pointerup', endDrag);
  marquee.addEventListener('pointercancel', endDrag);
  // ドラッグ終わりのクリックでモーダルが開かないよう、捕捉段階で止める
  marquee.addEventListener('click', e=>{
    if(moved) e.stopPropagation();
  }, true);
});

/* ==========================================================
   MEDIA MODAL（動画 + 画像）
   ========================================================== */
const videoModal = document.getElementById('video-modal');
const imgModal = document.getElementById('img-modal');

if(videoModal && imgModal){
  const modalVideo = document.getElementById('modal-video-player');
  const modalImage = document.getElementById('img-modal-image');
  const videoStage = videoModal.querySelector('.modal-stage');
  const imgStage = imgModal.querySelector('.modal-stage');
  const videoFrame = videoModal.querySelector('.modal-frame');
  const imgFrame = imgModal.querySelector('.modal-frame');
  // 本編は Instagram の埋め込みを iframe で再生する（自己ホストの動画ではない）
  const filmModal = document.getElementById('film-modal');
  const filmEmbed = document.getElementById('film-embed');
  const filmEmbedSrc = 'https://www.instagram.com/reel/Dbk88hJSsrv/embed/';

  const arrowBtns = {
    prev:[document.getElementById('img-modal-prev'), document.getElementById('video-modal-prev')],
    next:[document.getElementById('img-modal-next'), document.getElementById('video-modal-next')]
  };

  /* --- アルバム構築 ---
     img と video を data-album ごとに DOM 順でまとめ、写真と動画が
     混在するグループも1本の連続したシーケンスとして送れるようにする。 */
  const albums = new Map();
  document.querySelectorAll('[data-album]').forEach(el=>{
    const isVideo = el.tagName === 'VIDEO';
    const src = isVideo ? (el.currentSrc || el.src) : el.src;
    if(!albums.has(el.dataset.album)) albums.set(el.dataset.album, []);
    const items = albums.get(el.dataset.album);
    if(items.some(item=> item.src === src)) return;
    items.push({
      type: isVideo ? 'video' : 'img',
      src,
      alt: el.alt || '',
      poster: isVideo ? el.poster : null,
      el   // 枠幅の判定に実寸を使うため、元の要素を持っておく
    });
  });
  // 埋め込みが再生されない場合のフォールバック（自己ホストの本編を直接再生する）
  const mainFilmAlbum = [{type:'video', src:modalVideo.src, poster:modalVideo.poster, alt:''}];

  let currentAlbum = [];
  let currentIndex = 0;

  const isOpen = ()=> [imgModal, videoModal, filmModal]
    .some(modal=> modal && modal.classList.contains('is-open'));

  const showModal = modal=>{
    modal.classList.add('is-open');
    modal.setAttribute('aria-hidden', 'false');
    document.body.classList.add('is-modal-open');
  };
  const hideModal = modal=>{
    modal.classList.remove('is-open');
    modal.setAttribute('aria-hidden', 'true');
  };

  const pauseBackgroundVideos = ()=>{
    document.querySelectorAll('.carousel-slide video').forEach(v=> v.pause());
  };
  // モーダルを閉じたら、本来再生されているべき動画を元の状態へ戻す
  // （2つの IntersectionObserver が持つ状態をそのまま判定に使う）
  const resumeBackgroundVideos = ()=>{
    document.querySelectorAll('.carousel-slide video').forEach(v=>{
      if(v.dataset.inViewport === 'false' || v.dataset.active === 'false') return;
      v.play().catch(()=>{});
    });
  };

  const updateArrows = ()=>{
    const single = currentAlbum.length <= 1;
    arrowBtns.prev.forEach(btn=>{ if(btn) btn.hidden = single || currentIndex <= 0; });
    arrowBtns.next.forEach(btn=>{ if(btn) btn.hidden = single || currentIndex >= currentAlbum.length - 1; });
  };

  // メディアの実寸から縦横比を判定し、枠側に固定比率クラスを付与する。
  // 同じメディアを見ている間は枠サイズもボタン位置も動かない。

  /* --- 枠幅 ---
     枠は「アルバム内で最も横に広いメディア」に合わせる。
     単一比率のアルバムでは枠がメディアに密着してボタンが寄り添い、
     縦横が混在するアルバムでだけ横構図ぶんの幅で固定されるので、
     前後送りでも ×ボタン・矢印が動かない。 */
  const isLandscapeEl = el=>{
    if(!el) return false;
    if(el.tagName === 'VIDEO') return el.videoWidth > 0 && el.videoWidth > el.videoHeight;
    return el.naturalWidth > 0 && el.naturalWidth > el.naturalHeight;
  };
  const setFrames = landscape=>{
    [imgFrame, videoFrame].forEach(frame=>{
      frame.classList.toggle('is-landscape-frame', landscape);
      frame.classList.toggle('is-portrait-frame', !landscape);
    });
  };
  const widenFrames = ()=> setFrames(true);

  const applyOrientation = (w, h, stage)=>{
    if(!w || !h) return;
    const portrait = w <= h;
    stage.classList.toggle('is-portrait-modal', portrait);
    stage.classList.toggle('is-landscape-modal', !portrait);
    // 表示して初めて横構図と分かった場合は、ここで枠を広げて追随させる
    // （縦だけのアルバムは狭いままなので、ボタンがメディアに寄り添う）
    if(!portrait) widenFrames();
  };


  // src を外すことで埋め込みの再生も止める（iframe には pause API が無いため）
  const closeFilmEmbed = ()=>{
    if(!filmModal) return;
    hideModal(filmModal);
    filmEmbed.removeAttribute('src');
  };

  const closeMediaModal = ()=>{
    hideModal(imgModal);
    hideModal(videoModal);
    closeFilmEmbed();
    document.body.classList.remove('is-modal-open');
    modalVideo.pause();
    modalVideo.currentTime = 0;
    resumeBackgroundVideos();
  };

  const showImage = item=>{
    hideModal(videoModal);
    modalVideo.pause();
    modalImage.src = item.src;
    modalImage.alt = item.alt;
    showModal(imgModal);
    const apply = ()=> applyOrientation(modalImage.naturalWidth, modalImage.naturalHeight, imgStage);
    if(modalImage.complete && modalImage.naturalWidth) apply();
    else modalImage.addEventListener('load', apply, {once:true});
  };

  const showVideo = item=>{
    hideModal(imgModal);
    modalVideo.src = item.src;
    if(item.poster) modalVideo.poster = item.poster;
    modalVideo.load();          // load() が currentTime も 0 に戻す
    modalVideo.muted = false;
    showModal(videoModal);
    const apply = ()=> applyOrientation(modalVideo.videoWidth, modalVideo.videoHeight, videoStage);
    if(modalVideo.readyState >= 1 && modalVideo.videoWidth) apply();
    else modalVideo.addEventListener('loadedmetadata', apply, {once:true});
  };

  const showMediaAt = index=>{
    if(currentAlbum.length === 0) return;
    currentIndex = Math.max(0, Math.min(index, currentAlbum.length - 1));
    const item = currentAlbum[currentIndex];
    pauseBackgroundVideos();
    closeFilmEmbed();
    if(item.type === 'img') showImage(item);
    else showVideo(item);
    updateArrows();
  };
  const nextMedia = ()=> showMediaAt(currentIndex + 1);
  const prevMedia = ()=> showMediaAt(currentIndex - 1);

  const openMediaModal = (album, startSrc)=>{
    currentAlbum = album;
    setFrames(album.some(item=> isLandscapeEl(item.el)));
    const startIndex = startSrc ? album.findIndex(item=> item.src === startSrc) : 0;
    showMediaAt(startIndex === -1 ? 0 : startIndex);
  };

  /* --- 開閉 --- */
  // イベント委譲: 個別に配線せず、data-album を持つ img/video なら
  // マークアップ上の位置やクラスに関わらず確実にモーダルが開く。
  document.addEventListener('click', e=>{
    const el = e.target.closest('img[data-album], video[data-album]');
    if(!el) return;
    const src = el.tagName === 'VIDEO' ? (el.currentSrc || el.src) : el.src;
    openMediaModal(albums.get(el.dataset.album) || [], src);
  });

  // 本編カード → 埋め込みモーダル
  const openFilmBtn = document.getElementById('open-film-modal');
  if(filmModal && openFilmBtn){
    openFilmBtn.addEventListener('click', ()=>{
      hideModal(imgModal);
      hideModal(videoModal);
      modalVideo.pause();
      pauseBackgroundVideos();
      filmEmbed.src = filmEmbedSrc;
      showModal(filmModal);
    });
    document.getElementById('close-film-modal').addEventListener('click', closeMediaModal);
  }

  const openVideoModalBtn = document.getElementById('open-video-modal');
  if(openVideoModalBtn){
    openVideoModalBtn.addEventListener('click', ()=> openMediaModal(mainFilmAlbum));
  }

  document.getElementById('close-img-modal').addEventListener('click', closeMediaModal);
  document.getElementById('close-video-modal').addEventListener('click', closeMediaModal);
  [imgModal, videoModal, filmModal].forEach(modal=>{
    if(modal) modal.querySelector('.modal-bg').addEventListener('click', closeMediaModal);
  });
  arrowBtns.prev.forEach(btn=> btn && btn.addEventListener('click', prevMedia));
  arrowBtns.next.forEach(btn=> btn && btn.addEventListener('click', nextMedia));

  modalVideo.addEventListener('click', ()=>{
    if(modalVideo.paused) modalVideo.play().catch(()=>{});
    else modalVideo.pause();
  });

  /* --- フルスクリーン（ベンダー接頭辞つきの旧 Safari も対象）--- */
  const fullscreenElement = ()=> document.fullscreenElement || document.webkitFullscreenElement;
  const enterFullscreen = el=>{
    if(el.requestFullscreen) return el.requestFullscreen();
    if(el.webkitRequestFullscreen) return el.webkitRequestFullscreen();
    if(el.webkitEnterFullscreen) return el.webkitEnterFullscreen();   // iOS Safari の <video>
  };
  const leaveFullscreen = ()=>{
    if(document.exitFullscreen) return document.exitFullscreen();
    if(document.webkitExitFullscreen) return document.webkitExitFullscreen();
    if(modalVideo.webkitExitFullscreen) return modalVideo.webkitExitFullscreen();
  };

  /* --- キーボード ---
     開閉のたびに登録し直さず、isOpen() で判定する常設リスナーにして
     二重発火を防ぐ。 */
  // 埋め込みモーダルは iframe 内に操作を委ねるため、Esc（閉じる）だけを扱う
  const isFilmOpen = ()=> !!filmModal && filmModal.classList.contains('is-open');

  document.addEventListener('keydown', e=>{
    if(!isOpen()) return;
    if(e.key === 'Escape'){
      fullscreenElement() ? leaveFullscreen() : closeMediaModal();
      return;
    }
    if(isFilmOpen() || fullscreenElement()) return;   // 全画面中はネイティブのシークを優先
    switch(e.key){
      case 'f':
      case 'F':
        enterFullscreen(modalVideo);
        break;
      case 'ArrowRight':
        nextMedia();
        break;
      case 'ArrowLeft':
        prevMedia();
        break;
    }
  });

  /* --- スワイプで前後送り --- */
  let touchStartX = null;
  [imgStage, videoStage].forEach(stage=>{
    stage.addEventListener('touchstart', e=>{
      // <video> のネイティブコントロール（シークバー）操作を
      // スワイプとして拾わないよう除外する
      touchStartX = e.target.closest('video') ? null : e.touches[0].clientX;
    }, {passive:true});
    stage.addEventListener('touchend', e=>{
      if(touchStartX === null) return;
      const dx = e.changedTouches[0].clientX - touchStartX;
      if(Math.abs(dx) > 40) dx < 0 ? nextMedia() : prevMedia();
      touchStartX = null;
    }, {passive:true});
  });
}
