export async function getDistance(origin, destination) {
  let distance;
  var newOrigin = new window.google.maps.LatLng(origin.lat, origin.lng);
  var newDestination = new window.google.maps.LatLng(
    destination.lat,
    destination.lng
  );
  let newDistance = new window.google.maps.DistanceMatrixService();
  await newDistance.getDistanceMatrix(
    {
      origins: [newOrigin],
      destinations: [newDestination],
      travelMode: "DRIVING",
    },
    (response) => {
      distance = response;
    }
  );
  return distance;
}
