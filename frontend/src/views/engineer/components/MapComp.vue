<template lang="">
  <ConfirmDialog> </ConfirmDialog>
  <div class="rounded overflow-hidden relative h-full">
    <div ref="mapDiv" style="width: 100%; height: 100%"></div>
    <div v-if="!route.fullPath.includes('preview')" class="form">
      <div class="wrap_form_search">
        <span class="form_search p-float-label p-input-icon-left">
          <i class="pi pi-search" />
          <InputText
            ref="input"
            @focus="showPopup = true"
            @input="handleSearch"
            id="value"
            v-model="searchRef"
            type="text"
            aria-describedby="text-error"
          />
          <label class="text-sm" for="value"
            >Hãy nhập địa điểm của bạn...</label
          >
        </span>
      </div>
      <div
        v-if="showPopup"
        :style="{ 'margin-top': positionList.length > 0 ? '6px' : '0px' }"
        class="position"
      >
        <div class="position_list">
          <ul>
            <li
              @click="
                handleShowInfo(
                  position.formatted_address,
                  position.name,
                  // position
                  position.geometry.location.lat(),
                  position.geometry.location.lng()
                )
              "
              v-for="position of positionList"
              :key="position.place_id"
            >
              <img src="@/assets/location.png" :alt="position.name" />
              <span
                ><b>{{ position.name }},</b>
                {{ position.formatted_address }}</span
              >
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import {
  ref,
  onMounted,
  onUnmounted,
  watch,
  defineEmits,
  computed,
  //   defineExpose,
} from "vue";
import { useConfirm } from "primevue/useconfirm";
import ConfirmDialog from "primevue/confirmdialog";
import { useGeolocation } from "@/helper/useGeolocation.js";
import { Loader } from "@googlemaps/js-api-loader";
import InputText from "primevue/inputtext";
import { defineProps } from "vue";
import { useRoute } from "vue-router";
const GOOGLE_MAPS_API_KEY = "AIzaSyADl3t1Xrjtwf58sZsq4wzqSuyWI1zySbM";
const emit = defineEmits(["setAddress"]);
let showPopup = ref(false);
const searchRef = ref("");
let positionList = ref([]);
var markers = [];
const route = useRoute();
const confirm = useConfirm();
const input = ref("");
const props = defineProps(["coor", "pathProfile"]);
const { coords } = useGeolocation();
const currPos = computed(() => ({
  lat: coords.value.latitude,
  lng: coords.value.longitude,
}));
const otherPos = ref(null);
const loader = new Loader({ apiKey: GOOGLE_MAPS_API_KEY });
const mapDiv = ref(null);
let map = ref(null);
let clickListener = null;
onMounted(async () => {
  await loader.load();
  map.value = new window.google.maps.Map(mapDiv.value, {
    center: new window.google.maps.LatLng(16.0545, 108.217),
    zoom: 12,
  });
  if (!route.fullPath.includes("preview")) {
    clickListener = map.value.addListener(
      "click",
      ({ latLng: { lat, lng } }) => {
        var geocoder = new window.google.maps.Geocoder();
        var latLng = new window.google.maps.LatLng(lat(), lng());
        geocoder.geocode(
          {
            latLng: latLng,
          },
          function (results, status) {
            if (status == window.google.maps.GeocoderStatus.OK) {
              if (results[1]) {
                handleShowInfo(
                  results[1].formatted_address,
                  undefined,
                  results[1].geometry.location.lat(),
                  results[1].geometry.location.lng()
                );
              } else {
                alert("No results found");
              }
            } else {
              alert("Geocoder failed due to: " + status);
            }
          }
        );
        return (otherPos.value = { lat: lat(), lng: lng() });
      }
    );
  } else {
    if (props.coor?.lat && props.coor?.lng) {
      map.value = new window.google.maps.Map(mapDiv.value, {
        center: new window.google.maps.LatLng(props.coor?.lat, props.coor?.lng),
        zoom: 12,
      });
    }
  }
});

onUnmounted(async () => {
  if (clickListener) clickListener.remove();
});
// var iconBase = "https://maps.google.com/mapfiles/kml/shapes/";
let newDistance = null;
// var directionsDisplay;
var myMarker;
var otherMarker;
watch([map, currPos, otherPos, () => props.coor], () => {
  if (otherMarker) {
    otherMarker.setMap(null);
  }
  handleSetMarkerUpdate();
  if (!route.fullPath.includes("preview")) {
    var origin1 = new window.google.maps.LatLng(
      currPos.value.lat,
      currPos.value.lng
    );

    myMarker = new window.google.maps.Marker({
      position: origin1,
      title: "My location!",
      icon: createIcon(
        "https://images.squarespace-cdn.com/content/v1/5e24773c72c72a5f12fe787d/1644781864949-3CL50TS4DXV9K1MOQ5FA/IMG-8008.PNG"
      ),
    });
    myMarker.setMap(map.value);
    var origin2 = new window.google.maps.LatLng(
      otherPos.value?.lat,
      otherPos.value?.lng
    );
    otherMarker = new window.google.maps.Marker({
      position: origin2,
      title: "New location!",
    });
    otherMarker.setMap(map.value);
    newDistance = new window.google.maps.DistanceMatrixService();
    newDistance.getDistanceMatrix(
      {
        origins: [origin1],
        destinations: [origin2],
        travelMode: "DRIVING",
      },
      getDistance
    );
  }
  // else {
  //   var coor = new window.google.maps.LatLng(props.coor?.lat, props.coor?.lng);
  //   console.log(coor);
  //   myMarker = new window.google.maps.Marker({
  //     position: coor,
  //     title: "My location!",
  //   });
  //   myMarker.setMap(map.value);
  // }

  //   var directionsService = new window.google.maps.DirectionsService();

  //   function dogetRedirect_map(position, roomLatlng) {
  //     if (directionsDisplay) {
  //       directionsDisplay.setMap(null);
  //     }
  //     directionsDisplay = new window.google.maps.DirectionsRenderer({
  //       suppressMarkers: true,
  //     });
  //     var request = {
  //       origin: position,
  //       destination: roomLatlng,
  //       travelMode: window.google.maps.TravelMode.DRIVING,
  //     };
  //     directionsDisplay.setMap(map.value); // map là biến google maps được tạo ở đoạn code bài trước
  //     directionsService.route(request, function (response, status) {
  //       if (status == window.google.maps.DirectionsStatus.OK) {
  //         directionsDisplay.setOptions({
  //           preserveViewport: true,
  //           suppressMarkers: true,
  //         });
  //         directionsDisplay.setDirections(response);
  //         // var myroute = response.routes[0]; // Kết quả trả về
  //         // var time = myroute.legs[0].duration.text; // Thời gian duy chuyển
  //         // var total = myroute.legs[0].distance.text; // Chiều dài đoạn đường duy chuyển
  //         // var from = myroute.legs[0].start_address; // Điểm xuất phát
  //         // var to = myroute.legs[0].end_address; // Điểm đến
  //       } else {
  //         console.log(status);
  //       }
  //     });
  //   }
  //   dogetRedirect_map(origin1, origin2);
});

function createIcon(url) {
  return {
    url: url, // url
    scaledSize: new window.google.maps.Size(30, 30), // scaled size
    origin: new window.google.maps.Point(0, 0), // origin
    anchor: new window.google.maps.Point(0, 0), // anchor
  };
}

const getDistance = (response, status) => {
  console.log(response, status);
};

function handleSearch() {
  if (markers.length > 0) {
    markers.forEach((marker) => {
      marker.setMap(null);
    });
  }
  const request = {
    query: searchRef.value,
  };
  var service = new window.google.maps.places.PlacesService(map.value);
  service.textSearch(request, (results, status) => {
    if (
      status === window.google.maps.places.PlacesServiceStatus.OK &&
      results
    ) {
      for (let i = 0; i < results.length; i++) {
        positionList.value = results;
        // createMarker(results[i]);
      }
      createMarker(results[0]);
      map.value.setCenter(results[0].geometry.location);
    }
  });
}

const handleShowInfo = (address, name, lat, lng) => {
  console.log(lat, lng);
  showPopup.value = false;
  confirm.require({
    message: `Địa chỉ của bạn: ${name ? `${name},` : ""} ${address}`,
    header: "Xác nhận",
    icon: "pi pi-exclamation-triangle",
    accept: () => {
      console.log(lat, lng);
      emit("setAddress", `${name ? `${name},` : ""} ${address}`, {
        lat: lat || props.coor.lat,
        lng: lng || props.coor.lng,
      });
    },
    reject: () => {},
  });
};

var marker;
function createMarker(place) {
  if (!place.geometry || !place.geometry.location) return;

  marker = new window.google.maps.Marker({
    map: map.value,
    position: place.geometry.location,
  });

  markers.push(marker);

  window.google.maps.event.addListener(marker, "click", () => {
    window.infowindow.setContent(place.name || "");
    window.infowindow.open(map.value);
  });
}

function handleSetMarkerUpdate() {
  if (props.coor?.lat && props.coor?.lng) {
    var origin3 = new window.google.maps.LatLng(
      props.coor?.lat,
      props.coor?.lng
    );
    var updateMarker = new window.google.maps.Marker({
      position: origin3,
      title: "My location!",
    });
    updateMarker.setMap(map.value);
  }
}
</script>
<style lang="scss" scoped>
:deep(.p-inputtext):focus ~ label {
  color: #000;
}
:deep(.p-dialog .p-dialog-content .p-confirm-dialog-message) {
  font-size: 16px !important;
}
.form {
  border-radius: 6px;
  position: absolute;
  width: 80%;
  top: 15%;
  left: 50%;
  transform: translateX(-50%);
  padding: 22px;
  // border-radius: 5px;
  .wrap_form_search {
    gap: 30px;
    display: flex;
    align-items: center;
    .form_search {
      border-radius: 6px;
      flex: 1;
      background-color: #fff;
    }
  }
  .position {
    background-color: #fff;
    border-radius: 6px;
    max-height: 200px;
    overflow-y: auto;

    .position_list {
      ul {
        list-style: none;
        li {
          padding: 10px 30px;
          display: flex;
          gap: 20px;
          align-items: center;
          img {
            width: 20px;
          }
          span {
            font-size: 13px;
          }
          &:hover {
            background-color: #ccc;
            cursor: pointer;
          }
        }
      }
    }
  }
}
::-webkit-scrollbar {
  width: 10px;
  height: 10px;
  border-radius: 5px;
}

::-webkit-scrollbar-thumb {
  background: rgba($color: #6366f1, $alpha: 1);
  border-radius: 6px;
}

::-webkit-scrollbar-track {
  border-radius: 6px;
  background: rgba($color: #ccc, $alpha: 0.5);
}
:deep(.p-float-label label) {
  margin-top: -0.4rem;
}
::vue-deep .p-button {
  border-radius: none !important;
}
:deep(.p-inputtext) {
  border-radius: none !important;
  width: 100%;
}
</style>
