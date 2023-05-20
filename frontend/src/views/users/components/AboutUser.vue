<template lang="">
  <div class="wrap">
    <div class="about">
      <div class="about--image">
        <div>
          <img
            src="https://mehedi.asiandevelopers.com/demo/roofan-html/assets/images/about/about-style1-img-1.jpg"
            alt=""
          />
        </div>
        <div>
          <img
            src="https://mehedi.asiandevelopers.com/demo/roofan-html/assets/images/about/about-style1-img-1.jpg"
            alt=""
          />
          <div class="service">
            <box-icon name="like" size="lg"></box-icon>
            <h3>Dịch vụ sửa chửa tại nhà</h3>
          </div>
        </div>
      </div>
      <div class="about--description">
        <div>
          <div class="border-left"></div>
          <h5>Chứng nhận sửa chữa</h5>
        </div>
        <h2>Nên lựa chọn các dịch vụ sửa thiết bị gia dụng tại nhà?</h2>
        <p>1. Tiết kiệm thời gian</p>
        <p>2. Tiết kiệm công sức</p>
        <p>
          3. Tranh thủ được thời gian rảnh của bạn Hãy đến với website HRS của
          chúng tôi, các bạn sẽ không phải đắn đo và ngồi mò từng cửa hàng sửa
          chưa thiết bị gia dụng. Thay vào đó người dùng chỉ cần chọn lọc thiết
          bị cần sửa và tự đặt cho mình một dịch vụ sửa thiết bị gia dụng tại
          nhà
        </p>
        <div class="signature">
          <div class="left">
            <img
              src="https://mehedi.asiandevelopers.com/demo/roofan-html/assets/images/about/manager-1.jpg"
              alt=""
            />
            <div>
              <h3>Sombert Joe</h3>
              <span>Manager</span>
            </div>
          </div>
          <div class="right">
            <img
              src="https://mehedi.asiandevelopers.com/demo/roofan-html/assets/images/about/manager-signature-1.png"
              alt=""
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script></script>
<style lang="scss" scoped>
.signature {
  .left {
    img {
      border-radius: 100%;
    }
    div {
      display: flex;
      flex-direction: column;
      span {
        position: relative;
        display: block;
        color: var(--red);
        font-size: 20px;
        line-height: 20px;
        font-weight: 700;
      }
    }
  }
}
.about {
  display: flex;
  margin: 30px -50px;
  .about--image {
    display: flex;
    align-items: center;
    padding: 50px;
    margin: -20px;
    > div {
      height: 500px;
      &:first-child {
        margin-top: 105px;
        padding: 20px;
        height: 440px;
      }
      &:last-child {
        position: relative;
        img {
          height: 80%;
          width: auto;
        }
        .service {
          height: 20%;
          width: 140%;
          background-color: gold;
          padding: 20px 20px;
          position: relative;
          right: 40%;
          display: flex;
          justify-content: space-between;
          align-items: center;
          h3 {
            text-align: center;
          }
        }
      }
      img {
        height: 100%;
        width: auto;
        max-width: none;
        object-fit: cover;
      }
    }
  }
  .about--description {
    padding: 50px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    div {
      display: flex;
      align-items: center;
    }
  }
}

h3 {
  font-size: 22px;
  line-height: 30px;
  font-weight: 600;
}
h2 {
  font-size: 45px;
  line-height: 1.2em;
  font-weight: 900;
  text-transform: none;
}
h5 {
  font-size: 14px;
  line-height: 24px;
  font-weight: 900;
  text-transform: uppercase;
  letter-spacing: 0;
  color: var(--red);
}
p {
  font-size: 18px;
}
</style>
