<template lang="">
  <div class="slider">
    <!-- slides -->
    <div class="slider__slides">
      <div class="slide s--active">
        <div class="slide__inner">
          <div class="slide__content">
            <h2 class="slide__heading">Giá rẻ cho mọi dịch vụ</h2>
            <!-- <p class="slide__text">Greetings, Traveler!</p> -->
          </div>
        </div>
      </div>
      <div class="slide">
        <div class="slide__inner">
          <div class="slide__content">
            <h2 class="slide__heading">
              Bạn đã cho tôi thấy ,Tôi có thể làm được
            </h2>
            <!-- <p class="slide__text">Clip-path magic!</p> -->
          </div>
        </div>
      </div>
      <div class="slide">
        <div class="slide__inner">
          <div class="slide__content">
            <h2 class="slide__heading">
              Giúp cho cuộc sống gia đình bạn tốt hơn mỗi ngày
            </h2>
            <!-- <p class="slide__text">It looks cool, isn't it?</p> -->
          </div>
        </div>
      </div>
      <div class="slide">
        <div class="slide__inner">
          <div class="slide__content">
            <h2 class="slide__heading">Giá rẻ cho mọi dịch vụ</h2>
            <!-- <p class="slide__text">Forget about IE/Edge and FF</p> -->
          </div>
        </div>
      </div>
      <div class="slide s--prev">
        <div class="slide__inner">
          <div class="slide__content">
            <h2 class="slide__heading">
              Giúp cho cuộc sống gia đình bạn tốt hơn mỗi ngày
            </h2>
            <!-- <p class="slide__text">
              <a href="https://codepen.io/suez/pens/public/" target="_blank"
                >Other demos</a
              >
              and
              <a href="https://twitter.com/NikolayTalanov" target="_blank"
                >Twitter</a
              >
            </p> -->
          </div>
        </div>
      </div>
    </div>
    <!-- slides end -->
    <div class="slider__control">
      <div class="slider__control-line"></div>
      <div class="slider__control-line"></div>
    </div>
    <div class="slider__control slider__control--right m--right">
      <div class="slider__control-line"></div>
      <div class="slider__control-line"></div>
    </div>
  </div>
</template>
<script setup>
import { onMounted } from "vue";
onMounted(() => {
  (function () {
    var $slides = document.querySelectorAll(".slide");
    var $controls = document.querySelectorAll(".slider__control");
    var numOfSlides = $slides.length;
    var slidingAT = 1300; // sync this with scss variable
    var slidingBlocked = false;

    [].slice.call($slides).forEach(function ($el, index) {
      var i = index + 1;
      $el.classList.add("slide-" + i);
      $el.dataset.slide = i;
    });

    [].slice.call($controls).forEach(function ($el) {
      $el.addEventListener("click", controlClickHandler);
    });

    function controlClickHandler() {
      if (slidingBlocked) return;
      slidingBlocked = true;

      var $control = this;
      var isRight = $control.classList.contains("m--right");
      var $curActive = document.querySelector(".slide.s--active");
      var index = +$curActive.dataset.slide;
      isRight ? index++ : index--;
      if (index < 1) index = numOfSlides;
      if (index > numOfSlides) index = 1;
      var $newActive = document.querySelector(".slide-" + index);

      $control.classList.add("a--rotation");
      $curActive.classList.remove("s--active", "s--active-prev");
      document.querySelector(".slide.s--prev").classList.remove("s--prev");

      $newActive.classList.add("s--active");
      if (!isRight) $newActive.classList.add("s--active-prev");

      var prevIndex = index - 1;
      if (prevIndex < 1) prevIndex = numOfSlides;

      document.querySelector(".slide-" + prevIndex).classList.add("s--prev");

      setTimeout(function () {
        $control.classList.remove("a--rotation");
        slidingBlocked = false;
      }, slidingAT * 0.75);
    }
  })();
});
</script>
<style lang="scss" scoped>
$numOfSlides: 5;
$slidingAT: 1.3s;
$controlSize: 60px;

.slider {
  position: relative;
  height: 100vh;

  &__slides {
    z-index: 1;
    position: relative;
    height: 100%;
  }

  &__control {
    z-index: 2;
    position: absolute;
    top: 50%;
    left: 5%;
    width: $controlSize;
    height: $controlSize;
    margin-left: $controlSize/-2;
    margin-top: $controlSize/-2;
    background: transparent;
    transition: background-color 0.3s;
    border-radius: 0%;
    border-top-left-radius: 15px;
    border-bottom-right-radius: 15px;
    border: 1px solid #fff;
    cursor: pointer;

    &--right {
      left: 95%;
    }

    &:hover {
      background-color: var(--red);
    }

    &-line {
      position: absolute;
      left: 23px;
      top: 50%;
      width: 3px;
      height: 14px;
      transform-origin: 50% 0;
      transform: rotate(-45deg);

      &:nth-child(2) {
        transform: translateY(1px) rotate(-135deg);
      }

      .slider__control--right & {
        left: 37px;
        transform-origin: 1px 0;
        transform: rotate(45deg);

        &:nth-child(2) {
          transform: translateY(1px) rotate(135deg);
        }
      }

      &:after {
        content: "";
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: #e2e2e2;
        transition: background-color 0.3s;
      }

      .slider__control:hover &:after {
        background-color: #fff;
      }

      .slider__control.a--rotation & {
        &:after {
          animation: arrowLineRotation 0.49s;
        }

        &:nth-child(1):after {
          animation: arrowLineRotationRev 0.49s;
        }
      }
    }
  }
}

@keyframes arrowLineRotation {
  to {
    transform: rotate(180deg);
  }
}

@keyframes arrowLineRotationRev {
  to {
    transform: rotate(-180deg);
  }
}

.slide {
  overflow: hidden;
  position: absolute;
  left: 50%;
  top: 50%;
  width: 150vmax;
  height: 150vmax;
  transform: translate(-50%, -50%);
  border-radius: 50%;
  transition: clip-path 0s $slidingAT * 0.7;
  clip-path: circle($controlSize/2 at 120vw 50%);

  &.s--prev {
    clip-path: circle($controlSize/2 at 30vw 50%);
  }

  &.s--active {
    z-index: 1;
    transition: clip-path $slidingAT;
    clip-path: circle(120vmax at 120vw 50%);

    &.s--active-prev {
      clip-path: circle(120vmax at 30vw 50%);
    }
  }

  // @for $i from 1 through $numOfSlides {
  &:nth-child(1) {
    .slide__inner {
      background-image: url("https://gsi-tools.com.vn/Images/news/2111300945-cac-bien-phap-an-toan-trong-xuong-sua-chua-o-to-3.jpg");
    }
  }
  &:nth-child(2) {
    .slide__inner {
      background-image: url("https://www.xtmobile.vn/vnt_upload/news/11_2021/18/appple-4-xtmobile.jpg");
    }
  }
  &:nth-child(3) {
    .slide__inner {
      background-image: url("https://afamilycdn.com/150157425591193600/2020/5/4/d48e95b462f28bacd2e3-15885714561481551857156-68-0-693-1000-crop-15885714633771150167584.jpg");
    }
  }
  &:nth-child(4) {
    .slide__inner {
      background-image: url("https://afamilycdn.com/150157425591193600/2020/5/4/d48e95b462f28bacd2e3-15885714561481551857156-68-0-693-1000-crop-15885714633771150167584.jpg");
    }
  }
  &:nth-child(5) {
    .slide__inner {
      background-image: url("https://tieudung.kinhtedothi.vn/upload_images/images/2022/08/23/mac.jpg");
    }
  }
  // }

  &__inner {
    position: absolute;
    left: 50%;
    top: 50%;
    width: 100vw;
    height: 100vh;
    margin-left: -50vw;
    margin-top: -50vh;
    background-size: cover;
    background-position: center center;

    &:before {
      content: "";
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.3);
    }
  }

  &__content {
    position: absolute;
    left: 50%;
    top: 50%;
    margin-left: $controlSize/-2;
    max-width: 480px;
    transform: translate(-50%, -50%);
    color: #fff;
  }

  &__heading {
    margin-bottom: 20px;
    font-size: 60px;
  }

  &__text {
    font-size: 25px;

    a {
      color: inherit;
    }
  }
}
</style>
