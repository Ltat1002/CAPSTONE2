<template lang="">
  <div class="item">
    <box-icon name="laptop" class="active" size="70px"></box-icon>
    <h3>Lap Top</h3>
  </div>
</template>
<script setup></script>
<style lang="scss" scoped>
.item {
  border-radius: 7px;
  width: 16%;
  background-color: #fff;
  margin-right: 10px;
  margin-left: 10px;
  padding: 26px;
  font-size: 2rem;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  position: relative;
  z-index: 10;
  h3 {
    position: relative;
  }
  &::after {
    content: "";
    position: absolute;
    height: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: #d90429;
    transition: height 200ms linear;
    z-index: -1;
    border-radius: 7px;
  }
  &::before {
    content: "";
    position: absolute;
    width: 0px;
    height: 0px;
    left: 0;
    bottom: -15px;
    right: 0;
    margin: 0 auto;
    border-left: 15px solid transparent;
    border-right: 15px solid transparent;
    border-top: 15px solid #d90429;
    z-index: 1;
    transition: transform 0.4s ease, -webkit-transform 0.4s ease;
    display: none;
  }
  &:hover::after {
    height: 100%;
  }
  &:hover::after + h3 {
    color: #fff;
  }
  &:hover::before {
    display: block;
  }
}
</style>
