<template lang="">
  <div class="wrap contact">
    <h1>Get Your Computer Fixed NOW!</h1>
    <h3>+1212424234</h3>
    <p class="info">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem
      exercitationem dolores corporis delectus eaque, quibusdam aliquid mollitia
      nisi illum aspernatur adipisci repellendus ut officiis cupiditate expedita
      quis animi ipsa optio.
    </p>
    <div class="action">
      <button>Get your Repair</button>
      <button>Get your Repair</button>
    </div>
  </div>
</template>
<script setup></script>
<style lang="scss" scoped>
.contact {
  margin-top: 20px;
  text-align: center;
  padding: 0px 10vw;
  h1 {
    font-size: 3rem;
    color: orangered;
    line-height: 70px;
  }
  h3 {
    font-size: 2.5rem;
    color: orangered;
  }
  p {
    font-size: 2rem;
    margin-top: 20px;
  }
  .action {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 40px;
    button {
      padding: 10px 0;
      width: 200px;
      cursor: pointer;
      background-color: aqua;
      margin-right: 20px;
      margin-left: 20px;
      border-radius: 26px;
      font-size: 1.8rem;
    }
  }
}
</style>
