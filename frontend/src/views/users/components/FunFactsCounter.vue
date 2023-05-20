<template lang="">
  <main class="counter-container wrap">
    <div class="social">
      <div class="social-icon">
        <box-icon
          name="universal-access"
          type="solid"
          animation="spin"
          color="#060af5"
          size="60px"
        ></box-icon>
      </div>
      <p>Tài khoản</p>
      <h3 class="counter" data-count="21035">0</h3>
    </div>
    <div class="social">
      <div class="social-icon">
        <box-icon
          type="logo"
          name="trip-advisor"
          animation="spin"
          color="green"
          size="60px"
        ></box-icon>
      </div>
      <p>Tổng số đơn</p>
      <h3 class="counter" data-count="8025">0</h3>
    </div>
    <div class="social">
      <div class="social-icon">
        <box-icon
          type="solid"
          name="analyse"
          animation="spin"
          color="yellow"
          size="60px"
        ></box-icon>
      </div>
      <p>Số đơn hoàn thành</p>
      <h3 class="counter" data-count="125312">0</h3>
    </div>
    <div class="social">
      <div class="social-icon">
        <box-icon
          type="solid"
          name="sad"
          animation="spin"
          color="red"
          size="60px"
        ></box-icon>
      </div>
      <p>Số đơn hủy</p>
      <h3 class="counter" data-count="625">0</h3>
    </div>
  </main>
</template>
<script setup>
import { onMounted } from "vue";
onMounted(() => {
  // select the element
  const counters = document.querySelectorAll(".counter");

  // iterate through all the counter elements
  counters.forEach((counter) => {
    // function to increment the counter
    function updateCount() {
      const target = +counter.getAttribute("data-count");
      const count = +counter.innerHTML;

      const inc = Math.floor((target - count) / 100);

      if (count < target && inc > 0) {
        counter.innerHTML = count + inc;
        // repeat the function
        setTimeout(updateCount, 1);
      }
      // if the count not equal to target, then add remaining count
      else {
        counter.innerHTML = target;
      }
    }
    updateCount();
  });
});
</script>
<style lang="scss" scoped>
.heading {
  text-align: center;
  font-size: 1.6rem;
  padding: 3rem 0;
  background: #ffe99f;
  font-family: sans-serif;
}

.counter-container {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  flex-wrap: wrap;
  padding: 2rem 0;
}

.social {
  width: 20%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 1rem 0;
}

.social-icon {
  font-size: 2rem;
  color: #fff;
  border-radius: 50%;
}

.social-icon i {
  padding: 0.7rem;
  border-radius: 50%;
}

.fa-youtube {
  background: #c4302b;
}

.fa-twitter {
  background: #00acee;
}

.fa-facebook {
  background: #3b5998;
}

.fa-linkedin {
  background: #0077b5;
}

.social p {
  font-size: 1.5rem;
  font-family: sans-serif;
  padding: 10px 0;
}

.social h3 {
  font-size: 2.5rem;
  font-weight: 700;
  font-family: "Nunito", sans-serif;
}

@media screen and (max-width: 768px) {
  .heading {
    font-size: 1.2rem;
  }

  .counter-container {
    flex-direction: column;
  }
}
</style>
