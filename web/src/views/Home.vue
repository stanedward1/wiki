<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <p>what happen?</p>
    <a-button type="dashed">
      Dashed
    </a-button>
    <a-button type="danger">
      Danger
    </a-button>
    <HelloWorld msg="Welcome to Your Vue.js + TypeScript App"/>
  </div>
</template>

<script lang="ts">
import {defineComponent} from 'vue';
import HelloWorld from '@/components/HelloWorld.vue'; // @ is an alias to /src

export default defineComponent({
  name: 'Home',
  components: {
    HelloWorld,
  },
});
</script>
