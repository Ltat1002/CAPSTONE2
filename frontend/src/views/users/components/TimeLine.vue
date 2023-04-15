<template lang="">
  <div class="min-h-screen bg-gray-100">
    <div class="min-h-screen flex justify-center">
      <div class="w-2/3 mx-auto">
        <div class="flex flex-row w-full cursor-pointer">
          <!-- left col -->

          <div class="w-2/5 px-2 py-10">
            <div
              class="flex flex-col w-full rounded-lg shadow bg-white px-4 py-5"
            >
              <div class="text-gray-600 mb-2 flex justify-between">
                <div class="font-bold">Đơn 1</div>
                <div class="flex flex-row">
                  <button
                    class="text-blue-500 mr-2 hover:text-blue-300 transition duration-200"
                  >
                    <i class="far fa-edit"></i>
                  </button>
                  <button
                    class="text-red-500 hover:text-red-300 transition duration-200"
                  >
                    <i class="far fa-trash-alt"></i>
                  </button>
                </div>
              </div>
              <div class="text-gray-600">Thông tin đơn 1</div>
            </div>
          </div>
          <!--line column-->
          <div class="w-1/5 flex justify-center">
            <div
              class="relative flex h-full w-1 bg-green-300 items-center justify-center"
            >
              <div
                class="absolute flex flex-col justify-center h-24 w-24 rounded-full border-2 border-green-300 leading-none text-center z-10 bg-white font-thin"
              >
                <div>20</div>
                <div>Tháng 1</div>
              </div>
            </div>
          </div>
          <!--right column-->
          <div class="w-2/5 px-2 py-10"></div>
        </div>
        <div class="flex flex-row w-full cursor-pointer">
          <!-- left col -->

          <div class="w-2/5 px-2 py-10"></div>
          <!--line column-->
          <div class="w-1/5 flex justify-center">
            <div
              class="relative flex h-full w-1 bg-green-300 items-center justify-center"
            >
              <div
                class="absolute flex flex-col justify-center h-24 w-24 rounded-full border-2 border-green-300 leading-none text-center z-10 bg-white font-thin"
              >
                <div>20</div>
                <div>Tháng 2</div>
              </div>
            </div>
          </div>
          <!--right column-->
          <div class="w-2/5 px-2 py-10">
            <div
              class="flex flex-col w-full rounded-lg shadow bg-white px-4 py-5"
            >
              <div class="text-gray-600 mb-2 flex justify-between">
                <div class="font-bold">Đơn 2</div>
              </div>
              <div class="text-gray-600">Thông tin đơn 2</div>
            </div>
          </div>
        </div>
        <div class="flex flex-row w-full cursor-pointer">
          <!-- left col -->

          <div class="w-2/5 px-2 py-10">
            <div
              class="flex flex-col w-full rounded-lg shadow bg-white px-4 py-5"
            >
              <div class="text-gray-600 mb-2 flex justify-between">
                <div class="font-bold">Đơn 3</div>
                <div class="flex flex-row">
                  <button
                    class="text-blue-500 mr-2 hover:text-blue-300 transition duration-200"
                  >
                    <i class="far fa-edit"></i>
                  </button>
                  <button
                    class="text-red-500 hover:text-red-300 transition duration-200"
                  >
                    <i class="far fa-trash-alt"></i>
                  </button>
                </div>
              </div>
              <div class="text-gray-600">Thông tin đơn 3</div>
            </div>
          </div>
          <!--line column-->
          <div class="w-1/5 flex justify-center">
            <div
              class="relative flex h-full w-1 bg-green-300 items-center justify-center"
            >
              <div
                class="absolute flex flex-col justify-center h-24 w-24 rounded-full border-2 border-green-300 leading-none text-center z-10 bg-white font-thin"
              >
                <div>20</div>
                <div>Tháng 3</div>
              </div>
            </div>
          </div>
          <!--right column-->
          <div class="w-2/5 px-2 py-10"></div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup></script>
<style lang="scss" scoped></style>
