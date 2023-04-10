<template lang="">
  <div class="mt-10 mb-10">
    <div class="wrap flex">
      <div class="nav-bar">
        <div>
          <img
            src="https://scontent.fhan3-4.fna.fbcdn.net/v/t39.30808-6/323952197_567233611560466_7304591525322997827_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=uMNInV918rgAX8-icZN&_nc_ht=scontent.fhan3-4.fna&oh=00_AfAd5CoSVFqLGaBuT2Ls8jaBBUXR_p6p3cJim0iL3-mUPg&oe=64386504"
            alt=""
          />
          <div class="user-box">
            <h2>Lê Đình Trường</h2>
            <p>Ngày tham gia: 24/5/2021</p>
          </div>
        </div>
        <div class="info">
          <div class="info-sub">
            <div>
              <div>
                <h2>0702355627</h2>
              </div>
              <p>Mobile Number</p>
            </div>
            <div>
              <div>
                <h2>leanhkhanh6540@gmail.com</h2>
              </div>
              <p>Email Address</p>
            </div>

            <div>
              <div>
                <h2>Huees</h2>
              </div>
              <p>Address</p>
            </div>
          </div>
        </div>
      </div>
      <div class="content">
        <TabView>
          <TabPanel header="Profile">
            <div class="panel">
              <div class="bio-graph-heading">Hello Lee DINH TRUONg</div>
              <div class="panel-body bio-graph-info">
                <h1>Bio Graph</h1>
                <div class="row">
                  <div class="bio-row">
                    <p><span>First Name </span>: Camila</p>
                  </div>
                  <div class="bio-row">
                    <p><span>Last Name </span>: Smith</p>
                  </div>
                  <div class="bio-row">
                    <p><span>Country </span>: Australia</p>
                  </div>
                  <div class="bio-row">
                    <p><span>Birthday</span>: 13 July 1983</p>
                  </div>
                  <div class="bio-row">
                    <p><span>Occupation </span>: UI Designer</p>
                  </div>
                  <div class="bio-row">
                    <p><span>Email </span>: jsmith@flatlab.com</p>
                  </div>
                  <div class="bio-row">
                    <p><span>Mobile </span>: (12) 03 4567890</p>
                  </div>
                  <div class="bio-row">
                    <p><span>Phone </span>: 88 (02) 123456</p>
                  </div>
                </div>
              </div>
            </div>
          </TabPanel>
          <TabPanel header="Messages">
            <Message severity="success">
              <div>
                <h2>Info Message Content</h2>
                <p>20/04/2022</p>
              </div>
            </Message>
            <Message severity="success">
              <div>
                <h2>Info Message Content</h2>
                <p>20/04/2022</p>
              </div>
            </Message>
            <Message severity="success">
              <div>
                <h2>Info Message Content</h2>
                <p>20/04/2022</p>
              </div>
            </Message>
            <Message severity="success">
              <div>
                <h2>Info Message Content</h2>
                <p>20/04/2022</p>
              </div>
            </Message>
          </TabPanel>
          <TabPanel header="Edit profile">
            <div class="tab-pane" id="edit">
              <form>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"
                    >First name</label
                  >
                  <div class="col-lg-9">
                    <input class="form-control" type="text" value="Mark" />
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"
                    >Last name</label
                  >
                  <div class="col-lg-9">
                    <input class="form-control" type="text" value="Jhonsan" />
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"
                    >Email</label
                  >
                  <div class="col-lg-9">
                    <input
                      class="form-control"
                      type="email"
                      value="mark@example.com"
                    />
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"
                    >Website</label
                  >
                  <div class="col-lg-9">
                    <input class="form-control" type="url" value="" />
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"
                    >Address</label
                  >
                  <div class="col-lg-9">
                    <input
                      class="form-control"
                      type="text"
                      value=""
                      placeholder="Street"
                    />
                  </div>
                </div>
                <div class="form-group row">
                  <label
                    class="col-lg-3 col-form-label form-control-label"
                  ></label>
                  <div class="col-lg-6">
                    <input
                      class="form-control"
                      type="text"
                      value=""
                      placeholder="City"
                    />
                  </div>
                  <div class="col-lg-3">
                    <input
                      class="form-control"
                      type="text"
                      value=""
                      placeholder="State"
                    />
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"
                    >Username</label
                  >
                  <div class="col-lg-9">
                    <input
                      class="form-control"
                      type="text"
                      value="jhonsanmark"
                    />
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"
                    >Password</label
                  >
                  <div class="col-lg-9">
                    <input
                      class="form-control"
                      type="password"
                      value="11111122333"
                    />
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"
                    >Confirm password</label
                  >
                  <div class="col-lg-9">
                    <input
                      class="form-control"
                      type="password"
                      value="11111122333"
                    />
                  </div>
                </div>
                <div class="form-group row">
                  <label
                    class="col-lg-3 col-form-label form-control-label"
                  ></label>
                  <div class="col-lg-9">
                    <Button label="cancel" class="mr-2" severity="secondary" />
                    <Button label="save" class="ml-2" />
                  </div>
                </div>
              </form>
            </div>
          </TabPanel>
        </TabView>
      </div>
    </div>
  </div>
</template>
<script setup>
import TabView from "primevue/tabview";
import TabPanel from "primevue/tabpanel";
import Message from "primevue/message";
import Button from "primevue/button";
</script>
<style lang="scss" scoped>
.nav-bar {
  margin-right: 15px;
  width: 300px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  overflow: hidden;
  box-shadow: 0px 0px 8px #736666;
  > div {
    background-color: var(--sub-color);
    margin: auto;
    width: 100%;
    padding: 20px;
    color: #fff;
    img {
      margin: auto;
      width: 200px;
      height: 200px;
      object-fit: cover;
      border-radius: 50%;
    }
    .user-box {
      color: #fff;
      text-align: center;
      margin-top: 20px;
      h2 {
        font-weight: 500;
        line-height: 1.2;
        font-size: 1.2rem;
      }
    }
  }
  .info {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #fff;
    overflow: hidden;
    color: #000;
    .info-sub {
      border-radius: 5px;
      border: 1px solid #ccc;
      > div {
        border-bottom: 1px solid #ccc;
        width: 100%;
        display: flex;
        align-items: flex-start;
        padding: 15px 20px;
        flex-direction: column;
        &:last-child {
          border: none;
        }
        > div {
          display: flex;
          align-items: center;
          height: fit-content;
          h2 {
            flex: 1;
          }
        }
        p {
          font-weight: 300;
          line-height: 0.9;
          font-size: 0.8rem;
        }
      }
    }
  }
}
.content {
  padding: 20px;
  background-color: #fff;
  box-shadow: 0px 0px 8px #736666;
  flex: 1;
  margin-left: 15px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  overflow: hidden;
}
:deep(.p-tabview .p-tabview-nav li .p-tabview-nav-link) {
  padding: 20px 40px;
}
:deep(.p-tabview-nav .p-highlight .p-tabview-nav-link) {
  color: #fff !important;
  background-color: var(--sub-color) !important;
}
:deep(.p-button) {
  height: 40px;
}

.bio-graph-heading {
  background: var(--sub-color);
  color: #fff;
  text-align: center;
  font-style: italic;
  padding: 40px 110px;
  border-radius: 4px 4px 0 0;
  -webkit-border-radius: 4px 4px 0 0;
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 10px;
}
.bio-graph-info {
  color: #89817e;
}
.bio-graph-info h1 {
  font-size: 22px;
  font-weight: 300;
  margin: 0 0 20px;
}
.bio-row {
  width: 50%;
  float: left;
  margin-bottom: 10px;
  padding: 0 15px;
}
.bio-row p span {
  width: 100px;
  display: inline-block;
}
.bio-chart,
.bio-desk {
  float: left;
}
.bio-chart {
  width: 40%;
}
.bio-desk {
  width: 60%;
}
.bio-desk h4 {
  font-size: 15px;
  font-weight: 400;
}
.bio-desk h4.terques {
  color: #4cc5cd;
}
.bio-desk h4.red {
  color: #e26b7f;
}
.bio-desk h4.green {
  color: #97be4b;
}
.bio-desk h4.purple {
  color: #caa3da;
}
.file-pos {
  margin: 6px 0 10px 0;
}
</style>
