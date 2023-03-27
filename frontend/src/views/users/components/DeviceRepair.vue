<template lang="">
  <div class="device">
    <div class="caption">Tablet</div>
    <img
      src="https://smartdata.tonytemplates.com/computer-repairs/demo3/wp-content/uploads/sites/5/2018/09/category-img-01.jpg"
      alt=""
    />
    <div class="content">
      <p>
        Computer Repair specializes in repairs of all kinds of Apple products
        including, MacBooks, iMacs, Mac Pros, Macbook retina and Mac Mini’s. We
        only Use Original Apple Parts we will never install a knock off part
        into your Mac product.
      </p>
      <button>Xem theem</button>
    </div>
  </div>
</template>
<script setup></script>
<style lang="scss" scoped>
.device {
  width: 33.3333%;
  padding: 0 20px;
  position: relative;
  margin-top: 20px;
  cursor: pointer;
  border-radius: 10px;
  overflow: hidden;
  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 10px;
    overflow: hidden;
  }
  .caption {
    position: absolute;
    top: 10%;
    left: 50px;
    font-size: 3rem;
    font-family: 800;
  }
  &:hover > .content {
    display: flex;
  }
}
.content {
  display: none;
  position: absolute;
  padding: 20px;
  top: 0;
  left: 20px;
  right: 20px;
  bottom: 0;
  border-radius: 10px;
  background-color: rgba($color: #000000, $alpha: 0.9);
  justify-content: center;
  flex-direction: column;
  align-items: center;
  p {
    font-size: 1.7rem;
    color: #fff;
    text-align: center;
  }
  button {
    margin-top: 20px;
    font-size: 1.8rem;
    width: 150px;
    padding: 10px 0px;
    border-radius: 5px;
  }
}
</style>
