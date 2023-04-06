<template lang="">
  <div class="repair">
    <div class="wrap">
      <div class="content">
        <div class="head_repair">
          <div class="border-left"></div>
          <h5>OUR SERVICES</h5>
        </div>
        <h2>What We Do</h2>
        <p>
          Sed ut perspiciatis unde omnis iste natus error sit voluptatem
          accusantium doloremque laudantium totam rem aperiam, eaque ipsa quae
          ab illo inventore veritatis et quasi.
        </p>
      </div>
      <div class="service">
        <service-item v-for="index in 5" :key="index" />
      </div>
    </div>
  </div>
</template>
<script setup>
import ServiceItem from "./ServiceItem.vue";
</script>
<style lang="scss" scoped>
.content {
  width: 70%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.service {
  cursor: pointer;
  margin-top: 40px;
  display: flex;
  flex-wrap: wrap;
  margin-right: -10px;
  margin-left: -10px;
  justify-content: space-between;
}
.repair {
  background-color: #222431;
  padding: 40px 0 40px;
}
.head_repair {
  display: flex;
  align-items: center;
  h5 {
    font-size: 14px;
    line-height: 24px;
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0;
    color: var(--red);
  }
}
h2 {
  font-size: 45px;
  line-height: 1.2em;
  font-weight: 900;
  text-transform: none;
  color: #fff;
}
p {
  font-size: 1.8rem;
  color: #fff;
}
</style>
