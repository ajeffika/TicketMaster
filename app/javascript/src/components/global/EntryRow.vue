<template>
  <v-col cols="12" md="11" offset-md="1" class="mt-8">
    <v-avatar class="float-left" tile color="blue" width="75" height="75">
      <img src="https://cdn.vuetifyjs.com/images/john.jpg" alt="John">
    </v-avatar>
    <div class="float-left ml-4">
      <span class="title primary px-1">{{entry.name}}</span>
      <div class="display-1 primary--text">{{entry.title}}</div>
      <span class="subtitle-1 white--text">{{entry.description}}</span>
    </div>
  </v-col>
</template>

<script>
  export default {
    name: 'EntryRow',
    props: ['entry']
  }
</script>
