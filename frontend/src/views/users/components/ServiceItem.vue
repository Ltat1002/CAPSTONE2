<template lang="">
  <div class="item">
    <box-icon
      name="laptop"
      animation="tada"
      rotate="180"
      size="70px"
    ></box-icon>
    <h3>Lap Top</h3>
  </div>
</template>
<script setup></script>
<style lang="scss" scoped>
.item {
  border-radius: 7px;
  width: 200px;
  background-color: #fff;
  margin-right: 10px;
  margin-left: 10px;
  padding: 10px;
  font-size: 2rem;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  position: relative;
  overflow: hidden;
  &::before {
    content: "";
    display: none;
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    background-color: rgba($color: #000000, $alpha: 0.5);
  }
  &:hover > ::before {
    display: block;
  }
}
</style>
